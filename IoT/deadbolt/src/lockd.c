/* lockd - Deadbolt smart lock controller
 * Recovered from the device flash. Speaks the Deadbolt wire protocol on TCP 6000.
 *
 * The device signs every token it hands out so a client can trust it came from
 * the lock. The admin console uses the same signature to authorize privileged
 * commands.
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <time.h>
#include <fcntl.h>
#include <signal.h>
#include <sys/socket.h>
#include <sys/wait.h>
#include <netinet/in.h>
#include <arpa/inet.h>

/* ------------------------------------------------------------------ SHA-256 */
typedef struct { uint32_t s[8]; uint64_t len; unsigned char buf[64]; size_t n; } sha256_ctx;

static const uint32_t K256[64] = {
0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,
0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,
0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2};

#define ROR(x,n) (((x)>>(n))|((x)<<(32-(n))))
static void sha256_block(sha256_ctx *c, const unsigned char *p) {
    uint32_t w[64], a,b,cc,d,e,f,g,h,t1,t2;
    for (int i=0;i<16;i++) w[i]=(p[i*4]<<24)|(p[i*4+1]<<16)|(p[i*4+2]<<8)|p[i*4+3];
    for (int i=16;i<64;i++){
        uint32_t s0=ROR(w[i-15],7)^ROR(w[i-15],18)^(w[i-15]>>3);
        uint32_t s1=ROR(w[i-2],17)^ROR(w[i-2],19)^(w[i-2]>>10);
        w[i]=w[i-16]+s0+w[i-7]+s1;
    }
    a=c->s[0];b=c->s[1];cc=c->s[2];d=c->s[3];e=c->s[4];f=c->s[5];g=c->s[6];h=c->s[7];
    for (int i=0;i<64;i++){
        uint32_t S1=ROR(e,6)^ROR(e,11)^ROR(e,25);
        uint32_t ch=(e&f)^((~e)&g);
        t1=h+S1+ch+K256[i]+w[i];
        uint32_t S0=ROR(a,2)^ROR(a,13)^ROR(a,22);
        uint32_t maj=(a&b)^(a&cc)^(b&cc);
        t2=S0+maj;
        h=g;g=f;f=e;e=d+t1;d=cc;cc=b;b=a;a=t1+t2;
    }
    c->s[0]+=a;c->s[1]+=b;c->s[2]+=cc;c->s[3]+=d;c->s[4]+=e;c->s[5]+=f;c->s[6]+=g;c->s[7]+=h;
}
static void sha256_init(sha256_ctx *c){
    c->s[0]=0x6a09e667;c->s[1]=0xbb67ae85;c->s[2]=0x3c6ef372;c->s[3]=0xa54ff53a;
    c->s[4]=0x510e527f;c->s[5]=0x9b05688c;c->s[6]=0x1f83d9ab;c->s[7]=0x5be0cd19;
    c->len=0;c->n=0;
}
static void sha256_update(sha256_ctx *c, const unsigned char *p, size_t n){
    c->len+=n;
    while(n){
        size_t k=64-c->n; if(k>n)k=n;
        memcpy(c->buf+c->n,p,k); c->n+=k; p+=k; n-=k;
        if(c->n==64){ sha256_block(c,c->buf); c->n=0; }
    }
}
static void sha256_final(sha256_ctx *c, unsigned char out[32]){
    uint64_t bits=c->len*8; unsigned char pad=0x80;
    sha256_update(c,&pad,1);
    unsigned char z=0; while(c->n!=56) sha256_update(c,&z,1);
    unsigned char L[8]; for(int i=0;i<8;i++) L[i]=(bits>>(56-8*i))&0xff;
    sha256_update(c,L,8);
    for(int i=0;i<8;i++){ out[i*4]=c->s[i]>>24;out[i*4+1]=c->s[i]>>16;out[i*4+2]=c->s[i]>>8;out[i*4+3]=c->s[i]; }
}
static void hexify(const unsigned char *in, size_t n, char *out){
    static const char *h="0123456789abcdef";
    for(size_t i=0;i<n;i++){ out[i*2]=h[in[i]>>4]; out[i*2+1]=h[in[i]&15]; }
    out[n*2]='\0';
}

/* ------------------------------------------------------------- device secret */
/* The signing key never leaves the lock. On the real hardware it is fused in at
 * manufacture; here it comes from the environment. Its length is part of what
 * keeps it secret. */
static unsigned char g_secret[64];
static size_t g_secret_len;

static void load_secret(void){
    const char *k = getenv("DEVICE_KEY");
    if (k && *k) {
        g_secret_len = strlen(k);
        if (g_secret_len > sizeof(g_secret)) g_secret_len = sizeof(g_secret);
        memcpy(g_secret, k, g_secret_len);
    } else {
        /* development default so the firmware runs stand-alone off the bench */
        const char *d = "d3adb0lt.dev.key";
        g_secret_len = strlen(d);
        memcpy(g_secret, d, g_secret_len);
    }
}

/* sig = SHA256(secret || msg), lowercase hex */
static void device_sign(const unsigned char *msg, size_t n, char out[65]){
    sha256_ctx c; unsigned char dg[32];
    sha256_init(&c);
    sha256_update(&c, g_secret, g_secret_len);
    sha256_update(&c, msg, n);
    sha256_final(&c, dg);
    hexify(dg, 32, out);
}

/* ------------------------------------------------------------------- framing */
/* wire = 0xDB 0x01 | len[2] BE | payload^keystream. keystream: k=0x5a; k=k*33+7 */
static void mask(unsigned char *p, size_t n){
    unsigned char k=0x5a;
    for(size_t i=0;i<n;i++){ p[i]^=k; k=(unsigned char)(k*33+7); }
}
static int read_all(int fd, unsigned char *p, size_t n){
    size_t got=0; while(got<n){ ssize_t r=read(fd,p+got,n-got); if(r<=0) return -1; got+=r; } return 0;
}
static int recv_frame(int fd, unsigned char *out, size_t *outlen, size_t cap){
    unsigned char hdr[4];
    if(read_all(fd,hdr,4)) return -1;
    if(hdr[0]!=0xDB || hdr[1]!=0x01) return -1;
    size_t len=(hdr[2]<<8)|hdr[3];
    if(len>cap) return -1;
    if(len && read_all(fd,out,len)) return -1;
    mask(out,len);
    *outlen=len;
    return 0;
}
static void send_frame(int fd, const unsigned char *p, size_t n){
    unsigned char hdr[4]={0xDB,0x01,(unsigned char)(n>>8),(unsigned char)(n&0xff)};
    unsigned char *buf=malloc(n); memcpy(buf,p,n); mask(buf,n);
    write(fd,hdr,4); if(n) write(fd,buf,n); free(buf);
}
static void send_text(int fd, const char *s){ send_frame(fd,(const unsigned char*)s,strlen(s)); }

/* -------------------------------------------------------------- msg parsing */
/* Scan len-delimited buffer for key=value pairs separated by '&'. Junk tokens
 * (no '='), and anything non-printable, are skipped. When a key repeats the
 * last occurrence wins -- that's how the console lets an operator override the
 * default role on the query string. */
static void get_field(const unsigned char *msg, size_t n, const char *key,
                      char *val, size_t vcap){
    val[0]='\0';
    size_t klen=strlen(key);
    size_t i=0;
    while(i<n){
        size_t j=i; while(j<n && msg[j]!='&') j++;      /* token = [i,j) */
        size_t eq=i; while(eq<j && msg[eq]!='=') eq++;
        if(eq<j){
            size_t klen2=eq-i;
            if(klen2==klen && memcmp(msg+i,key,klen)==0){
                size_t vlen=j-(eq+1);
                if(vlen<vcap){ memcpy(val,msg+eq+1,vlen); val[vlen]='\0'; } /* last wins: keep scanning */
            }
        }
        i=j+1;
    }
}

/* find last occurrence of "&sig=" in a byte buffer */
static long find_sig(const unsigned char *msg, size_t n){
    const char *pat="&sig="; size_t pl=5;
    if(n<pl) return -1;
    for(long i=(long)(n-pl); i>=0; i--) if(memcmp(msg+i,pat,pl)==0) return i;
    return -1;
}

/* --------------------------------------------------------------- session */
static void gen_nonce(char out[33]){
    unsigned char r[16];
    int fd=open("/dev/urandom",O_RDONLY);
    if(fd<0 || read(fd,r,16)!=16){ for(int i=0;i<16;i++) r[i]=rand(); }
    if(fd>=0) close(fd);
    hexify(r,16,out);
}

static void handle(int fd){
    char nonce[33];
    gen_nonce(nonce);

    /* device hello: a guest token signed by the lock so the client can trust us */
    unsigned char msg[8192]; size_t mlen;
    char sig[65];
    char base[256];
    int bl=snprintf(base,sizeof base,"salt=%s&uid=1000&role=guest",nonce);
    device_sign((unsigned char*)base,bl,sig);
    char hello[512];
    int hl=snprintf(hello,sizeof hello,"%s&sig=%s",base,sig);
    send_frame(fd,(unsigned char*)hello,hl);

    for(;;){
        if(recv_frame(fd,msg,&mlen,sizeof msg)) return;
        if(mlen==0) continue;

        char cmd[64]; get_field(msg,mlen,"cmd",cmd,sizeof cmd);

        /* unauthenticated commands */
        if(strcmp(cmd,"ping")==0){ send_text(fd,"pong"); continue; }
        if(strcmp(cmd,"status")==0){ send_text(fd,"state=locked&fw=1.4.2&model=DB-2000"); continue; }
        if(strcmp(cmd,"quit")==0){ return; }

        /* everything else must carry a valid device signature */
        long sp=find_sig(msg,mlen);
        if(sp<0){ send_text(fd,"err=unsigned"); continue; }
        size_t signed_len=(size_t)sp;
        char got[65]; size_t glen=mlen-(sp+5);
        if(glen!=64){ send_text(fd,"err=badsig"); continue; }
        memcpy(got,msg+sp+5,64); got[64]='\0';

        char want[65];
        device_sign(msg,signed_len,want);
        if(strcmp(got,want)!=0){ send_text(fd,"err=badsig"); continue; }

        /* signature valid: honor the message */
        char role[64]; get_field(msg,signed_len,"role",role,sizeof role);
        char c2[64];   get_field(msg,signed_len,"cmd",c2,sizeof c2);

        if(strcmp(role,"admin")!=0){ send_text(fd,"err=denied&need=admin"); continue; }

        if(strcmp(c2,"dump")==0){
            const char *flag=getenv("FLAG");
            if(!flag||!*flag) flag="DNCTF{local_dev_instance_not_the_real_flag}";
            char out[512];
            snprintf(out,sizeof out,"ok=1&vault=%s",flag);
            send_text(fd,out);
            return;
        }
        if(strcmp(c2,"unlock")==0){ send_text(fd,"ok=1&state=unlocked"); continue; }
        send_text(fd,"err=unknown_cmd");
    }
}

int main(void){
    signal(SIGCHLD,SIG_IGN);
    signal(SIGPIPE,SIG_IGN);
    setvbuf(stdout,NULL,_IONBF,0);
    srand(time(NULL)^getpid());
    load_secret();

    const char *ps=getenv("PORT"); int port=ps?atoi(ps):6000;
    int s=socket(AF_INET,SOCK_STREAM,0);
    int one=1; setsockopt(s,SOL_SOCKET,SO_REUSEADDR,&one,sizeof one);
    struct sockaddr_in a; memset(&a,0,sizeof a);
    a.sin_family=AF_INET; a.sin_addr.s_addr=INADDR_ANY; a.sin_port=htons(port);
    if(bind(s,(struct sockaddr*)&a,sizeof a)){ perror("bind"); return 1; }
    listen(s,16);
    fprintf(stderr,"lockd listening on %d\n",port);

    for(;;){
        struct sockaddr_in c; socklen_t cl=sizeof c;
        int fd=accept(s,(struct sockaddr*)&c,&cl);
        if(fd<0) continue;
        pid_t pid=fork();
        if(pid==0){ close(s); handle(fd); close(fd); _exit(0); }
        close(fd);
    }
}
