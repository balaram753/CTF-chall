use omega_core::{derive_nonce, hex_decode, hex_encode, make_capsule, validate, INPUT_LEN, SESSION_LEN};
use std::env;
use std::io::{BufRead, BufReader, Write};
use std::net::{TcpListener, TcpStream};
use std::thread;

const DEFAULT_SERIAL: &[u8; INPUT_LEN] = b"trace_the_ashen_thread_9f2a7c1de";
const DEFAULT_FLAG: &str = "DNCTF{the_oracle_remembers_every_branch_you_took}";

fn fixed_bytes<const N: usize>(name: &str, fallback: &[u8; N]) -> [u8; N] {
    match env::var(name) {
        Ok(value) if value.as_bytes().len() == N => {
            let mut output = [0u8; N];
            output.copy_from_slice(value.as_bytes());
            output
        }
        _ => *fallback,
    }
}

fn read_line(reader: &mut BufReader<TcpStream>) -> Result<String, &'static str> {
    let mut line = String::new();
    reader.read_line(&mut line).map_err(|_| "read failure")?;
    if line.len() > 4096 {
        return Err("line too long");
    }
    Ok(line.trim().to_owned())
}

fn parse_session(text: &str) -> Result<[u8; SESSION_LEN], &'static str> {
    let decoded = hex_decode(text).map_err(|_| "bad session encoding")?;
    if decoded.len() != SESSION_LEN {
        return Err("bad session length");
    }
    let mut session = [0u8; SESSION_LEN];
    session.copy_from_slice(&decoded);
    Ok(session)
}

fn parse_candidate(text: &str) -> Result<[u8; INPUT_LEN], &'static str> {
    let decoded = hex_decode(text).map_err(|_| "bad candidate encoding")?;
    if decoded.len() != INPUT_LEN {
        return Err("bad candidate length");
    }
    let mut candidate = [0u8; INPUT_LEN];
    candidate.copy_from_slice(&decoded);
    Ok(candidate)
}

fn handle(mut stream: TcpStream, master_seed: Vec<u8>, expected: [u8; INPUT_LEN], flag: String) {
    let result = (|| -> Result<(), &'static str> {
        let mut reader = BufReader::new(stream.try_clone().map_err(|_| "clone failure")?);
        let hello = read_line(&mut reader)?;
        let session_text = hello.strip_prefix("HELLO ").ok_or("expected HELLO")?;
        let session = parse_session(session_text)?;
        let nonce = derive_nonce(&master_seed, &session);
        let capsule = make_capsule(nonce, &expected).map_err(|_| "capsule generation failed")?;
        writeln!(stream, "CAPSULE {}", omega_core::encode_capsule(&capsule)).map_err(|_| "write failure")?;

        let solve = read_line(&mut reader)?;
        let mut fields = solve.split_whitespace();
        if fields.next() != Some("SOLVE") {
            return Err("expected SOLVE");
        }
        let submitted_session = parse_session(fields.next().ok_or("missing session")?)?;
        let candidate = parse_candidate(fields.next().ok_or("missing candidate")?)?;
        let trace = u64::from_str_radix(fields.next().ok_or("missing trace")?, 16).map_err(|_| "bad trace")?;
        if fields.next().is_some() || submitted_session != session {
            return Err("malformed solve");
        }
        let verdict = validate(&capsule, &candidate).map_err(|_| "validation failure")?;
        if verdict.accepted && verdict.trace == trace && candidate == expected {
            writeln!(stream, "FLAG {}", flag).map_err(|_| "write failure")?;
        } else {
            writeln!(stream, "NO {}", hex_encode(&session)).map_err(|_| "write failure")?;
        }
        Ok(())
    })();

    if result.is_err() {
        let _ = writeln!(stream, "ERR protocol");
    }
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let bind = env::var("OMEGA_BIND").unwrap_or_else(|_| "0.0.0.0:7000".to_owned());
    let master_seed = env::var("OMEGA_MASTER_SEED")
        .unwrap_or_else(|_| "omega-development-seed-change-before-event".to_owned())
        .into_bytes();
    let expected = fixed_bytes("OMEGA_SERIAL", DEFAULT_SERIAL);
    let flag = env::var("OMEGA_FLAG").unwrap_or_else(|_| DEFAULT_FLAG.to_owned());
    let listener = TcpListener::bind(&bind)?;
    eprintln!("omega oracle listening on {}", bind);

    for connection in listener.incoming() {
        match connection {
            Ok(stream) => {
                let seed = master_seed.clone();
                let candidate = expected;
                let event_flag = flag.clone();
                thread::spawn(move || handle(stream, seed, candidate, event_flag));
            }
            Err(error) => eprintln!("accept error: {}", error),
        }
    }
    Ok(())
}
