use omega_core::{decode_capsule, hex_encode, validate, INPUT_LEN, SESSION_LEN};
use std::env;
use std::io::{self, BufRead, BufReader, Write};
use std::net::TcpStream;
use std::process;
use std::time::{SystemTime, UNIX_EPOCH};

fn session_id() -> [u8; SESSION_LEN] {
    if let Ok(value) = env::var("OMEGA_SESSION") {
        if let Ok(decoded) = omega_core::hex_decode(value.trim()) {
            if decoded.len() == SESSION_LEN {
                let mut session = [0u8; SESSION_LEN];
                session.copy_from_slice(&decoded);
                return session;
            }
        }
    }

    let now = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap_or_default()
        .as_nanos();
    let pid = process::id() as u128;
    (now ^ (pid << 64) ^ 0x6f6d_6567_615f_7365_7373_696f_6e21u128).to_le_bytes()
}

fn read_line(reader: &mut BufReader<TcpStream>) -> io::Result<String> {
    let mut line = String::new();
    reader.read_line(&mut line)?;
    if line.len() > 4096 {
        return Err(io::Error::new(io::ErrorKind::InvalidData, "oracle line too long"));
    }
    Ok(line.trim().to_owned())
}

fn run() -> Result<(), Box<dyn std::error::Error>> {
    let endpoint = env::args()
        .nth(1)
        .or_else(|| env::var("OMEGA_ENDPOINT").ok())
        .unwrap_or_else(|| "127.0.0.1:5007".to_owned());
    let session = session_id();
    let mut stream = TcpStream::connect(&endpoint)?;
    stream.set_nodelay(true)?;
    writeln!(stream, "HELLO {}", hex_encode(&session))?;

    let mut reader = BufReader::new(stream.try_clone()?);
    let greeting = read_line(&mut reader)?;
    let capsule_text = greeting
        .strip_prefix("CAPSULE ")
        .ok_or("oracle rejected the session")?;
    let capsule = decode_capsule(capsule_text)?;

    println!("session {}", hex_encode(&session));
    print!("rite> ");
    io::stdout().flush()?;
    let mut candidate_text = String::new();
    io::stdin().read_line(&mut candidate_text)?;
    let candidate_text = candidate_text.trim_end_matches(['\r', '\n']);
    if candidate_text.len() != INPUT_LEN || !candidate_text.bytes().all(|byte| byte.is_ascii_graphic()) {
        println!("the thread breaks before the first gate");
        return Ok(());
    }
    let mut candidate = [0u8; INPUT_LEN];
    candidate.copy_from_slice(candidate_text.as_bytes());
    let verdict = validate(&capsule, &candidate)?;
    if !verdict.accepted {
        println!("the archive forgets you");
        return Ok(());
    }

    writeln!(
        stream,
        "SOLVE {} {} {:016x}",
        hex_encode(&session),
        hex_encode(&candidate),
        verdict.trace
    )?;
    let answer = read_line(&mut reader)?;
    if let Some(flag) = answer.strip_prefix("FLAG ") {
        println!("{}", flag);
    } else {
        println!("the oracle closes its eye");
    }
    Ok(())
}

fn main() {
    if let Err(error) = run() {
        eprintln!("omega: {}", error);
        process::exit(1);
    }
}

