
usr/bin/lockd:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <.init>:
    1000:	f3 0f 1e fa          	endbr64
    1004:	48 83 ec 08          	sub    rsp,0x8
    1008:	48 8b 05 d9 3f 00 00 	mov    rax,QWORD PTR [rip+0x3fd9]        # 4fe8 <socket@plt+0x3bf8>
    100f:	48 85 c0             	test   rax,rax
    1012:	74 02                	je     1016 <__cxa_finalize@plt-0x1fa>
    1014:	ff d0                	call   rax
    1016:	48 83 c4 08          	add    rsp,0x8
    101a:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 b2 3e 00 00    	push   QWORD PTR [rip+0x3eb2]        # 4ed8 <socket@plt+0x3ae8>
    1026:	ff 25 b4 3e 00 00    	jmp    QWORD PTR [rip+0x3eb4]        # 4ee0 <socket@plt+0x3af0>
    102c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1030:	f3 0f 1e fa          	endbr64
    1034:	68 00 00 00 00       	push   0x0
    1039:	e9 e2 ff ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    103e:	66 90                	xchg   ax,ax
    1040:	f3 0f 1e fa          	endbr64
    1044:	68 01 00 00 00       	push   0x1
    1049:	e9 d2 ff ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    104e:	66 90                	xchg   ax,ax
    1050:	f3 0f 1e fa          	endbr64
    1054:	68 02 00 00 00       	push   0x2
    1059:	e9 c2 ff ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    105e:	66 90                	xchg   ax,ax
    1060:	f3 0f 1e fa          	endbr64
    1064:	68 03 00 00 00       	push   0x3
    1069:	e9 b2 ff ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    106e:	66 90                	xchg   ax,ax
    1070:	f3 0f 1e fa          	endbr64
    1074:	68 04 00 00 00       	push   0x4
    1079:	e9 a2 ff ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    107e:	66 90                	xchg   ax,ax
    1080:	f3 0f 1e fa          	endbr64
    1084:	68 05 00 00 00       	push   0x5
    1089:	e9 92 ff ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    108e:	66 90                	xchg   ax,ax
    1090:	f3 0f 1e fa          	endbr64
    1094:	68 06 00 00 00       	push   0x6
    1099:	e9 82 ff ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    109e:	66 90                	xchg   ax,ax
    10a0:	f3 0f 1e fa          	endbr64
    10a4:	68 07 00 00 00       	push   0x7
    10a9:	e9 72 ff ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    10ae:	66 90                	xchg   ax,ax
    10b0:	f3 0f 1e fa          	endbr64
    10b4:	68 08 00 00 00       	push   0x8
    10b9:	e9 62 ff ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    10be:	66 90                	xchg   ax,ax
    10c0:	f3 0f 1e fa          	endbr64
    10c4:	68 09 00 00 00       	push   0x9
    10c9:	e9 52 ff ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    10ce:	66 90                	xchg   ax,ax
    10d0:	f3 0f 1e fa          	endbr64
    10d4:	68 0a 00 00 00       	push   0xa
    10d9:	e9 42 ff ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    10de:	66 90                	xchg   ax,ax
    10e0:	f3 0f 1e fa          	endbr64
    10e4:	68 0b 00 00 00       	push   0xb
    10e9:	e9 32 ff ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    10ee:	66 90                	xchg   ax,ax
    10f0:	f3 0f 1e fa          	endbr64
    10f4:	68 0c 00 00 00       	push   0xc
    10f9:	e9 22 ff ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    10fe:	66 90                	xchg   ax,ax
    1100:	f3 0f 1e fa          	endbr64
    1104:	68 0d 00 00 00       	push   0xd
    1109:	e9 12 ff ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    110e:	66 90                	xchg   ax,ax
    1110:	f3 0f 1e fa          	endbr64
    1114:	68 0e 00 00 00       	push   0xe
    1119:	e9 02 ff ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    111e:	66 90                	xchg   ax,ax
    1120:	f3 0f 1e fa          	endbr64
    1124:	68 0f 00 00 00       	push   0xf
    1129:	e9 f2 fe ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    112e:	66 90                	xchg   ax,ax
    1130:	f3 0f 1e fa          	endbr64
    1134:	68 10 00 00 00       	push   0x10
    1139:	e9 e2 fe ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    113e:	66 90                	xchg   ax,ax
    1140:	f3 0f 1e fa          	endbr64
    1144:	68 11 00 00 00       	push   0x11
    1149:	e9 d2 fe ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    114e:	66 90                	xchg   ax,ax
    1150:	f3 0f 1e fa          	endbr64
    1154:	68 12 00 00 00       	push   0x12
    1159:	e9 c2 fe ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    115e:	66 90                	xchg   ax,ax
    1160:	f3 0f 1e fa          	endbr64
    1164:	68 13 00 00 00       	push   0x13
    1169:	e9 b2 fe ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    116e:	66 90                	xchg   ax,ax
    1170:	f3 0f 1e fa          	endbr64
    1174:	68 14 00 00 00       	push   0x14
    1179:	e9 a2 fe ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    117e:	66 90                	xchg   ax,ax
    1180:	f3 0f 1e fa          	endbr64
    1184:	68 15 00 00 00       	push   0x15
    1189:	e9 92 fe ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    118e:	66 90                	xchg   ax,ax
    1190:	f3 0f 1e fa          	endbr64
    1194:	68 16 00 00 00       	push   0x16
    1199:	e9 82 fe ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    119e:	66 90                	xchg   ax,ax
    11a0:	f3 0f 1e fa          	endbr64
    11a4:	68 17 00 00 00       	push   0x17
    11a9:	e9 72 fe ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    11ae:	66 90                	xchg   ax,ax
    11b0:	f3 0f 1e fa          	endbr64
    11b4:	68 18 00 00 00       	push   0x18
    11b9:	e9 62 fe ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    11be:	66 90                	xchg   ax,ax
    11c0:	f3 0f 1e fa          	endbr64
    11c4:	68 19 00 00 00       	push   0x19
    11c9:	e9 52 fe ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    11ce:	66 90                	xchg   ax,ax
    11d0:	f3 0f 1e fa          	endbr64
    11d4:	68 1a 00 00 00       	push   0x1a
    11d9:	e9 42 fe ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    11de:	66 90                	xchg   ax,ax
    11e0:	f3 0f 1e fa          	endbr64
    11e4:	68 1b 00 00 00       	push   0x1b
    11e9:	e9 32 fe ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    11ee:	66 90                	xchg   ax,ax
    11f0:	f3 0f 1e fa          	endbr64
    11f4:	68 1c 00 00 00       	push   0x1c
    11f9:	e9 22 fe ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    11fe:	66 90                	xchg   ax,ax
    1200:	f3 0f 1e fa          	endbr64
    1204:	68 1d 00 00 00       	push   0x1d
    1209:	e9 12 fe ff ff       	jmp    1020 <__cxa_finalize@plt-0x1f0>
    120e:	66 90                	xchg   ax,ax

Disassembly of section .plt.got:

0000000000001210 <__cxa_finalize@plt>:
    1210:	f3 0f 1e fa          	endbr64
    1214:	ff 25 de 3d 00 00    	jmp    QWORD PTR [rip+0x3dde]        # 4ff8 <socket@plt+0x3c08>
    121a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

Disassembly of section .plt.sec:

0000000000001220 <getenv@plt>:
    1220:	f3 0f 1e fa          	endbr64
    1224:	ff 25 be 3c 00 00    	jmp    QWORD PTR [rip+0x3cbe]        # 4ee8 <socket@plt+0x3af8>
    122a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001230 <__snprintf_chk@plt>:
    1230:	f3 0f 1e fa          	endbr64
    1234:	ff 25 b6 3c 00 00    	jmp    QWORD PTR [rip+0x3cb6]        # 4ef0 <socket@plt+0x3b00>
    123a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001240 <free@plt>:
    1240:	f3 0f 1e fa          	endbr64
    1244:	ff 25 ae 3c 00 00    	jmp    QWORD PTR [rip+0x3cae]        # 4ef8 <socket@plt+0x3b08>
    124a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001250 <_exit@plt>:
    1250:	f3 0f 1e fa          	endbr64
    1254:	ff 25 a6 3c 00 00    	jmp    QWORD PTR [rip+0x3ca6]        # 4f00 <socket@plt+0x3b10>
    125a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001260 <setsockopt@plt>:
    1260:	f3 0f 1e fa          	endbr64
    1264:	ff 25 9e 3c 00 00    	jmp    QWORD PTR [rip+0x3c9e]        # 4f08 <socket@plt+0x3b18>
    126a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001270 <write@plt>:
    1270:	f3 0f 1e fa          	endbr64
    1274:	ff 25 96 3c 00 00    	jmp    QWORD PTR [rip+0x3c96]        # 4f10 <socket@plt+0x3b20>
    127a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001280 <getpid@plt>:
    1280:	f3 0f 1e fa          	endbr64
    1284:	ff 25 8e 3c 00 00    	jmp    QWORD PTR [rip+0x3c8e]        # 4f18 <socket@plt+0x3b28>
    128a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001290 <strlen@plt>:
    1290:	f3 0f 1e fa          	endbr64
    1294:	ff 25 86 3c 00 00    	jmp    QWORD PTR [rip+0x3c86]        # 4f20 <socket@plt+0x3b30>
    129a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000012a0 <__stack_chk_fail@plt>:
    12a0:	f3 0f 1e fa          	endbr64
    12a4:	ff 25 7e 3c 00 00    	jmp    QWORD PTR [rip+0x3c7e]        # 4f28 <socket@plt+0x3b38>
    12aa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000012b0 <close@plt>:
    12b0:	f3 0f 1e fa          	endbr64
    12b4:	ff 25 76 3c 00 00    	jmp    QWORD PTR [rip+0x3c76]        # 4f30 <socket@plt+0x3b40>
    12ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000012c0 <read@plt>:
    12c0:	f3 0f 1e fa          	endbr64
    12c4:	ff 25 6e 3c 00 00    	jmp    QWORD PTR [rip+0x3c6e]        # 4f38 <socket@plt+0x3b48>
    12ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000012d0 <srand@plt>:
    12d0:	f3 0f 1e fa          	endbr64
    12d4:	ff 25 66 3c 00 00    	jmp    QWORD PTR [rip+0x3c66]        # 4f40 <socket@plt+0x3b50>
    12da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000012e0 <memcmp@plt>:
    12e0:	f3 0f 1e fa          	endbr64
    12e4:	ff 25 5e 3c 00 00    	jmp    QWORD PTR [rip+0x3c5e]        # 4f48 <socket@plt+0x3b58>
    12ea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000012f0 <strcmp@plt>:
    12f0:	f3 0f 1e fa          	endbr64
    12f4:	ff 25 56 3c 00 00    	jmp    QWORD PTR [rip+0x3c56]        # 4f50 <socket@plt+0x3b60>
    12fa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001300 <signal@plt>:
    1300:	f3 0f 1e fa          	endbr64
    1304:	ff 25 4e 3c 00 00    	jmp    QWORD PTR [rip+0x3c4e]        # 4f58 <socket@plt+0x3b68>
    130a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001310 <__memcpy_chk@plt>:
    1310:	f3 0f 1e fa          	endbr64
    1314:	ff 25 46 3c 00 00    	jmp    QWORD PTR [rip+0x3c46]        # 4f60 <socket@plt+0x3b70>
    131a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001320 <memcpy@plt>:
    1320:	f3 0f 1e fa          	endbr64
    1324:	ff 25 3e 3c 00 00    	jmp    QWORD PTR [rip+0x3c3e]        # 4f68 <socket@plt+0x3b78>
    132a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001330 <time@plt>:
    1330:	f3 0f 1e fa          	endbr64
    1334:	ff 25 36 3c 00 00    	jmp    QWORD PTR [rip+0x3c36]        # 4f70 <socket@plt+0x3b80>
    133a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001340 <__isoc23_strtol@plt>:
    1340:	f3 0f 1e fa          	endbr64
    1344:	ff 25 2e 3c 00 00    	jmp    QWORD PTR [rip+0x3c2e]        # 4f78 <socket@plt+0x3b88>
    134a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001350 <malloc@plt>:
    1350:	f3 0f 1e fa          	endbr64
    1354:	ff 25 26 3c 00 00    	jmp    QWORD PTR [rip+0x3c26]        # 4f80 <socket@plt+0x3b90>
    135a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001360 <listen@plt>:
    1360:	f3 0f 1e fa          	endbr64
    1364:	ff 25 1e 3c 00 00    	jmp    QWORD PTR [rip+0x3c1e]        # 4f88 <socket@plt+0x3b98>
    136a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001370 <setvbuf@plt>:
    1370:	f3 0f 1e fa          	endbr64
    1374:	ff 25 16 3c 00 00    	jmp    QWORD PTR [rip+0x3c16]        # 4f90 <socket@plt+0x3ba0>
    137a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001380 <bind@plt>:
    1380:	f3 0f 1e fa          	endbr64
    1384:	ff 25 0e 3c 00 00    	jmp    QWORD PTR [rip+0x3c0e]        # 4f98 <socket@plt+0x3ba8>
    138a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001390 <open@plt>:
    1390:	f3 0f 1e fa          	endbr64
    1394:	ff 25 06 3c 00 00    	jmp    QWORD PTR [rip+0x3c06]        # 4fa0 <socket@plt+0x3bb0>
    139a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000013a0 <perror@plt>:
    13a0:	f3 0f 1e fa          	endbr64
    13a4:	ff 25 fe 3b 00 00    	jmp    QWORD PTR [rip+0x3bfe]        # 4fa8 <socket@plt+0x3bb8>
    13aa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000013b0 <accept@plt>:
    13b0:	f3 0f 1e fa          	endbr64
    13b4:	ff 25 f6 3b 00 00    	jmp    QWORD PTR [rip+0x3bf6]        # 4fb0 <socket@plt+0x3bc0>
    13ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000013c0 <__fprintf_chk@plt>:
    13c0:	f3 0f 1e fa          	endbr64
    13c4:	ff 25 ee 3b 00 00    	jmp    QWORD PTR [rip+0x3bee]        # 4fb8 <socket@plt+0x3bc8>
    13ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000013d0 <fork@plt>:
    13d0:	f3 0f 1e fa          	endbr64
    13d4:	ff 25 e6 3b 00 00    	jmp    QWORD PTR [rip+0x3be6]        # 4fc0 <socket@plt+0x3bd0>
    13da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000013e0 <rand@plt>:
    13e0:	f3 0f 1e fa          	endbr64
    13e4:	ff 25 de 3b 00 00    	jmp    QWORD PTR [rip+0x3bde]        # 4fc8 <socket@plt+0x3bd8>
    13ea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000013f0 <socket@plt>:
    13f0:	f3 0f 1e fa          	endbr64
    13f4:	ff 25 d6 3b 00 00    	jmp    QWORD PTR [rip+0x3bd6]        # 4fd0 <socket@plt+0x3be0>
    13fa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

0000000000001400 <.text>:
    1400:	48 8d 3d e3 1c 00 00 	lea    rdi,[rip+0x1ce3]        # 30ea <socket@plt+0x1cfa>
    1407:	e8 94 ff ff ff       	call   13a0 <perror@plt>
    140c:	48 8b 44 24 38       	mov    rax,QWORD PTR [rsp+0x38]
    1411:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    1418:	00 00 
    141a:	75 10                	jne    142c <socket@plt+0x3c>
    141c:	48 83 c4 48          	add    rsp,0x48
    1420:	b8 01 00 00 00       	mov    eax,0x1
    1425:	5b                   	pop    rbx
    1426:	5d                   	pop    rbp
    1427:	41 5c                	pop    r12
    1429:	41 5d                	pop    r13
    142b:	c3                   	ret
    142c:	e8 6f fe ff ff       	call   12a0 <__stack_chk_fail@plt>
    1431:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    1438:	00 00 00 
    143b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    1440:	f3 0f 1e fa          	endbr64
    1444:	41 55                	push   r13
    1446:	bf 11 00 00 00       	mov    edi,0x11
    144b:	41 54                	push   r12
    144d:	55                   	push   rbp
    144e:	53                   	push   rbx
    144f:	48 83 ec 48          	sub    rsp,0x48
    1453:	64 48 8b 34 25 28 00 	mov    rsi,QWORD PTR fs:0x28
    145a:	00 00 
    145c:	48 89 74 24 38       	mov    QWORD PTR [rsp+0x38],rsi
    1461:	be 01 00 00 00       	mov    esi,0x1
    1466:	e8 95 fe ff ff       	call   1300 <signal@plt>
    146b:	be 01 00 00 00       	mov    esi,0x1
    1470:	bf 0d 00 00 00       	mov    edi,0xd
    1475:	e8 86 fe ff ff       	call   1300 <signal@plt>
    147a:	48 8b 3d 9f 3b 00 00 	mov    rdi,QWORD PTR [rip+0x3b9f]        # 5020 <stdout@GLIBC_2.2.5>
    1481:	31 c9                	xor    ecx,ecx
    1483:	31 f6                	xor    esi,esi
    1485:	ba 02 00 00 00       	mov    edx,0x2
    148a:	e8 e1 fe ff ff       	call   1370 <setvbuf@plt>
    148f:	31 ff                	xor    edi,edi
    1491:	e8 9a fe ff ff       	call   1330 <time@plt>
    1496:	48 89 c3             	mov    rbx,rax
    1499:	e8 e2 fd ff ff       	call   1280 <getpid@plt>
    149e:	31 d8                	xor    eax,ebx
    14a0:	89 c7                	mov    edi,eax
    14a2:	e8 29 fe ff ff       	call   12d0 <srand@plt>
    14a7:	48 8d 3d 2c 1c 00 00 	lea    rdi,[rip+0x1c2c]        # 30da <socket@plt+0x1cea>
    14ae:	e8 6d fd ff ff       	call   1220 <getenv@plt>
    14b3:	48 85 c0             	test   rax,rax
    14b6:	74 0c                	je     14c4 <socket@plt+0xd4>
    14b8:	48 89 c3             	mov    rbx,rax
    14bb:	80 38 00             	cmp    BYTE PTR [rax],0x0
    14be:	0f 85 40 01 00 00    	jne    1604 <socket@plt+0x214>
    14c4:	66 0f 6f 05 b4 1d 00 	movdqa xmm0,XMMWORD PTR [rip+0x1db4]        # 3280 <socket@plt+0x1e90>
    14cb:	00 
    14cc:	48 c7 05 89 3b 00 00 	mov    QWORD PTR [rip+0x3b89],0x10        # 5060 <stderr@GLIBC_2.2.5+0x20>
    14d3:	10 00 00 00 
    14d7:	0f 29 05 a2 3b 00 00 	movaps XMMWORD PTR [rip+0x3ba2],xmm0        # 5080 <stderr@GLIBC_2.2.5+0x40>
    14de:	48 8d 3d 00 1c 00 00 	lea    rdi,[rip+0x1c00]        # 30e5 <socket@plt+0x1cf5>
    14e5:	bb 70 17 00 00       	mov    ebx,0x1770
    14ea:	e8 31 fd ff ff       	call   1220 <getenv@plt>
    14ef:	48 85 c0             	test   rax,rax
    14f2:	74 11                	je     1505 <socket@plt+0x115>
    14f4:	ba 0a 00 00 00       	mov    edx,0xa
    14f9:	31 f6                	xor    esi,esi
    14fb:	48 89 c7             	mov    rdi,rax
    14fe:	e8 3d fe ff ff       	call   1340 <__isoc23_strtol@plt>
    1503:	89 c3                	mov    ebx,eax
    1505:	31 d2                	xor    edx,edx
    1507:	be 01 00 00 00       	mov    esi,0x1
    150c:	bf 02 00 00 00       	mov    edi,0x2
    1511:	e8 da fe ff ff       	call   13f0 <socket@plt>
    1516:	ba 02 00 00 00       	mov    edx,0x2
    151b:	be 01 00 00 00       	mov    esi,0x1
    1520:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
    1525:	89 c7                	mov    edi,eax
    1527:	41 b8 04 00 00 00    	mov    r8d,0x4
    152d:	89 c5                	mov    ebp,eax
    152f:	c7 44 24 08 01 00 00 	mov    DWORD PTR [rsp+0x8],0x1
    1536:	00 
    1537:	e8 24 fd ff ff       	call   1260 <setsockopt@plt>
    153c:	b8 02 00 00 00       	mov    eax,0x2
    1541:	48 8d 74 24 10       	lea    rsi,[rsp+0x10]
    1546:	89 ef                	mov    edi,ebp
    1548:	66 89 44 24 10       	mov    WORD PTR [rsp+0x10],ax
    154d:	89 d8                	mov    eax,ebx
    154f:	ba 10 00 00 00       	mov    edx,0x10
    1554:	66 c1 c0 08          	rol    ax,0x8
    1558:	c7 44 24 1c 00 00 00 	mov    DWORD PTR [rsp+0x1c],0x0
    155f:	00 
    1560:	48 c7 44 24 14 00 00 	mov    QWORD PTR [rsp+0x14],0x0
    1567:	00 00 
    1569:	66 89 44 24 12       	mov    WORD PTR [rsp+0x12],ax
    156e:	e8 0d fe ff ff       	call   1380 <bind@plt>
    1573:	85 c0                	test   eax,eax
    1575:	0f 85 85 fe ff ff    	jne    1400 <socket@plt+0x10>
    157b:	be 10 00 00 00       	mov    esi,0x10
    1580:	89 ef                	mov    edi,ebp
    1582:	e8 d9 fd ff ff       	call   1360 <listen@plt>
    1587:	48 8b 3d b2 3a 00 00 	mov    rdi,QWORD PTR [rip+0x3ab2]        # 5040 <stderr@GLIBC_2.2.5>
    158e:	89 d9                	mov    ecx,ebx
    1590:	31 c0                	xor    eax,eax
    1592:	48 8d 15 56 1b 00 00 	lea    rdx,[rip+0x1b56]        # 30ef <socket@plt+0x1cff>
    1599:	be 02 00 00 00       	mov    esi,0x2
    159e:	e8 1d fe ff ff       	call   13c0 <__fprintf_chk@plt>
    15a3:	66 90                	xchg   ax,ax
    15a5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    15ac:	00 00 00 00 
    15b0:	48 8d 54 24 0c       	lea    rdx,[rsp+0xc]
    15b5:	48 8d 74 24 20       	lea    rsi,[rsp+0x20]
    15ba:	89 ef                	mov    edi,ebp
    15bc:	c7 44 24 0c 10 00 00 	mov    DWORD PTR [rsp+0xc],0x10
    15c3:	00 
    15c4:	e8 e7 fd ff ff       	call   13b0 <accept@plt>
    15c9:	89 c3                	mov    ebx,eax
    15cb:	85 c0                	test   eax,eax
    15cd:	78 e1                	js     15b0 <socket@plt+0x1c0>
    15cf:	e8 fc fd ff ff       	call   13d0 <fork@plt>
    15d4:	85 c0                	test   eax,eax
    15d6:	74 10                	je     15e8 <socket@plt+0x1f8>
    15d8:	89 df                	mov    edi,ebx
    15da:	e8 d1 fc ff ff       	call   12b0 <close@plt>
    15df:	eb cf                	jmp    15b0 <socket@plt+0x1c0>
    15e1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    15e8:	89 ef                	mov    edi,ebp
    15ea:	e8 c1 fc ff ff       	call   12b0 <close@plt>
    15ef:	89 df                	mov    edi,ebx
    15f1:	e8 ea 0b 00 00       	call   21e0 <socket@plt+0xdf0>
    15f6:	89 df                	mov    edi,ebx
    15f8:	e8 b3 fc ff ff       	call   12b0 <close@plt>
    15fd:	31 ff                	xor    edi,edi
    15ff:	e8 4c fc ff ff       	call   1250 <_exit@plt>
    1604:	48 89 c7             	mov    rdi,rax
    1607:	e8 84 fc ff ff       	call   1290 <strlen@plt>
    160c:	48 89 c2             	mov    rdx,rax
    160f:	48 83 f8 40          	cmp    rax,0x40
    1613:	76 0a                	jbe    161f <socket@plt+0x22f>
    1615:	ba 40 00 00 00       	mov    edx,0x40
    161a:	b8 40 00 00 00       	mov    eax,0x40
    161f:	89 c1                	mov    ecx,eax
    1621:	48 8d 3d 58 3a 00 00 	lea    rdi,[rip+0x3a58]        # 5080 <stderr@GLIBC_2.2.5+0x40>
    1628:	48 89 de             	mov    rsi,rbx
    162b:	48 89 15 2e 3a 00 00 	mov    QWORD PTR [rip+0x3a2e],rdx        # 5060 <stderr@GLIBC_2.2.5+0x20>
    1632:	f3 a4                	rep movs BYTE PTR [rdi],BYTE PTR [rsi]
    1634:	e9 a5 fe ff ff       	jmp    14de <socket@plt+0xee>
    1639:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1640:	f3 0f 1e fa          	endbr64
    1644:	31 ed                	xor    ebp,ebp
    1646:	49 89 d1             	mov    r9,rdx
    1649:	5e                   	pop    rsi
    164a:	48 89 e2             	mov    rdx,rsp
    164d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    1651:	50                   	push   rax
    1652:	54                   	push   rsp
    1653:	45 31 c0             	xor    r8d,r8d
    1656:	31 c9                	xor    ecx,ecx
    1658:	48 8d 3d e1 fd ff ff 	lea    rdi,[rip+0xfffffffffffffde1]        # 1440 <socket@plt+0x50>
    165f:	ff 15 73 39 00 00    	call   QWORD PTR [rip+0x3973]        # 4fd8 <socket@plt+0x3be8>
    1665:	f4                   	hlt
    1666:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    166d:	00 00 00 
    1670:	48 8d 3d 99 39 00 00 	lea    rdi,[rip+0x3999]        # 5010 <socket@plt+0x3c20>
    1677:	48 8d 05 92 39 00 00 	lea    rax,[rip+0x3992]        # 5010 <socket@plt+0x3c20>
    167e:	48 39 f8             	cmp    rax,rdi
    1681:	74 15                	je     1698 <socket@plt+0x2a8>
    1683:	48 8b 05 56 39 00 00 	mov    rax,QWORD PTR [rip+0x3956]        # 4fe0 <socket@plt+0x3bf0>
    168a:	48 85 c0             	test   rax,rax
    168d:	74 09                	je     1698 <socket@plt+0x2a8>
    168f:	ff e0                	jmp    rax
    1691:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1698:	c3                   	ret
    1699:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    16a0:	48 8d 3d 69 39 00 00 	lea    rdi,[rip+0x3969]        # 5010 <socket@plt+0x3c20>
    16a7:	48 8d 35 62 39 00 00 	lea    rsi,[rip+0x3962]        # 5010 <socket@plt+0x3c20>
    16ae:	48 29 fe             	sub    rsi,rdi
    16b1:	48 89 f0             	mov    rax,rsi
    16b4:	48 c1 ee 3f          	shr    rsi,0x3f
    16b8:	48 c1 f8 03          	sar    rax,0x3
    16bc:	48 01 c6             	add    rsi,rax
    16bf:	48 d1 fe             	sar    rsi,1
    16c2:	74 14                	je     16d8 <socket@plt+0x2e8>
    16c4:	48 8b 05 25 39 00 00 	mov    rax,QWORD PTR [rip+0x3925]        # 4ff0 <socket@plt+0x3c00>
    16cb:	48 85 c0             	test   rax,rax
    16ce:	74 08                	je     16d8 <socket@plt+0x2e8>
    16d0:	ff e0                	jmp    rax
    16d2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    16d8:	c3                   	ret
    16d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    16e0:	f3 0f 1e fa          	endbr64
    16e4:	80 3d 5d 39 00 00 00 	cmp    BYTE PTR [rip+0x395d],0x0        # 5048 <stderr@GLIBC_2.2.5+0x8>
    16eb:	75 2b                	jne    1718 <socket@plt+0x328>
    16ed:	55                   	push   rbp
    16ee:	48 83 3d 02 39 00 00 	cmp    QWORD PTR [rip+0x3902],0x0        # 4ff8 <socket@plt+0x3c08>
    16f5:	00 
    16f6:	48 89 e5             	mov    rbp,rsp
    16f9:	74 0c                	je     1707 <socket@plt+0x317>
    16fb:	48 8b 3d 06 39 00 00 	mov    rdi,QWORD PTR [rip+0x3906]        # 5008 <socket@plt+0x3c18>
    1702:	e8 09 fb ff ff       	call   1210 <__cxa_finalize@plt>
    1707:	e8 64 ff ff ff       	call   1670 <socket@plt+0x280>
    170c:	c6 05 35 39 00 00 01 	mov    BYTE PTR [rip+0x3935],0x1        # 5048 <stderr@GLIBC_2.2.5+0x8>
    1713:	5d                   	pop    rbp
    1714:	c3                   	ret
    1715:	0f 1f 00             	nop    DWORD PTR [rax]
    1718:	c3                   	ret
    1719:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1720:	f3 0f 1e fa          	endbr64
    1724:	e9 77 ff ff ff       	jmp    16a0 <socket@plt+0x2b0>
    1729:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    1730:	00 00 00 
    1733:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    173a:	00 00 00 
    173d:	0f 1f 00             	nop    DWORD PTR [rax]
    1740:	41 57                	push   r15
    1742:	41 56                	push   r14
    1744:	41 55                	push   r13
    1746:	41 54                	push   r12
    1748:	55                   	push   rbp
    1749:	53                   	push   rbx
    174a:	48 81 ec 38 01 00 00 	sub    rsp,0x138
    1751:	48 89 74 24 08       	mov    QWORD PTR [rsp+0x8],rsi
    1756:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    175d:	00 00 
    175f:	48 89 84 24 28 01 00 	mov    QWORD PTR [rsp+0x128],rax
    1766:	00 
    1767:	31 c0                	xor    eax,eax
    1769:	48 01 57 20          	add    QWORD PTR [rdi+0x20],rdx
    176d:	48 85 d2             	test   rdx,rdx
    1770:	0f 84 31 04 00 00    	je     1ba7 <socket@plt+0x7b7>
    1776:	48 8d 47 28          	lea    rax,[rdi+0x28]
    177a:	48 89 fb             	mov    rbx,rdi
    177d:	49 89 d7             	mov    r15,rdx
    1780:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    1785:	eb 12                	jmp    1799 <socket@plt+0x3a9>
    1787:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    178e:	00 00 
    1790:	4d 85 ff             	test   r15,r15
    1793:	0f 84 0e 04 00 00    	je     1ba7 <socket@plt+0x7b7>
    1799:	48 8b 7b 68          	mov    rdi,QWORD PTR [rbx+0x68]
    179d:	bd 40 00 00 00       	mov    ebp,0x40
    17a2:	4c 8b 74 24 08       	mov    r14,QWORD PTR [rsp+0x8]
    17a7:	48 29 fd             	sub    rbp,rdi
    17aa:	4c 89 f6             	mov    rsi,r14
    17ad:	4c 39 fd             	cmp    rbp,r15
    17b0:	49 0f 47 ef          	cmova  rbp,r15
    17b4:	48 03 7c 24 10       	add    rdi,QWORD PTR [rsp+0x10]
    17b9:	48 89 ea             	mov    rdx,rbp
    17bc:	49 01 ee             	add    r14,rbp
    17bf:	49 29 ef             	sub    r15,rbp
    17c2:	e8 59 fb ff ff       	call   1320 <memcpy@plt>
    17c7:	48 8b 43 68          	mov    rax,QWORD PTR [rbx+0x68]
    17cb:	4c 89 74 24 08       	mov    QWORD PTR [rsp+0x8],r14
    17d0:	48 01 e8             	add    rax,rbp
    17d3:	48 89 43 68          	mov    QWORD PTR [rbx+0x68],rax
    17d7:	48 83 f8 40          	cmp    rax,0x40
    17db:	75 b3                	jne    1790 <socket@plt+0x3a0>
    17dd:	f3 0f 6f 53 28       	movdqu xmm2,XMMWORD PTR [rbx+0x28]
    17e2:	f3 44 0f 6f 43 38    	movdqu xmm8,XMMWORD PTR [rbx+0x38]
    17e8:	66 45 0f ef c9       	pxor   xmm9,xmm9
    17ed:	48 8d 6c 24 20       	lea    rbp,[rsp+0x20]
    17f2:	f3 0f 6f 5b 48       	movdqu xmm3,XMMWORD PTR [rbx+0x48]
    17f7:	f3 0f 6f 73 58       	movdqu xmm6,XMMWORD PTR [rbx+0x58]
    17fc:	48 8d 44 24 60       	lea    rax,[rsp+0x60]
    1801:	48 8d 94 24 20 01 00 	lea    rdx,[rsp+0x120]
    1808:	00 
    1809:	66 0f 6f ca          	movdqa xmm1,xmm2
    180d:	66 41 0f 6f c0       	movdqa xmm0,xmm8
    1812:	66 0f 71 d0 08       	psrlw  xmm0,0x8
    1817:	66 0f 71 d1 08       	psrlw  xmm1,0x8
    181c:	66 0f 6f e3          	movdqa xmm4,xmm3
    1820:	66 0f 67 c8          	packuswb xmm1,xmm0
    1824:	66 0f 71 d4 08       	psrlw  xmm4,0x8
    1829:	66 0f 6f c6          	movdqa xmm0,xmm6
    182d:	66 0f 71 d0 08       	psrlw  xmm0,0x8
    1832:	66 0f 6f e9          	movdqa xmm5,xmm1
    1836:	66 0f 67 e0          	packuswb xmm4,xmm0
    183a:	66 0f 71 d5 08       	psrlw  xmm5,0x8
    183f:	66 0f 6f c4          	movdqa xmm0,xmm4
    1843:	66 0f 71 d0 08       	psrlw  xmm0,0x8
    1848:	66 0f 67 e8          	packuswb xmm5,xmm0
    184c:	66 0f 76 c0          	pcmpeqd xmm0,xmm0
    1850:	66 0f 71 d0 08       	psrlw  xmm0,0x8
    1855:	66 0f 6f fd          	movdqa xmm7,xmm5
    1859:	66 41 0f 68 e9       	punpckhbw xmm5,xmm9
    185e:	66 44 0f db c0       	pand   xmm8,xmm0
    1863:	66 0f db f0          	pand   xmm6,xmm0
    1867:	66 0f db d0          	pand   xmm2,xmm0
    186b:	66 0f db d8          	pand   xmm3,xmm0
    186f:	66 41 0f 67 d0       	packuswb xmm2,xmm8
    1874:	66 0f db e0          	pand   xmm4,xmm0
    1878:	66 0f 67 de          	packuswb xmm3,xmm6
    187c:	66 0f 6f f0          	movdqa xmm6,xmm0
    1880:	66 0f db c8          	pand   xmm1,xmm0
    1884:	66 0f db f2          	pand   xmm6,xmm2
    1888:	66 0f db c3          	pand   xmm0,xmm3
    188c:	66 0f 67 cc          	packuswb xmm1,xmm4
    1890:	66 0f 71 d3 08       	psrlw  xmm3,0x8
    1895:	66 0f 71 d2 08       	psrlw  xmm2,0x8
    189a:	66 0f 67 f0          	packuswb xmm6,xmm0
    189e:	66 0f 67 d3          	packuswb xmm2,xmm3
    18a2:	66 0f 6f e1          	movdqa xmm4,xmm1
    18a6:	66 44 0f 6f c6       	movdqa xmm8,xmm6
    18ab:	66 41 0f 68 c9       	punpckhbw xmm1,xmm9
    18b0:	66 41 0f 68 f1       	punpckhbw xmm6,xmm9
    18b5:	66 44 0f 6f d2       	movdqa xmm10,xmm2
    18ba:	66 0f ef db          	pxor   xmm3,xmm3
    18be:	66 41 0f 60 f9       	punpcklbw xmm7,xmm9
    18c3:	66 41 0f 60 e1       	punpcklbw xmm4,xmm9
    18c8:	66 45 0f 60 c1       	punpcklbw xmm8,xmm9
    18cd:	66 45 0f 60 d1       	punpcklbw xmm10,xmm9
    18d2:	66 41 0f 68 d1       	punpckhbw xmm2,xmm9
    18d7:	66 0f 6f c1          	movdqa xmm0,xmm1
    18db:	66 44 0f 6f ce       	movdqa xmm9,xmm6
    18e0:	66 0f 61 cb          	punpcklwd xmm1,xmm3
    18e4:	66 0f 69 c3          	punpckhwd xmm0,xmm3
    18e8:	66 44 0f 69 cb       	punpckhwd xmm9,xmm3
    18ed:	66 0f 61 f3          	punpcklwd xmm6,xmm3
    18f1:	66 0f 71 f2 08       	psllw  xmm2,0x8
    18f6:	66 41 0f 72 f1 18    	pslld  xmm9,0x18
    18fc:	66 0f 72 f0 10       	pslld  xmm0,0x10
    1901:	66 41 0f 71 f2 08    	psllw  xmm10,0x8
    1907:	66 44 0f 6f da       	movdqa xmm11,xmm2
    190c:	66 41 0f eb c1       	por    xmm0,xmm9
    1911:	66 44 0f 6f cd       	movdqa xmm9,xmm5
    1916:	66 44 0f 69 db       	punpckhwd xmm11,xmm3
    191b:	66 44 0f 69 cb       	punpckhwd xmm9,xmm3
    1920:	66 45 0f 6f e2       	movdqa xmm12,xmm10
    1925:	66 0f 61 d3          	punpcklwd xmm2,xmm3
    1929:	66 45 0f eb cb       	por    xmm9,xmm11
    192e:	66 45 0f 6f d8       	movdqa xmm11,xmm8
    1933:	66 44 0f 69 c3       	punpckhwd xmm8,xmm3
    1938:	66 41 0f eb c1       	por    xmm0,xmm9
    193d:	66 44 0f 6f cc       	movdqa xmm9,xmm4
    1942:	66 0f 69 e3          	punpckhwd xmm4,xmm3
    1946:	66 44 0f 61 cb       	punpcklwd xmm9,xmm3
    194b:	66 44 0f 61 db       	punpcklwd xmm11,xmm3
    1950:	66 44 0f 61 e3       	punpcklwd xmm12,xmm3
    1955:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
    195a:	66 41 0f 72 f3 18    	pslld  xmm11,0x18
    1960:	66 41 0f 72 f1 10    	pslld  xmm9,0x10
    1966:	66 44 0f 69 d3       	punpckhwd xmm10,xmm3
    196b:	66 0f 73 d8 08       	psrldq xmm0,0x8
    1970:	66 45 0f eb cb       	por    xmm9,xmm11
    1975:	66 44 0f 6f df       	movdqa xmm11,xmm7
    197a:	66 0f 61 eb          	punpcklwd xmm5,xmm3
    197e:	66 44 0f 61 db       	punpcklwd xmm11,xmm3
    1983:	66 0f 72 f4 10       	pslld  xmm4,0x10
    1988:	66 0f 69 fb          	punpckhwd xmm7,xmm3
    198c:	66 41 0f 72 f0 18    	pslld  xmm8,0x18
    1992:	66 0f 72 f1 10       	pslld  xmm1,0x10
    1997:	66 45 0f eb dc       	por    xmm11,xmm12
    199c:	66 0f 72 f6 18       	pslld  xmm6,0x18
    19a1:	66 41 0f eb e0       	por    xmm4,xmm8
    19a6:	66 41 0f eb fa       	por    xmm7,xmm10
    19ab:	66 0f eb ce          	por    xmm1,xmm6
    19af:	66 0f eb ea          	por    xmm5,xmm2
    19b3:	66 45 0f eb cb       	por    xmm9,xmm11
    19b8:	66 0f eb e7          	por    xmm4,xmm7
    19bc:	66 0f eb cd          	por    xmm1,xmm5
    19c0:	44 0f 29 4c 24 20    	movaps XMMWORD PTR [rsp+0x20],xmm9
    19c6:	0f 29 64 24 30       	movaps XMMWORD PTR [rsp+0x30],xmm4
    19cb:	0f 29 4c 24 40       	movaps XMMWORD PTR [rsp+0x40],xmm1
    19d0:	f3 0f 7e 50 c4       	movq   xmm2,QWORD PTR [rax-0x3c]
    19d5:	48 83 c0 08          	add    rax,0x8
    19d9:	66 0f 6f ca          	movdqa xmm1,xmm2
    19dd:	66 0f 6f da          	movdqa xmm3,xmm2
    19e1:	66 0f 6f e2          	movdqa xmm4,xmm2
    19e5:	66 0f 72 d3 12       	psrld  xmm3,0x12
    19ea:	66 0f 72 f1 0e       	pslld  xmm1,0xe
    19ef:	66 0f eb cb          	por    xmm1,xmm3
    19f3:	66 0f 72 d4 07       	psrld  xmm4,0x7
    19f8:	66 0f 6f da          	movdqa xmm3,xmm2
    19fc:	66 0f 72 f3 19       	pslld  xmm3,0x19
    1a01:	66 0f 72 d2 03       	psrld  xmm2,0x3
    1a06:	66 0f eb dc          	por    xmm3,xmm4
    1a0a:	66 0f 6f e0          	movdqa xmm4,xmm0
    1a0e:	66 0f ef cb          	pxor   xmm1,xmm3
    1a12:	66 0f 72 d4 11       	psrld  xmm4,0x11
    1a17:	66 0f 6f d8          	movdqa xmm3,xmm0
    1a1b:	66 0f ef ca          	pxor   xmm1,xmm2
    1a1f:	66 0f 72 d3 13       	psrld  xmm3,0x13
    1a24:	66 0f 6f d0          	movdqa xmm2,xmm0
    1a28:	66 0f 72 f2 0d       	pslld  xmm2,0xd
    1a2d:	66 0f eb d3          	por    xmm2,xmm3
    1a31:	66 0f 6f d8          	movdqa xmm3,xmm0
    1a35:	66 0f 72 f3 0f       	pslld  xmm3,0xf
    1a3a:	66 0f 72 d0 0a       	psrld  xmm0,0xa
    1a3f:	66 0f eb dc          	por    xmm3,xmm4
    1a43:	66 0f ef d3          	pxor   xmm2,xmm3
    1a47:	66 0f ef d0          	pxor   xmm2,xmm0
    1a4b:	f3 0f 7e 40 dc       	movq   xmm0,QWORD PTR [rax-0x24]
    1a50:	66 0f fe ca          	paddd  xmm1,xmm2
    1a54:	f3 0f 7e 50 b8       	movq   xmm2,QWORD PTR [rax-0x48]
    1a59:	66 0f fe c2          	paddd  xmm0,xmm2
    1a5d:	66 0f fe c1          	paddd  xmm0,xmm1
    1a61:	66 0f d6 40 f8       	movq   QWORD PTR [rax-0x8],xmm0
    1a66:	48 39 c2             	cmp    rdx,rax
    1a69:	0f 85 61 ff ff ff    	jne    19d0 <socket@plt+0x5e0>
    1a6f:	4c 8d 05 ea 16 00 00 	lea    r8,[rip+0x16ea]        # 3160 <socket@plt+0x1d70>
    1a76:	f3 0f 6f 13          	movdqu xmm2,XMMWORD PTR [rbx]
    1a7a:	8b 53 1c             	mov    edx,DWORD PTR [rbx+0x1c]
    1a7d:	4c 89 7c 24 18       	mov    QWORD PTR [rsp+0x18],r15
    1a82:	44 8b 63 0c          	mov    r12d,DWORD PTR [rbx+0xc]
    1a86:	f3 0f 6f 4b 10       	movdqu xmm1,XMMWORD PTR [rbx+0x10]
    1a8b:	4d 8d a8 00 01 00 00 	lea    r13,[r8+0x100]
    1a92:	8b 33                	mov    esi,DWORD PTR [rbx]
    1a94:	8b 7b 04             	mov    edi,DWORD PTR [rbx+0x4]
    1a97:	44 8b 4b 08          	mov    r9d,DWORD PTR [rbx+0x8]
    1a9b:	8b 4b 10             	mov    ecx,DWORD PTR [rbx+0x10]
    1a9e:	44 8b 53 14          	mov    r10d,DWORD PTR [rbx+0x14]
    1aa2:	44 8b 5b 18          	mov    r11d,DWORD PTR [rbx+0x18]
    1aa6:	eb 18                	jmp    1ac0 <socket@plt+0x6d0>
    1aa8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    1aaf:	00 
    1ab0:	41 89 f9             	mov    r9d,edi
    1ab3:	45 89 d3             	mov    r11d,r10d
    1ab6:	89 f7                	mov    edi,esi
    1ab8:	41 89 ca             	mov    r10d,ecx
    1abb:	89 c6                	mov    esi,eax
    1abd:	44 89 f1             	mov    ecx,r14d
    1ac0:	89 c8                	mov    eax,ecx
    1ac2:	41 89 ce             	mov    r14d,ecx
    1ac5:	41 89 cf             	mov    r15d,ecx
    1ac8:	49 83 c0 04          	add    r8,0x4
    1acc:	41 c1 ce 0b          	ror    r14d,0xb
    1ad0:	c1 c8 06             	ror    eax,0x6
    1ad3:	45 21 d7             	and    r15d,r10d
    1ad6:	48 83 c5 04          	add    rbp,0x4
    1ada:	44 31 f0             	xor    eax,r14d
    1add:	41 89 ce             	mov    r14d,ecx
    1ae0:	41 c1 c6 07          	rol    r14d,0x7
    1ae4:	44 31 f0             	xor    eax,r14d
    1ae7:	44 8b 75 fc          	mov    r14d,DWORD PTR [rbp-0x4]
    1aeb:	45 03 70 fc          	add    r14d,DWORD PTR [r8-0x4]
    1aef:	44 01 f0             	add    eax,r14d
    1af2:	41 89 ce             	mov    r14d,ecx
    1af5:	41 f7 d6             	not    r14d
    1af8:	45 21 de             	and    r14d,r11d
    1afb:	45 31 fe             	xor    r14d,r15d
    1afe:	41 89 ff             	mov    r15d,edi
    1b01:	44 01 f0             	add    eax,r14d
    1b04:	41 89 f6             	mov    r14d,esi
    1b07:	45 21 cf             	and    r15d,r9d
    1b0a:	01 d0                	add    eax,edx
    1b0c:	89 f2                	mov    edx,esi
    1b0e:	41 c1 ce 0d          	ror    r14d,0xd
    1b12:	c1 ca 02             	ror    edx,0x2
    1b15:	44 31 f2             	xor    edx,r14d
    1b18:	41 89 f6             	mov    r14d,esi
    1b1b:	41 c1 c6 0a          	rol    r14d,0xa
    1b1f:	44 31 f2             	xor    edx,r14d
    1b22:	41 89 fe             	mov    r14d,edi
    1b25:	45 31 ce             	xor    r14d,r9d
    1b28:	41 21 f6             	and    r14d,esi
    1b2b:	45 31 fe             	xor    r14d,r15d
    1b2e:	44 01 f2             	add    edx,r14d
    1b31:	46 8d 34 20          	lea    r14d,[rax+r12*1]
    1b35:	45 89 cc             	mov    r12d,r9d
    1b38:	01 d0                	add    eax,edx
    1b3a:	44 89 da             	mov    edx,r11d
    1b3d:	4d 39 e8             	cmp    r8,r13
    1b40:	0f 85 6a ff ff ff    	jne    1ab0 <socket@plt+0x6c0>
    1b46:	66 41 0f 6e f9       	movd   xmm7,r9d
    1b4b:	66 0f 6e df          	movd   xmm3,edi
    1b4f:	66 0f 6e c0          	movd   xmm0,eax
    1b53:	4c 8b 7c 24 18       	mov    r15,QWORD PTR [rsp+0x18]
    1b58:	66 0f 62 df          	punpckldq xmm3,xmm7
    1b5c:	66 0f 6e fe          	movd   xmm7,esi
    1b60:	66 0f 6e e9          	movd   xmm5,ecx
    1b64:	48 c7 43 68 00 00 00 	mov    QWORD PTR [rbx+0x68],0x0
    1b6b:	00 
    1b6c:	66 0f 62 c7          	punpckldq xmm0,xmm7
    1b70:	66 41 0f 6e fb       	movd   xmm7,r11d
    1b75:	66 0f 6c c3          	punpcklqdq xmm0,xmm3
    1b79:	66 0f fe c2          	paddd  xmm0,xmm2
    1b7d:	66 41 0f 6e d2       	movd   xmm2,r10d
    1b82:	0f 11 03             	movups XMMWORD PTR [rbx],xmm0
    1b85:	66 41 0f 6e c6       	movd   xmm0,r14d
    1b8a:	66 0f 62 d7          	punpckldq xmm2,xmm7
    1b8e:	66 0f 62 c5          	punpckldq xmm0,xmm5
    1b92:	66 0f 6c c2          	punpcklqdq xmm0,xmm2
    1b96:	66 0f fe c1          	paddd  xmm0,xmm1
    1b9a:	0f 11 43 10          	movups XMMWORD PTR [rbx+0x10],xmm0
    1b9e:	4d 85 ff             	test   r15,r15
    1ba1:	0f 85 f2 fb ff ff    	jne    1799 <socket@plt+0x3a9>
    1ba7:	48 8b 84 24 28 01 00 	mov    rax,QWORD PTR [rsp+0x128]
    1bae:	00 
    1baf:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    1bb6:	00 00 
    1bb8:	75 12                	jne    1bcc <socket@plt+0x7dc>
    1bba:	48 81 c4 38 01 00 00 	add    rsp,0x138
    1bc1:	5b                   	pop    rbx
    1bc2:	5d                   	pop    rbp
    1bc3:	41 5c                	pop    r12
    1bc5:	41 5d                	pop    r13
    1bc7:	41 5e                	pop    r14
    1bc9:	41 5f                	pop    r15
    1bcb:	c3                   	ret
    1bcc:	e8 cf f6 ff ff       	call   12a0 <__stack_chk_fail@plt>
    1bd1:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1bd5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    1bdc:	00 00 00 00 
    1be0:	41 55                	push   r13
    1be2:	41 89 fd             	mov    r13d,edi
    1be5:	41 54                	push   r12
    1be7:	49 89 f4             	mov    r12,rsi
    1bea:	55                   	push   rbp
    1beb:	48 89 d5             	mov    rbp,rdx
    1bee:	53                   	push   rbx
    1bef:	31 db                	xor    ebx,ebx
    1bf1:	48 83 ec 08          	sub    rsp,0x8
    1bf5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    1bfc:	00 00 00 00 
    1c00:	48 89 ea             	mov    rdx,rbp
    1c03:	49 8d 34 1c          	lea    rsi,[r12+rbx*1]
    1c07:	44 89 ef             	mov    edi,r13d
    1c0a:	48 29 da             	sub    rdx,rbx
    1c0d:	e8 ae f6 ff ff       	call   12c0 <read@plt>
    1c12:	48 85 c0             	test   rax,rax
    1c15:	7e 19                	jle    1c30 <socket@plt+0x840>
    1c17:	48 01 c3             	add    rbx,rax
    1c1a:	48 39 eb             	cmp    rbx,rbp
    1c1d:	72 e1                	jb     1c00 <socket@plt+0x810>
    1c1f:	48 83 c4 08          	add    rsp,0x8
    1c23:	31 c0                	xor    eax,eax
    1c25:	5b                   	pop    rbx
    1c26:	5d                   	pop    rbp
    1c27:	41 5c                	pop    r12
    1c29:	41 5d                	pop    r13
    1c2b:	c3                   	ret
    1c2c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1c30:	48 83 c4 08          	add    rsp,0x8
    1c34:	b8 ff ff ff ff       	mov    eax,0xffffffff
    1c39:	5b                   	pop    rbx
    1c3a:	5d                   	pop    rbp
    1c3b:	41 5c                	pop    r12
    1c3d:	41 5d                	pop    r13
    1c3f:	c3                   	ret
    1c40:	41 54                	push   r12
    1c42:	b8 db 01 00 00       	mov    eax,0x1db
    1c47:	55                   	push   rbp
    1c48:	89 fd                	mov    ebp,edi
    1c4a:	48 89 d7             	mov    rdi,rdx
    1c4d:	53                   	push   rbx
    1c4e:	48 83 ec 20          	sub    rsp,0x20
    1c52:	48 89 74 24 08       	mov    QWORD PTR [rsp+0x8],rsi
    1c57:	64 4c 8b 24 25 28 00 	mov    r12,QWORD PTR fs:0x28
    1c5e:	00 00 
    1c60:	4c 89 64 24 18       	mov    QWORD PTR [rsp+0x18],r12
    1c65:	49 89 d4             	mov    r12,rdx
    1c68:	66 89 44 24 14       	mov    WORD PTR [rsp+0x14],ax
    1c6d:	89 d0                	mov    eax,edx
    1c6f:	66 c1 c0 08          	rol    ax,0x8
    1c73:	66 89 44 24 16       	mov    WORD PTR [rsp+0x16],ax
    1c78:	e8 d3 f6 ff ff       	call   1350 <malloc@plt>
    1c7d:	48 8b 74 24 08       	mov    rsi,QWORD PTR [rsp+0x8]
    1c82:	48 89 c7             	mov    rdi,rax
    1c85:	48 89 c3             	mov    rbx,rax
    1c88:	4c 89 e1             	mov    rcx,r12
    1c8b:	4c 89 e2             	mov    rdx,r12
    1c8e:	e8 7d f6 ff ff       	call   1310 <__memcpy_chk@plt>
    1c93:	4d 85 e4             	test   r12,r12
    1c96:	0f 84 7c 00 00 00    	je     1d18 <socket@plt+0x928>
    1c9c:	4a 8d 34 23          	lea    rsi,[rbx+r12*1]
    1ca0:	ba 5a 00 00 00       	mov    edx,0x5a
    1ca5:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    1caa:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    1cb1:	00 00 00 00 
    1cb5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    1cbc:	00 00 00 00 
    1cc0:	89 d1                	mov    ecx,edx
    1cc2:	30 10                	xor    BYTE PTR [rax],dl
    1cc4:	48 83 c0 01          	add    rax,0x1
    1cc8:	c1 e1 05             	shl    ecx,0x5
    1ccb:	8d 54 0a 07          	lea    edx,[rdx+rcx*1+0x7]
    1ccf:	48 39 f0             	cmp    rax,rsi
    1cd2:	75 ec                	jne    1cc0 <socket@plt+0x8d0>
    1cd4:	48 8d 74 24 14       	lea    rsi,[rsp+0x14]
    1cd9:	ba 04 00 00 00       	mov    edx,0x4
    1cde:	89 ef                	mov    edi,ebp
    1ce0:	e8 8b f5 ff ff       	call   1270 <write@plt>
    1ce5:	4c 89 e2             	mov    rdx,r12
    1ce8:	48 89 de             	mov    rsi,rbx
    1ceb:	89 ef                	mov    edi,ebp
    1ced:	e8 7e f5 ff ff       	call   1270 <write@plt>
    1cf2:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
    1cf7:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    1cfe:	00 00 
    1d00:	75 29                	jne    1d2b <socket@plt+0x93b>
    1d02:	48 83 c4 20          	add    rsp,0x20
    1d06:	48 89 df             	mov    rdi,rbx
    1d09:	5b                   	pop    rbx
    1d0a:	5d                   	pop    rbp
    1d0b:	41 5c                	pop    r12
    1d0d:	e9 2e f5 ff ff       	jmp    1240 <free@plt>
    1d12:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1d18:	48 8d 74 24 14       	lea    rsi,[rsp+0x14]
    1d1d:	ba 04 00 00 00       	mov    edx,0x4
    1d22:	89 ef                	mov    edi,ebp
    1d24:	e8 47 f5 ff ff       	call   1270 <write@plt>
    1d29:	eb c7                	jmp    1cf2 <socket@plt+0x902>
    1d2b:	e8 70 f5 ff ff       	call   12a0 <__stack_chk_fail@plt>
    1d30:	53                   	push   rbx
    1d31:	89 fb                	mov    ebx,edi
    1d33:	48 89 f7             	mov    rdi,rsi
    1d36:	48 83 ec 10          	sub    rsp,0x10
    1d3a:	48 89 74 24 08       	mov    QWORD PTR [rsp+0x8],rsi
    1d3f:	e8 4c f5 ff ff       	call   1290 <strlen@plt>
    1d44:	48 8b 74 24 08       	mov    rsi,QWORD PTR [rsp+0x8]
    1d49:	48 83 c4 10          	add    rsp,0x10
    1d4d:	89 df                	mov    edi,ebx
    1d4f:	48 89 c2             	mov    rdx,rax
    1d52:	5b                   	pop    rbx
    1d53:	e9 e8 fe ff ff       	jmp    1c40 <socket@plt+0x850>
    1d58:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    1d5f:	00 
    1d60:	c6 01 00             	mov    BYTE PTR [rcx],0x0
    1d63:	48 85 f6             	test   rsi,rsi
    1d66:	0f 84 f5 00 00 00    	je     1e61 <socket@plt+0xa71>
    1d6c:	41 57                	push   r15
    1d6e:	41 56                	push   r14
    1d70:	49 89 d6             	mov    r14,rdx
    1d73:	41 55                	push   r13
    1d75:	49 89 f5             	mov    r13,rsi
    1d78:	41 54                	push   r12
    1d7a:	49 89 fc             	mov    r12,rdi
    1d7d:	48 89 d7             	mov    rdi,rdx
    1d80:	55                   	push   rbp
    1d81:	53                   	push   rbx
    1d82:	48 83 ec 18          	sub    rsp,0x18
    1d86:	48 89 0c 24          	mov    QWORD PTR [rsp],rcx
    1d8a:	e8 01 f5 ff ff       	call   1290 <strlen@plt>
    1d8f:	31 ff                	xor    edi,edi
    1d91:	49 89 c7             	mov    r15,rax
    1d94:	4c 39 ef             	cmp    rdi,r13
    1d97:	72 17                	jb     1db0 <socket@plt+0x9c0>
    1d99:	48 89 fb             	mov    rbx,rdi
    1d9c:	48 8d 7b 01          	lea    rdi,[rbx+0x1]
    1da0:	4c 39 ef             	cmp    rdi,r13
    1da3:	73 64                	jae    1e09 <socket@plt+0xa19>
    1da5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    1dac:	00 00 00 00 
    1db0:	48 89 fb             	mov    rbx,rdi
    1db3:	eb 14                	jmp    1dc9 <socket@plt+0x9d9>
    1db5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    1dbc:	00 00 00 00 
    1dc0:	48 83 c3 01          	add    rbx,0x1
    1dc4:	4c 39 eb             	cmp    rbx,r13
    1dc7:	73 07                	jae    1dd0 <socket@plt+0x9e0>
    1dc9:	41 80 3c 1c 26       	cmp    BYTE PTR [r12+rbx*1],0x26
    1dce:	75 f0                	jne    1dc0 <socket@plt+0x9d0>
    1dd0:	48 39 df             	cmp    rdi,rbx
    1dd3:	0f 83 89 00 00 00    	jae    1e62 <socket@plt+0xa72>
    1dd9:	48 89 fd             	mov    rbp,rdi
    1ddc:	eb 0b                	jmp    1de9 <socket@plt+0x9f9>
    1dde:	66 90                	xchg   ax,ax
    1de0:	48 83 c5 01          	add    rbp,0x1
    1de4:	48 39 dd             	cmp    rbp,rbx
    1de7:	74 17                	je     1e00 <socket@plt+0xa10>
    1de9:	41 80 3c 2c 3d       	cmp    BYTE PTR [r12+rbp*1],0x3d
    1dee:	75 f0                	jne    1de0 <socket@plt+0x9f0>
    1df0:	48 39 dd             	cmp    rbp,rbx
    1df3:	73 0b                	jae    1e00 <socket@plt+0xa10>
    1df5:	48 89 e8             	mov    rax,rbp
    1df8:	48 29 f8             	sub    rax,rdi
    1dfb:	49 39 c7             	cmp    r15,rax
    1dfe:	74 20                	je     1e20 <socket@plt+0xa30>
    1e00:	48 8d 7b 01          	lea    rdi,[rbx+0x1]
    1e04:	4c 39 ef             	cmp    rdi,r13
    1e07:	72 a7                	jb     1db0 <socket@plt+0x9c0>
    1e09:	48 83 c4 18          	add    rsp,0x18
    1e0d:	5b                   	pop    rbx
    1e0e:	5d                   	pop    rbp
    1e0f:	41 5c                	pop    r12
    1e11:	41 5d                	pop    r13
    1e13:	41 5e                	pop    r14
    1e15:	41 5f                	pop    r15
    1e17:	c3                   	ret
    1e18:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    1e1f:	00 
    1e20:	4c 01 e7             	add    rdi,r12
    1e23:	4c 89 fa             	mov    rdx,r15
    1e26:	4c 89 f6             	mov    rsi,r14
    1e29:	e8 b2 f4 ff ff       	call   12e0 <memcmp@plt>
    1e2e:	85 c0                	test   eax,eax
    1e30:	75 ce                	jne    1e00 <socket@plt+0xa10>
    1e32:	48 8d 53 ff          	lea    rdx,[rbx-0x1]
    1e36:	48 29 ea             	sub    rdx,rbp
    1e39:	48 83 fa 3f          	cmp    rdx,0x3f
    1e3d:	77 c1                	ja     1e00 <socket@plt+0xa10>
    1e3f:	49 8d 74 2c 01       	lea    rsi,[r12+rbp*1+0x1]
    1e44:	48 8b 2c 24          	mov    rbp,QWORD PTR [rsp]
    1e48:	48 89 54 24 08       	mov    QWORD PTR [rsp+0x8],rdx
    1e4d:	48 89 ef             	mov    rdi,rbp
    1e50:	e8 cb f4 ff ff       	call   1320 <memcpy@plt>
    1e55:	48 8b 54 24 08       	mov    rdx,QWORD PTR [rsp+0x8]
    1e5a:	c6 44 15 00 00       	mov    BYTE PTR [rbp+rdx*1+0x0],0x0
    1e5f:	eb 9f                	jmp    1e00 <socket@plt+0xa10>
    1e61:	c3                   	ret
    1e62:	48 89 df             	mov    rdi,rbx
    1e65:	e9 2f ff ff ff       	jmp    1d99 <socket@plt+0x9a9>
    1e6a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1e70:	41 55                	push   r13
    1e72:	49 89 f5             	mov    r13,rsi
    1e75:	48 8d 35 04 32 00 00 	lea    rsi,[rip+0x3204]        # 5080 <stderr@GLIBC_2.2.5+0x40>
    1e7c:	41 54                	push   r12
    1e7e:	49 89 fc             	mov    r12,rdi
    1e81:	55                   	push   rbp
    1e82:	53                   	push   rbx
    1e83:	48 81 ec c8 00 00 00 	sub    rsp,0xc8
    1e8a:	66 0f 6f 05 ce 13 00 	movdqa xmm0,XMMWORD PTR [rip+0x13ce]        # 3260 <socket@plt+0x1e70>
    1e91:	00 
    1e92:	64 48 8b 1c 25 28 00 	mov    rbx,QWORD PTR fs:0x28
    1e99:	00 00 
    1e9b:	48 89 9c 24 b8 00 00 	mov    QWORD PTR [rsp+0xb8],rbx
    1ea2:	00 
    1ea3:	48 89 d3             	mov    rbx,rdx
    1ea6:	48 8d 6c 24 10       	lea    rbp,[rsp+0x10]
    1eab:	48 8b 15 ae 31 00 00 	mov    rdx,QWORD PTR [rip+0x31ae]        # 5060 <stderr@GLIBC_2.2.5+0x20>
    1eb2:	48 c7 44 24 30 00 00 	mov    QWORD PTR [rsp+0x30],0x0
    1eb9:	00 00 
    1ebb:	0f 29 44 24 10       	movaps XMMWORD PTR [rsp+0x10],xmm0
    1ec0:	48 89 ef             	mov    rdi,rbp
    1ec3:	66 0f 6f 05 a5 13 00 	movdqa xmm0,XMMWORD PTR [rip+0x13a5]        # 3270 <socket@plt+0x1e80>
    1eca:	00 
    1ecb:	48 c7 44 24 78 00 00 	mov    QWORD PTR [rsp+0x78],0x0
    1ed2:	00 00 
    1ed4:	0f 29 44 24 20       	movaps XMMWORD PTR [rsp+0x20],xmm0
    1ed9:	e8 62 f8 ff ff       	call   1740 <socket@plt+0x350>
    1ede:	4c 89 e6             	mov    rsi,r12
    1ee1:	4c 89 ea             	mov    rdx,r13
    1ee4:	48 89 ef             	mov    rdi,rbp
    1ee7:	e8 54 f8 ff ff       	call   1740 <socket@plt+0x350>
    1eec:	48 8b 44 24 30       	mov    rax,QWORD PTR [rsp+0x30]
    1ef1:	48 8d 74 24 0e       	lea    rsi,[rsp+0xe]
    1ef6:	48 89 ef             	mov    rdi,rbp
    1ef9:	ba 01 00 00 00       	mov    edx,0x1
    1efe:	c6 44 24 0e 80       	mov    BYTE PTR [rsp+0xe],0x80
    1f03:	4c 8d 24 c5 00 00 00 	lea    r12,[rax*8+0x0]
    1f0a:	00 
    1f0b:	e8 30 f8 ff ff       	call   1740 <socket@plt+0x350>
    1f10:	c6 44 24 0f 00       	mov    BYTE PTR [rsp+0xf],0x0
    1f15:	48 83 7c 24 78 38    	cmp    QWORD PTR [rsp+0x78],0x38
    1f1b:	74 1d                	je     1f3a <socket@plt+0xb4a>
    1f1d:	0f 1f 00             	nop    DWORD PTR [rax]
    1f20:	ba 01 00 00 00       	mov    edx,0x1
    1f25:	48 8d 74 24 0f       	lea    rsi,[rsp+0xf]
    1f2a:	48 89 ef             	mov    rdi,rbp
    1f2d:	e8 0e f8 ff ff       	call   1740 <socket@plt+0x350>
    1f32:	48 83 7c 24 78 38    	cmp    QWORD PTR [rsp+0x78],0x38
    1f38:	75 e6                	jne    1f20 <socket@plt+0xb30>
    1f3a:	48 8d b4 24 88 00 00 	lea    rsi,[rsp+0x88]
    1f41:	00 
    1f42:	b9 38 00 00 00       	mov    ecx,0x38
    1f47:	48 89 f0             	mov    rax,rsi
    1f4a:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    1f51:	00 00 00 00 
    1f55:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    1f5c:	00 00 00 00 
    1f60:	4c 89 e2             	mov    rdx,r12
    1f63:	48 83 c0 01          	add    rax,0x1
    1f67:	48 d3 ea             	shr    rdx,cl
    1f6a:	83 e9 08             	sub    ecx,0x8
    1f6d:	88 50 ff             	mov    BYTE PTR [rax-0x1],dl
    1f70:	83 f9 f8             	cmp    ecx,0xfffffff8
    1f73:	75 eb                	jne    1f60 <socket@plt+0xb70>
    1f75:	ba 08 00 00 00       	mov    edx,0x8
    1f7a:	48 89 ef             	mov    rdi,rbp
    1f7d:	e8 be f7 ff ff       	call   1740 <socket@plt+0x350>
    1f82:	f3 0f 7e 44 24 10    	movq   xmm0,QWORD PTR [rsp+0x10]
    1f88:	48 89 da             	mov    rdx,rbx
    1f8b:	f3 0f 7e 7c 24 18    	movq   xmm7,QWORD PTR [rsp+0x18]
    1f91:	f3 0f 7e 54 24 20    	movq   xmm2,QWORD PTR [rsp+0x20]
    1f97:	f3 0f 7e 6c 24 28    	movq   xmm5,QWORD PTR [rsp+0x28]
    1f9d:	48 8d 8c 24 90 00 00 	lea    rcx,[rsp+0x90]
    1fa4:	00 
    1fa5:	4c 8d 84 24 b0 00 00 	lea    r8,[rsp+0xb0]
    1fac:	00 
    1fad:	66 0f 6f d8          	movdqa xmm3,xmm0
    1fb1:	66 0f 6f c8          	movdqa xmm1,xmm0
    1fb5:	f3 0f 7e 25 d3 12 00 	movq   xmm4,QWORD PTR [rip+0x12d3]        # 3290 <socket@plt+0x1ea0>
    1fbc:	00 
    1fbd:	48 8d 3d 40 10 00 00 	lea    rdi,[rip+0x1040]        # 3004 <socket@plt+0x1c14>
    1fc4:	66 0f 61 df          	punpcklwd xmm3,xmm7
    1fc8:	66 0f 61 cf          	punpcklwd xmm1,xmm7
    1fcc:	66 0f 6f f2          	movdqa xmm6,xmm2
    1fd0:	66 0f 70 db 4e       	pshufd xmm3,xmm3,0x4e
    1fd5:	66 0f 61 f5          	punpcklwd xmm6,xmm5
    1fd9:	66 44 0f 6f c4       	movdqa xmm8,xmm4
    1fde:	66 0f 61 cb          	punpcklwd xmm1,xmm3
    1fe2:	66 0f 6f da          	movdqa xmm3,xmm2
    1fe6:	66 0f 61 dd          	punpcklwd xmm3,xmm5
    1fea:	66 44 0f db c1       	pand   xmm8,xmm1
    1fef:	66 0f 70 db 4e       	pshufd xmm3,xmm3,0x4e
    1ff4:	66 0f 71 d1 08       	psrlw  xmm1,0x8
    1ff9:	66 0f 61 f3          	punpcklwd xmm6,xmm3
    1ffd:	66 0f 6f dc          	movdqa xmm3,xmm4
    2001:	66 0f db de          	pand   xmm3,xmm6
    2005:	66 0f 71 d6 08       	psrlw  xmm6,0x8
    200a:	66 44 0f 67 c3       	packuswb xmm8,xmm3
    200f:	66 0f 6f d9          	movdqa xmm3,xmm1
    2013:	66 0f db f4          	pand   xmm6,xmm4
    2017:	66 0f db dc          	pand   xmm3,xmm4
    201b:	66 0f 6f c8          	movdqa xmm1,xmm0
    201f:	66 45 0f 70 c0 08    	pshufd xmm8,xmm8,0x8
    2025:	66 0f 72 d1 10       	psrld  xmm1,0x10
    202a:	66 0f 72 d0 18       	psrld  xmm0,0x18
    202f:	66 0f 67 de          	packuswb xmm3,xmm6
    2033:	66 0f 70 db 08       	pshufd xmm3,xmm3,0x8
    2038:	66 0f 6f f7          	movdqa xmm6,xmm7
    203c:	66 0f 72 d6 10       	psrld  xmm6,0x10
    2041:	66 0f 72 d7 18       	psrld  xmm7,0x18
    2046:	66 44 0f 6f cb       	movdqa xmm9,xmm3
    204b:	66 45 0f 60 c8       	punpcklbw xmm9,xmm8
    2050:	66 41 0f 60 d8       	punpcklbw xmm3,xmm8
    2055:	66 44 0f 6f c1       	movdqa xmm8,xmm1
    205a:	66 44 0f 61 c6       	punpcklwd xmm8,xmm6
    205f:	66 0f 61 ce          	punpcklwd xmm1,xmm6
    2063:	66 0f 6f f2          	movdqa xmm6,xmm2
    2067:	66 45 0f 70 c0 4e    	pshufd xmm8,xmm8,0x4e
    206d:	66 0f 72 d6 10       	psrld  xmm6,0x10
    2072:	66 0f 70 db 4e       	pshufd xmm3,xmm3,0x4e
    2077:	66 41 0f 61 c8       	punpcklwd xmm1,xmm8
    207c:	66 44 0f 6f c5       	movdqa xmm8,xmm5
    2081:	66 44 0f 6f d6       	movdqa xmm10,xmm6
    2086:	66 41 0f 72 d0 10    	psrld  xmm8,0x10
    208c:	66 0f 72 d2 18       	psrld  xmm2,0x18
    2091:	66 0f db cc          	pand   xmm1,xmm4
    2095:	66 45 0f 61 d0       	punpcklwd xmm10,xmm8
    209a:	66 0f 72 d5 18       	psrld  xmm5,0x18
    209f:	66 41 0f 61 f0       	punpcklwd xmm6,xmm8
    20a4:	66 45 0f 70 d2 4e    	pshufd xmm10,xmm10,0x4e
    20aa:	66 41 0f 61 f2       	punpcklwd xmm6,xmm10
    20af:	66 0f db f4          	pand   xmm6,xmm4
    20b3:	66 0f 67 ce          	packuswb xmm1,xmm6
    20b7:	66 0f 6f f0          	movdqa xmm6,xmm0
    20bb:	66 0f 61 c7          	punpcklwd xmm0,xmm7
    20bf:	66 0f 61 f7          	punpcklwd xmm6,xmm7
    20c3:	66 0f 70 c9 08       	pshufd xmm1,xmm1,0x8
    20c8:	66 0f 70 f6 4e       	pshufd xmm6,xmm6,0x4e
    20cd:	66 0f 61 c6          	punpcklwd xmm0,xmm6
    20d1:	66 0f 6f f2          	movdqa xmm6,xmm2
    20d5:	66 0f 61 d5          	punpcklwd xmm2,xmm5
    20d9:	66 0f 61 f5          	punpcklwd xmm6,xmm5
    20dd:	66 0f db c4          	pand   xmm0,xmm4
    20e1:	66 0f 70 f6 4e       	pshufd xmm6,xmm6,0x4e
    20e6:	66 0f 61 d6          	punpcklwd xmm2,xmm6
    20ea:	66 0f db e2          	pand   xmm4,xmm2
    20ee:	66 0f 67 c4          	packuswb xmm0,xmm4
    20f2:	66 0f 70 c0 08       	pshufd xmm0,xmm0,0x8
    20f7:	66 0f 6f d0          	movdqa xmm2,xmm0
    20fb:	66 0f 60 c1          	punpcklbw xmm0,xmm1
    20ff:	66 0f 60 d1          	punpcklbw xmm2,xmm1
    2103:	66 0f 70 c0 4e       	pshufd xmm0,xmm0,0x4e
    2108:	66 0f 6f ca          	movdqa xmm1,xmm2
    210c:	66 41 0f 61 d1       	punpcklwd xmm2,xmm9
    2111:	66 41 0f 61 c9       	punpcklwd xmm1,xmm9
    2116:	66 0f 70 d2 4e       	pshufd xmm2,xmm2,0x4e
    211b:	66 0f d6 8c 24 90 00 	movq   QWORD PTR [rsp+0x90],xmm1
    2122:	00 00 
    2124:	66 0f 6f c8          	movdqa xmm1,xmm0
    2128:	66 0f 61 c3          	punpcklwd xmm0,xmm3
    212c:	66 0f 61 cb          	punpcklwd xmm1,xmm3
    2130:	66 0f 70 c0 4e       	pshufd xmm0,xmm0,0x4e
    2135:	66 0f d6 94 24 98 00 	movq   QWORD PTR [rsp+0x98],xmm2
    213c:	00 00 
    213e:	66 0f d6 8c 24 a0 00 	movq   QWORD PTR [rsp+0xa0],xmm1
    2145:	00 00 
    2147:	66 0f d6 84 24 a8 00 	movq   QWORD PTR [rsp+0xa8],xmm0
    214e:	00 00 
    2150:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    2154:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    215b:	00 00 00 00 
    215f:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    2166:	00 00 00 00 
    216a:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    2171:	00 00 00 00 
    2175:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    217c:	00 00 00 00 
    2180:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
    2183:	48 83 c1 01          	add    rcx,0x1
    2187:	48 83 c2 02          	add    rdx,0x2
    218b:	89 c6                	mov    esi,eax
    218d:	83 e0 0f             	and    eax,0xf
    2190:	40 c0 ee 04          	shr    sil,0x4
    2194:	0f b6 04 07          	movzx  eax,BYTE PTR [rdi+rax*1]
    2198:	40 0f b6 f6          	movzx  esi,sil
    219c:	0f b6 34 37          	movzx  esi,BYTE PTR [rdi+rsi*1]
    21a0:	88 42 ff             	mov    BYTE PTR [rdx-0x1],al
    21a3:	40 88 72 fe          	mov    BYTE PTR [rdx-0x2],sil
    21a7:	49 39 c8             	cmp    r8,rcx
    21aa:	75 d4                	jne    2180 <socket@plt+0xd90>
    21ac:	c6 43 40 00          	mov    BYTE PTR [rbx+0x40],0x0
    21b0:	48 8b 84 24 b8 00 00 	mov    rax,QWORD PTR [rsp+0xb8]
    21b7:	00 
    21b8:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    21bf:	00 00 
    21c1:	75 0e                	jne    21d1 <socket@plt+0xde1>
    21c3:	48 81 c4 c8 00 00 00 	add    rsp,0xc8
    21ca:	5b                   	pop    rbx
    21cb:	5d                   	pop    rbp
    21cc:	41 5c                	pop    r12
    21ce:	41 5d                	pop    r13
    21d0:	c3                   	ret
    21d1:	e8 ca f0 ff ff       	call   12a0 <__stack_chk_fail@plt>
    21d6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    21dd:	00 00 00 
    21e0:	41 57                	push   r15
    21e2:	41 56                	push   r14
    21e4:	41 55                	push   r13
    21e6:	41 54                	push   r12
    21e8:	55                   	push   rbp
    21e9:	53                   	push   rbx
    21ea:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
    21f1:	48 83 0c 24 00       	or     QWORD PTR [rsp],0x0
    21f6:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
    21fd:	48 83 0c 24 00       	or     QWORD PTR [rsp],0x0
    2202:	48 81 ec f8 06 00 00 	sub    rsp,0x6f8
    2209:	31 f6                	xor    esi,esi
    220b:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    2212:	00 00 
    2214:	48 89 84 24 e8 26 00 	mov    QWORD PTR [rsp+0x26e8],rax
    221b:	00 
    221c:	31 c0                	xor    eax,eax
    221e:	89 fd                	mov    ebp,edi
    2220:	48 8d 3d ee 0d 00 00 	lea    rdi,[rip+0xdee]        # 3015 <socket@plt+0x1c25>
    2227:	48 8d 9c 24 e0 06 00 	lea    rbx,[rsp+0x6e0]
    222e:	00 
    222f:	e8 5c f1 ff ff       	call   1390 <open@plt>
    2234:	41 89 c6             	mov    r14d,eax
    2237:	85 c0                	test   eax,eax
    2239:	0f 89 ad 04 00 00    	jns    26ec <socket@plt+0x12fc>
    223f:	49 89 dc             	mov    r12,rbx
    2242:	4c 8d ac 24 f0 06 00 	lea    r13,[rsp+0x6f0]
    2249:	00 
    224a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    2250:	e8 8b f1 ff ff       	call   13e0 <rand@plt>
    2255:	49 83 c4 01          	add    r12,0x1
    2259:	41 88 44 24 ff       	mov    BYTE PTR [r12-0x1],al
    225e:	4d 39 e5             	cmp    r13,r12
    2261:	75 ed                	jne    2250 <socket@plt+0xe60>
    2263:	45 85 f6             	test   r14d,r14d
    2266:	0f 89 99 04 00 00    	jns    2705 <socket@plt+0x1315>
    226c:	48 89 de             	mov    rsi,rbx
    226f:	49 89 e1             	mov    r9,rsp
    2272:	4c 8d 44 24 20       	lea    r8,[rsp+0x20]
    2277:	48 89 e0             	mov    rax,rsp
    227a:	48 8d 3d 83 0d 00 00 	lea    rdi,[rip+0xd83]        # 3004 <socket@plt+0x1c14>
    2281:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    2288:	00 
    2289:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    2290:	00 00 00 00 
    2294:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    229b:	00 00 00 00 
    229f:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    22a6:	00 00 00 00 
    22aa:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    22b1:	00 00 00 00 
    22b5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    22bc:	00 00 00 00 
    22c0:	0f b6 16             	movzx  edx,BYTE PTR [rsi]
    22c3:	48 83 c0 02          	add    rax,0x2
    22c7:	48 83 c6 01          	add    rsi,0x1
    22cb:	89 d1                	mov    ecx,edx
    22cd:	83 e2 0f             	and    edx,0xf
    22d0:	c0 e9 04             	shr    cl,0x4
    22d3:	0f b6 14 17          	movzx  edx,BYTE PTR [rdi+rdx*1]
    22d7:	0f b6 c9             	movzx  ecx,cl
    22da:	0f b6 0c 0f          	movzx  ecx,BYTE PTR [rdi+rcx*1]
    22de:	88 50 ff             	mov    BYTE PTR [rax-0x1],dl
    22e1:	88 48 fe             	mov    BYTE PTR [rax-0x2],cl
    22e4:	49 39 c0             	cmp    r8,rax
    22e7:	75 d7                	jne    22c0 <socket@plt+0xed0>
    22e9:	4c 8d 05 32 0d 00 00 	lea    r8,[rip+0xd32]        # 3022 <socket@plt+0x1c32>
    22f0:	b9 00 01 00 00       	mov    ecx,0x100
    22f5:	ba 02 00 00 00       	mov    edx,0x2
    22fa:	be 00 01 00 00       	mov    esi,0x100
    22ff:	48 8d bc 24 e0 01 00 	lea    rdi,[rsp+0x1e0]
    2306:	00 
    2307:	31 c0                	xor    eax,eax
    2309:	c6 44 24 20 00       	mov    BYTE PTR [rsp+0x20],0x0
    230e:	4c 8d b4 24 f0 00 00 	lea    r14,[rsp+0xf0]
    2315:	00 
    2316:	e8 15 ef ff ff       	call   1230 <__snprintf_chk@plt>
    231b:	48 8d bc 24 e0 01 00 	lea    rdi,[rsp+0x1e0]
    2322:	00 
    2323:	4c 89 f2             	mov    rdx,r14
    2326:	4c 8d ac 24 e0 02 00 	lea    r13,[rsp+0x2e0]
    232d:	00 
    232e:	48 63 f0             	movsxd rsi,eax
    2331:	e8 3a fb ff ff       	call   1e70 <socket@plt+0xa80>
    2336:	b9 00 02 00 00       	mov    ecx,0x200
    233b:	4c 89 ef             	mov    rdi,r13
    233e:	31 c0                	xor    eax,eax
    2340:	4c 8d 8c 24 e0 01 00 	lea    r9,[rsp+0x1e0]
    2347:	00 
    2348:	48 83 ec 08          	sub    rsp,0x8
    234c:	ba 02 00 00 00       	mov    edx,0x2
    2351:	be 00 02 00 00       	mov    esi,0x200
    2356:	41 56                	push   r14
    2358:	4c 8d 05 df 0c 00 00 	lea    r8,[rip+0xcdf]        # 303e <socket@plt+0x1c4e>
    235f:	e8 cc ee ff ff       	call   1230 <__snprintf_chk@plt>
    2364:	4c 89 ee             	mov    rsi,r13
    2367:	89 ef                	mov    edi,ebp
    2369:	48 63 d0             	movsxd rdx,eax
    236c:	e8 cf f8 ff ff       	call   1c40 <socket@plt+0x850>
    2371:	58                   	pop    rax
    2372:	5a                   	pop    rdx
    2373:	4c 8d a4 24 e0 04 00 	lea    r12,[rsp+0x4e0]
    237a:	00 
    237b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    2380:	ba 04 00 00 00       	mov    edx,0x4
    2385:	4c 89 e6             	mov    rsi,r12
    2388:	89 ef                	mov    edi,ebp
    238a:	e8 51 f8 ff ff       	call   1be0 <socket@plt+0x7f0>
    238f:	85 c0                	test   eax,eax
    2391:	0f 85 54 02 00 00    	jne    25eb <socket@plt+0x11fb>
    2397:	80 bc 24 e0 04 00 00 	cmp    BYTE PTR [rsp+0x4e0],0xdb
    239e:	db 
    239f:	0f 85 46 02 00 00    	jne    25eb <socket@plt+0x11fb>
    23a5:	80 bc 24 e1 04 00 00 	cmp    BYTE PTR [rsp+0x4e1],0x1
    23ac:	01 
    23ad:	0f 85 38 02 00 00    	jne    25eb <socket@plt+0x11fb>
    23b3:	0f b7 84 24 e2 04 00 	movzx  eax,WORD PTR [rsp+0x4e2]
    23ba:	00 
    23bb:	66 c1 c0 08          	rol    ax,0x8
    23bf:	0f b7 d0             	movzx  edx,ax
    23c2:	81 fa 00 20 00 00    	cmp    edx,0x2000
    23c8:	0f 8f 1d 02 00 00    	jg     25eb <socket@plt+0x11fb>
    23ce:	85 d2                	test   edx,edx
    23d0:	74 ae                	je     2380 <socket@plt+0xf90>
    23d2:	44 0f b7 f0          	movzx  r14d,ax
    23d6:	48 89 de             	mov    rsi,rbx
    23d9:	89 ef                	mov    edi,ebp
    23db:	4c 89 f2             	mov    rdx,r14
    23de:	e8 fd f7 ff ff       	call   1be0 <socket@plt+0x7f0>
    23e3:	85 c0                	test   eax,eax
    23e5:	0f 85 00 02 00 00    	jne    25eb <socket@plt+0x11fb>
    23eb:	4a 8d 34 33          	lea    rsi,[rbx+r14*1]
    23ef:	48 89 d8             	mov    rax,rbx
    23f2:	ba 5a 00 00 00       	mov    edx,0x5a
    23f7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    23fe:	00 00 
    2400:	89 d1                	mov    ecx,edx
    2402:	30 10                	xor    BYTE PTR [rax],dl
    2404:	48 83 c0 01          	add    rax,0x1
    2408:	c1 e1 05             	shl    ecx,0x5
    240b:	8d 54 0a 07          	lea    edx,[rdx+rcx*1+0x7]
    240f:	48 39 f0             	cmp    rax,rsi
    2412:	75 ec                	jne    2400 <socket@plt+0x1010>
    2414:	48 8d 4c 24 30       	lea    rcx,[rsp+0x30]
    2419:	48 8d 15 b6 0c 00 00 	lea    rdx,[rip+0xcb6]        # 30d6 <socket@plt+0x1ce6>
    2420:	4c 89 f6             	mov    rsi,r14
    2423:	48 89 df             	mov    rdi,rbx
    2426:	e8 35 f9 ff ff       	call   1d60 <socket@plt+0x970>
    242b:	81 7c 24 30 70 69 6e 	cmp    DWORD PTR [rsp+0x30],0x676e6970
    2432:	67 
    2433:	0f 84 8f 00 00 00    	je     24c8 <socket@plt+0x10d8>
    2439:	81 7c 24 30 73 74 61 	cmp    DWORD PTR [rsp+0x30],0x74617473
    2440:	74 
    2441:	0f 84 71 01 00 00    	je     25b8 <socket@plt+0x11c8>
    2447:	81 7c 24 30 71 75 69 	cmp    DWORD PTR [rsp+0x30],0x74697571
    244e:	74 
    244f:	0f 84 8b 01 00 00    	je     25e0 <socket@plt+0x11f0>
    2455:	49 83 fe 04          	cmp    r14,0x4
    2459:	0f 86 c8 01 00 00    	jbe    2627 <socket@plt+0x1237>
    245f:	4d 8d 6e fb          	lea    r13,[r14-0x5]
    2463:	4a 8d 44 33 fb       	lea    rax,[rbx+r14*1-0x5]
    2468:	eb 28                	jmp    2492 <socket@plt+0x10a2>
    246a:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    2471:	00 00 00 00 
    2475:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    247c:	00 00 00 00 
    2480:	49 83 ed 01          	sub    r13,0x1
    2484:	48 83 e8 01          	sub    rax,0x1
    2488:	49 83 fd ff          	cmp    r13,0xffffffffffffffff
    248c:	0f 84 95 01 00 00    	je     2627 <socket@plt+0x1237>
    2492:	81 38 26 73 69 67    	cmp    DWORD PTR [rax],0x67697326
    2498:	75 e6                	jne    2480 <socket@plt+0x1090>
    249a:	80 78 04 3d          	cmp    BYTE PTR [rax+0x4],0x3d
    249e:	75 e0                	jne    2480 <socket@plt+0x1090>
    24a0:	4d 29 ee             	sub    r14,r13
    24a3:	49 83 fe 45          	cmp    r14,0x45
    24a7:	74 47                	je     24f0 <socket@plt+0x1100>
    24a9:	ba 0a 00 00 00       	mov    edx,0xa
    24ae:	48 8d 35 bc 0b 00 00 	lea    rsi,[rip+0xbbc]        # 3071 <socket@plt+0x1c81>
    24b5:	89 ef                	mov    edi,ebp
    24b7:	e8 84 f7 ff ff       	call   1c40 <socket@plt+0x850>
    24bc:	e9 bf fe ff ff       	jmp    2380 <socket@plt+0xf90>
    24c1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    24c8:	80 7c 24 34 00       	cmp    BYTE PTR [rsp+0x34],0x0
    24cd:	0f 85 66 ff ff ff    	jne    2439 <socket@plt+0x1049>
    24d3:	ba 04 00 00 00       	mov    edx,0x4
    24d8:	48 8d 35 6e 0b 00 00 	lea    rsi,[rip+0xb6e]        # 304d <socket@plt+0x1c5d>
    24df:	89 ef                	mov    edi,ebp
    24e1:	e8 5a f7 ff ff       	call   1c40 <socket@plt+0x850>
    24e6:	e9 95 fe ff ff       	jmp    2380 <socket@plt+0xf90>
    24eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    24f0:	4a 8d 44 2b 05       	lea    rax,[rbx+r13*1+0x5]
    24f5:	4c 89 ee             	mov    rsi,r13
    24f8:	48 89 df             	mov    rdi,rbx
    24fb:	c6 84 24 80 01 00 00 	mov    BYTE PTR [rsp+0x180],0x0
    2502:	00 
    2503:	f3 0f 6f 00          	movdqu xmm0,XMMWORD PTR [rax]
    2507:	48 8d 94 24 90 01 00 	lea    rdx,[rsp+0x190]
    250e:	00 
    250f:	0f 29 84 24 40 01 00 	movaps XMMWORD PTR [rsp+0x140],xmm0
    2516:	00 
    2517:	f3 0f 6f 40 10       	movdqu xmm0,XMMWORD PTR [rax+0x10]
    251c:	0f 29 84 24 50 01 00 	movaps XMMWORD PTR [rsp+0x150],xmm0
    2523:	00 
    2524:	f3 0f 6f 40 20       	movdqu xmm0,XMMWORD PTR [rax+0x20]
    2529:	0f 29 84 24 60 01 00 	movaps XMMWORD PTR [rsp+0x160],xmm0
    2530:	00 
    2531:	f3 0f 6f 40 30       	movdqu xmm0,XMMWORD PTR [rax+0x30]
    2536:	0f 29 84 24 70 01 00 	movaps XMMWORD PTR [rsp+0x170],xmm0
    253d:	00 
    253e:	e8 2d f9 ff ff       	call   1e70 <socket@plt+0xa80>
    2543:	48 8d b4 24 90 01 00 	lea    rsi,[rsp+0x190]
    254a:	00 
    254b:	48 8d bc 24 40 01 00 	lea    rdi,[rsp+0x140]
    2552:	00 
    2553:	e8 98 ed ff ff       	call   12f0 <strcmp@plt>
    2558:	85 c0                	test   eax,eax
    255a:	0f 85 b4 00 00 00    	jne    2614 <socket@plt+0x1224>
    2560:	48 8d 4c 24 70       	lea    rcx,[rsp+0x70]
    2565:	48 8d 15 10 0b 00 00 	lea    rdx,[rip+0xb10]        # 307c <socket@plt+0x1c8c>
    256c:	4c 89 ee             	mov    rsi,r13
    256f:	48 89 df             	mov    rdi,rbx
    2572:	e8 e9 f7 ff ff       	call   1d60 <socket@plt+0x970>
    2577:	48 8d 8c 24 b0 00 00 	lea    rcx,[rsp+0xb0]
    257e:	00 
    257f:	4c 89 ee             	mov    rsi,r13
    2582:	48 89 df             	mov    rdi,rbx
    2585:	48 8d 15 4a 0b 00 00 	lea    rdx,[rip+0xb4a]        # 30d6 <socket@plt+0x1ce6>
    258c:	e8 cf f7 ff ff       	call   1d60 <socket@plt+0x970>
    2591:	81 7c 24 70 61 64 6d 	cmp    DWORD PTR [rsp+0x70],0x696d6461
    2598:	69 
    2599:	0f 84 9b 00 00 00    	je     263a <socket@plt+0x124a>
    259f:	48 8d 35 db 0a 00 00 	lea    rsi,[rip+0xadb]        # 3081 <socket@plt+0x1c91>
    25a6:	89 ef                	mov    edi,ebp
    25a8:	e8 83 f7 ff ff       	call   1d30 <socket@plt+0x940>
    25ad:	e9 ce fd ff ff       	jmp    2380 <socket@plt+0xf90>
    25b2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    25b8:	81 7c 24 33 74 75 73 	cmp    DWORD PTR [rsp+0x33],0x737574
    25bf:	00 
    25c0:	0f 85 81 fe ff ff    	jne    2447 <socket@plt+0x1057>
    25c6:	48 8d 35 6b 0b 00 00 	lea    rsi,[rip+0xb6b]        # 3138 <socket@plt+0x1d48>
    25cd:	89 ef                	mov    edi,ebp
    25cf:	e8 5c f7 ff ff       	call   1d30 <socket@plt+0x940>
    25d4:	e9 a7 fd ff ff       	jmp    2380 <socket@plt+0xf90>
    25d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    25e0:	80 7c 24 34 00       	cmp    BYTE PTR [rsp+0x34],0x0
    25e5:	0f 85 6a fe ff ff    	jne    2455 <socket@plt+0x1065>
    25eb:	48 8b 84 24 e8 26 00 	mov    rax,QWORD PTR [rsp+0x26e8]
    25f2:	00 
    25f3:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    25fa:	00 00 
    25fc:	0f 85 10 01 00 00    	jne    2712 <socket@plt+0x1322>
    2602:	48 81 c4 f8 26 00 00 	add    rsp,0x26f8
    2609:	5b                   	pop    rbx
    260a:	5d                   	pop    rbp
    260b:	41 5c                	pop    r12
    260d:	41 5d                	pop    r13
    260f:	41 5e                	pop    r14
    2611:	41 5f                	pop    r15
    2613:	c3                   	ret
    2614:	48 8d 35 56 0a 00 00 	lea    rsi,[rip+0xa56]        # 3071 <socket@plt+0x1c81>
    261b:	89 ef                	mov    edi,ebp
    261d:	e8 0e f7 ff ff       	call   1d30 <socket@plt+0x940>
    2622:	e9 59 fd ff ff       	jmp    2380 <socket@plt+0xf90>
    2627:	48 8d 35 36 0a 00 00 	lea    rsi,[rip+0xa36]        # 3064 <socket@plt+0x1c74>
    262e:	89 ef                	mov    edi,ebp
    2630:	e8 fb f6 ff ff       	call   1d30 <socket@plt+0x940>
    2635:	e9 46 fd ff ff       	jmp    2380 <socket@plt+0xf90>
    263a:	66 83 7c 24 74 6e    	cmp    WORD PTR [rsp+0x74],0x6e
    2640:	0f 85 59 ff ff ff    	jne    259f <socket@plt+0x11af>
    2646:	81 bc 24 b0 00 00 00 	cmp    DWORD PTR [rsp+0xb0],0x706d7564
    264d:	64 75 6d 70 
    2651:	74 20                	je     2673 <socket@plt+0x1283>
    2653:	81 bc 24 b0 00 00 00 	cmp    DWORD PTR [rsp+0xb0],0x6f6c6e75
    265a:	75 6e 6c 6f 
    265e:	74 6c                	je     26cc <socket@plt+0x12dc>
    2660:	48 8d 35 63 0a 00 00 	lea    rsi,[rip+0xa63]        # 30ca <socket@plt+0x1cda>
    2667:	89 ef                	mov    edi,ebp
    2669:	e8 c2 f6 ff ff       	call   1d30 <socket@plt+0x940>
    266e:	e9 0d fd ff ff       	jmp    2380 <socket@plt+0xf90>
    2673:	80 bc 24 b4 00 00 00 	cmp    BYTE PTR [rsp+0xb4],0x0
    267a:	00 
    267b:	75 d6                	jne    2653 <socket@plt+0x1263>
    267d:	48 8d 3d 18 0a 00 00 	lea    rdi,[rip+0xa18]        # 309c <socket@plt+0x1cac>
    2684:	e8 97 eb ff ff       	call   1220 <getenv@plt>
    2689:	49 89 c1             	mov    r9,rax
    268c:	48 85 c0             	test   rax,rax
    268f:	74 05                	je     2696 <socket@plt+0x12a6>
    2691:	80 38 00             	cmp    BYTE PTR [rax],0x0
    2694:	75 07                	jne    269d <socket@plt+0x12ad>
    2696:	4c 8d 0d 6b 0a 00 00 	lea    r9,[rip+0xa6b]        # 3108 <socket@plt+0x1d18>
    269d:	4c 89 e7             	mov    rdi,r12
    26a0:	b9 00 02 00 00       	mov    ecx,0x200
    26a5:	ba 02 00 00 00       	mov    edx,0x2
    26aa:	31 c0                	xor    eax,eax
    26ac:	4c 8d 05 ee 09 00 00 	lea    r8,[rip+0x9ee]        # 30a1 <socket@plt+0x1cb1>
    26b3:	be 00 02 00 00       	mov    esi,0x200
    26b8:	e8 73 eb ff ff       	call   1230 <__snprintf_chk@plt>
    26bd:	4c 89 e6             	mov    rsi,r12
    26c0:	89 ef                	mov    edi,ebp
    26c2:	e8 69 f6 ff ff       	call   1d30 <socket@plt+0x940>
    26c7:	e9 1f ff ff ff       	jmp    25eb <socket@plt+0x11fb>
    26cc:	81 bc 24 b3 00 00 00 	cmp    DWORD PTR [rsp+0xb3],0x6b636f
    26d3:	6f 63 6b 00 
    26d7:	75 87                	jne    2660 <socket@plt+0x1270>
    26d9:	48 8d 35 d6 09 00 00 	lea    rsi,[rip+0x9d6]        # 30b6 <socket@plt+0x1cc6>
    26e0:	89 ef                	mov    edi,ebp
    26e2:	e8 49 f6 ff ff       	call   1d30 <socket@plt+0x940>
    26e7:	e9 94 fc ff ff       	jmp    2380 <socket@plt+0xf90>
    26ec:	ba 10 00 00 00       	mov    edx,0x10
    26f1:	48 89 de             	mov    rsi,rbx
    26f4:	89 c7                	mov    edi,eax
    26f6:	e8 c5 eb ff ff       	call   12c0 <read@plt>
    26fb:	48 83 f8 10          	cmp    rax,0x10
    26ff:	0f 85 3a fb ff ff    	jne    223f <socket@plt+0xe4f>
    2705:	44 89 f7             	mov    edi,r14d
    2708:	e8 a3 eb ff ff       	call   12b0 <close@plt>
    270d:	e9 5a fb ff ff       	jmp    226c <socket@plt+0xe7c>
    2712:	e8 89 eb ff ff       	call   12a0 <__stack_chk_fail@plt>

Disassembly of section .fini:

0000000000002718 <.fini>:
    2718:	f3 0f 1e fa          	endbr64
    271c:	48 83 ec 08          	sub    rsp,0x8
    2720:	48 83 c4 08          	add    rsp,0x8
    2724:	c3                   	ret
