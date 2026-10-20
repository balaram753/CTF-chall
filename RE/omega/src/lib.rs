use std::fmt;

pub const INPUT_LEN: usize = 32;
pub const SESSION_LEN: usize = 16;
pub const LANE_COUNT: usize = 4;
const ROUNDS: usize = 36;
const OP_COUNT: usize = 12;

#[derive(Clone, Debug, Eq, PartialEq)]
pub struct Capsule {
    pub nonce: [u8; 16],
    pub targets: [u64; LANE_COUNT],
    pub trace_target: u64,
    pub seal: u64,
}

#[derive(Clone, Debug, Eq, PartialEq)]
pub struct Verdict {
    pub accepted: bool,
    pub trace: u64,
    pub lanes: [u64; LANE_COUNT],
}

#[derive(Debug, Clone)]
pub struct ParseError(pub &'static str);

impl fmt::Display for ParseError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str(self.0)
    }
}

impl std::error::Error for ParseError {}

#[derive(Clone, Copy)]
#[repr(u8)]
enum CanonicalOp {
    Load = 0,
    XorImm = 1,
    AddImm = 2,
    MulImm = 3,
    XorRot = 4,
    Rotate = 5,
    Swap = 6,
    Push = 7,
    PopXor = 8,
    Trace = 9,
    Check = 10,
    Halt = 11,
}

#[derive(Clone)]
struct Prng {
    state: u64,
}

impl Prng {
    fn new(seed: u64) -> Self {
        Self { state: seed }
    }

    fn next(&mut self) -> u64 {
        self.state = self.state.wrapping_add(0x9e37_79b9_7f4a_7c15);
        avalanche(self.state)
    }
}

fn avalanche(mut value: u64) -> u64 {
    value ^= value >> 30;
    value = value.wrapping_mul(0xbf58_476d_1ce4_e5b9);
    value ^= value >> 27;
    value = value.wrapping_mul(0x94d0_49bb_1331_11eb);
    value ^ (value >> 31)
}

fn fold_bytes(bytes: &[u8], seed: u64) -> u64 {
    let mut state = seed ^ ((bytes.len() as u64) << 48);
    for (index, byte) in bytes.iter().enumerate() {
        state ^= (*byte as u64) << ((index & 7) * 8);
        state = avalanche(state ^ (index as u64).wrapping_mul(0x1000_0000_01b3));
    }
    state
}

fn nonce_words(nonce: &[u8; 16]) -> [u64; 2] {
    let mut left = [0u8; 8];
    let mut right = [0u8; 8];
    left.copy_from_slice(&nonce[..8]);
    right.copy_from_slice(&nonce[8..]);
    [u64::from_le_bytes(left), u64::from_le_bytes(right)]
}

pub fn derive_nonce(master_seed: &[u8], session: &[u8; SESSION_LEN]) -> [u8; 16] {
    let left = fold_bytes(master_seed, 0x6f6d_6567_612d_6f72) ^ fold_bytes(session, 0x6163_6c65_2d61_7368);
    let right = fold_bytes(session, left ^ 0x7468_7265_6164_6564)
        ^ fold_bytes(master_seed, 0x766f_6964_2d67_6174);
    let mut nonce = [0u8; 16];
    nonce[..8].copy_from_slice(&avalanche(left).to_le_bytes());
    nonce[8..].copy_from_slice(&avalanche(right ^ left.rotate_left(17)).to_le_bytes());
    nonce
}

fn opcode_map(nonce: &[u8; 16]) -> [u8; OP_COUNT] {
    let words = nonce_words(nonce);
    let mut prng = Prng::new(words[0] ^ words[1].rotate_left(23) ^ 0x4f50_434f_4445_4d41);
    let mut map = [0u8; OP_COUNT];
    for (index, slot) in map.iter_mut().enumerate() {
        *slot = index as u8;
    }
    for index in (1..OP_COUNT).rev() {
        let swap_with = (prng.next() as usize) % (index + 1);
        map.swap(index, swap_with);
    }
    map
}

fn tape_mask(nonce: &[u8; 16], index: usize) -> u8 {
    let words = nonce_words(nonce);
    let block = (index / 8) as u64;
    let lane = (index & 7) * 8;
    let mask = avalanche(words[index & 1] ^ block.wrapping_mul(0xd6e8_feb8_6659_fd93) ^ 0x5441_5045_2d4d_4153);
    ((mask >> lane) as u8).rotate_left((index & 7) as u32)
}

fn emit_u64(tape: &mut Vec<u8>, value: u64) {
    tape.extend_from_slice(&value.to_le_bytes());
}

fn emit_op(tape: &mut Vec<u8>, map: &[u8; OP_COUNT], op: CanonicalOp) {
    tape.push(map[op as usize]);
}

fn runtime_program(nonce: &[u8; 16]) -> Vec<u8> {
    let map = opcode_map(nonce);
    let words = nonce_words(nonce);
    let mut prng = Prng::new(words[0] ^ words[1] ^ 0x5255_4e54_494d_4521);
    let mut plain = Vec::with_capacity(4096);

    for lane in 0..LANE_COUNT {
        emit_op(&mut plain, &map, CanonicalOp::Load);
        plain.push(lane as u8);
        plain.push(lane as u8);
        emit_op(&mut plain, &map, CanonicalOp::XorImm);
        plain.push(lane as u8);
        emit_u64(&mut plain, words[lane & 1].rotate_left((lane * 13 + 7) as u32));
    }

    for round in 0..ROUNDS {
        let lane_order = if prng.next() & 1 == 0 {
            [0usize, 1, 2, 3]
        } else {
            [3usize, 2, 1, 0]
        };

        for lane in lane_order {
            let add = prng.next() ^ ((round as u64) << 32) ^ lane as u64;
            let multiplier = prng.next() | 1;
            let source = (lane + 1 + ((prng.next() as usize) & 1)) & 3;
            let cross_rotate = ((prng.next() % 63) + 1) as u8;
            let rotate = ((prng.next() % 63) + 1) as u8;

            emit_op(&mut plain, &map, CanonicalOp::AddImm);
            plain.push(lane as u8);
            emit_u64(&mut plain, add);
            emit_op(&mut plain, &map, CanonicalOp::XorRot);
            plain.push(lane as u8);
            plain.push(source as u8);
            plain.push(cross_rotate);
            emit_op(&mut plain, &map, CanonicalOp::MulImm);
            plain.push(lane as u8);
            emit_u64(&mut plain, multiplier);
            emit_op(&mut plain, &map, CanonicalOp::Rotate);
            plain.push(lane as u8);
            plain.push(rotate);
            emit_op(&mut plain, &map, CanonicalOp::Trace);
            plain.push(lane as u8);
            plain.push(((round + lane * 7) % 61) as u8);
            emit_u64(&mut plain, prng.next());
        }

        if round % 3 == 1 {
            let a = (prng.next() as usize) & 3;
            let b = (a + 1 + ((prng.next() as usize) & 1)) & 3;
            emit_op(&mut plain, &map, CanonicalOp::Swap);
            plain.push(a as u8);
            plain.push(b as u8);
        }

        if round % 4 == 2 {
            let lane = (prng.next() as usize) & 3;
            let decoy = prng.next();
            emit_op(&mut plain, &map, CanonicalOp::Push);
            plain.push(lane as u8);
            emit_op(&mut plain, &map, CanonicalOp::XorImm);
            plain.push(lane as u8);
            emit_u64(&mut plain, decoy);
            emit_op(&mut plain, &map, CanonicalOp::PopXor);
            plain.push(lane as u8);
            emit_u64(&mut plain, decoy);
        }
    }

    for lane in 0..LANE_COUNT {
        emit_op(&mut plain, &map, CanonicalOp::Check);
        plain.push(lane as u8);
        plain.push(lane as u8);
    }
    emit_op(&mut plain, &map, CanonicalOp::Halt);

    plain
        .into_iter()
        .enumerate()
        .map(|(index, byte)| byte ^ tape_mask(nonce, index))
        .collect()
}

struct Vm<'a> {
    nonce: &'a [u8; 16],
    tape: Vec<u8>,
    inverse_map: [u8; OP_COUNT],
    pc: usize,
    regs: [u64; 8],
    stack: [u64; 16],
    sp: usize,
    trace: u64,
    checks: u8,
}

impl<'a> Vm<'a> {
    fn new(nonce: &'a [u8; 16]) -> Self {
        let map = opcode_map(nonce);
        let mut inverse_map = [0u8; OP_COUNT];
        for (canonical, encoded) in map.iter().enumerate() {
            inverse_map[*encoded as usize] = canonical as u8;
        }
        let words = nonce_words(nonce);
        Self {
            nonce,
            tape: runtime_program(nonce),
            inverse_map,
            pc: 0,
            regs: [0; 8],
            stack: [0; 16],
            sp: 0,
            trace: avalanche(words[0] ^ words[1] ^ 0x5452_4143_452d_3031),
            checks: 0,
        }
    }

    fn byte(&mut self) -> Result<u8, ParseError> {
        if self.pc >= self.tape.len() {
            return Err(ParseError("instruction pointer escaped the tape"));
        }
        let value = self.tape[self.pc] ^ tape_mask(self.nonce, self.pc);
        self.pc += 1;
        Ok(value)
    }

    fn word(&mut self) -> Result<u64, ParseError> {
        let mut bytes = [0u8; 8];
        for byte in &mut bytes {
            *byte = self.byte()?;
        }
        Ok(u64::from_le_bytes(bytes))
    }

    fn execute(mut self, input: &[u8; INPUT_LEN], targets: &[u64; LANE_COUNT]) -> Result<Verdict, ParseError> {
        loop {
            let encoded = self.byte()? as usize;
            if encoded >= OP_COUNT {
                return Err(ParseError("unknown virtual opcode"));
            }
            match self.inverse_map[encoded] {
                x if x == CanonicalOp::Load as u8 => {
                    let dst = self.byte()? as usize;
                    let chunk = self.byte()? as usize;
                    if dst >= self.regs.len() || chunk >= LANE_COUNT {
                        return Err(ParseError("bad load operand"));
                    }
                    let mut bytes = [0u8; 8];
                    bytes.copy_from_slice(&input[chunk * 8..chunk * 8 + 8]);
                    self.regs[dst] = u64::from_le_bytes(bytes);
                }
                x if x == CanonicalOp::XorImm as u8 => {
                    let dst = self.byte()? as usize;
                    let immediate = self.word()?;
                    self.regs[dst] ^= immediate;
                }
                x if x == CanonicalOp::AddImm as u8 => {
                    let dst = self.byte()? as usize;
                    let immediate = self.word()?;
                    self.regs[dst] = self.regs[dst].wrapping_add(immediate);
                }
                x if x == CanonicalOp::MulImm as u8 => {
                    let dst = self.byte()? as usize;
                    let immediate = self.word()?;
                    self.regs[dst] = self.regs[dst].wrapping_mul(immediate);
                }
                x if x == CanonicalOp::XorRot as u8 => {
                    let dst = self.byte()? as usize;
                    let source = self.byte()? as usize;
                    let rotate = self.byte()? as u32;
                    self.regs[dst] ^= self.regs[source].rotate_left(rotate);
                }
                x if x == CanonicalOp::Rotate as u8 => {
                    let dst = self.byte()? as usize;
                    let rotate = self.byte()? as u32;
                    self.regs[dst] = self.regs[dst].rotate_left(rotate);
                }
                x if x == CanonicalOp::Swap as u8 => {
                    let left = self.byte()? as usize;
                    let right = self.byte()? as usize;
                    self.regs.swap(left, right);
                }
                x if x == CanonicalOp::Push as u8 => {
                    let source = self.byte()? as usize;
                    if self.sp >= self.stack.len() {
                        return Err(ParseError("virtual stack overflow"));
                    }
                    self.stack[self.sp] = self.regs[source];
                    self.sp += 1;
                }
                x if x == CanonicalOp::PopXor as u8 => {
                    let dst = self.byte()? as usize;
                    let mask = self.word()?;
                    if self.sp == 0 {
                        return Err(ParseError("virtual stack underflow"));
                    }
                    self.sp -= 1;
                    self.regs[dst] = self.stack[self.sp] ^ mask;
                }
                x if x == CanonicalOp::Trace as u8 => {
                    let source = self.byte()? as usize;
                    let bit = self.byte()? as u32;
                    let tag = self.word()?;
                    let branch = (self.regs[source] >> bit) & 1;
                    let edge = tag ^ branch.wrapping_mul(0xa5a5_a5a5_a5a5_a5a5);
                    self.trace = avalanche(self.trace ^ edge ^ self.regs[source].rotate_left((bit % 63) + 1));
                }
                x if x == CanonicalOp::Check as u8 => {
                    let source = self.byte()? as usize;
                    let target = self.byte()? as usize;
                    if source >= LANE_COUNT || target >= LANE_COUNT {
                        return Err(ParseError("bad check operand"));
                    }
                    self.checks |= ((self.regs[source] == targets[target]) as u8) << target;
                }
                x if x == CanonicalOp::Halt as u8 => {
                    let lanes = [self.regs[0], self.regs[1], self.regs[2], self.regs[3]];
                    return Ok(Verdict {
                        accepted: self.checks == 0x0f,
                        trace: self.trace,
                        lanes,
                    });
                }
                _ => return Err(ParseError("invalid opcode mapping")),
            }
        }
    }
}

fn capsule_seal(nonce: &[u8; 16], targets: &[u64; LANE_COUNT], trace: u64) -> u64 {
    let words = nonce_words(nonce);
    let mut seal = avalanche(words[0] ^ words[1] ^ trace ^ 0x4341_5053_554c_4521);
    for (index, target) in targets.iter().enumerate() {
        seal = avalanche(seal ^ target.rotate_left((index * 11 + 3) as u32));
    }
    seal
}

pub fn make_capsule(nonce: [u8; 16], expected: &[u8; INPUT_LEN]) -> Result<Capsule, ParseError> {
    let blank = [0u64; LANE_COUNT];
    let first = Vm::new(&nonce).execute(expected, &blank)?;
    let seal = capsule_seal(&nonce, &first.lanes, first.trace);
    Ok(Capsule {
        nonce,
        targets: first.lanes,
        trace_target: first.trace,
        seal,
    })
}

pub fn validate(capsule: &Capsule, candidate: &[u8; INPUT_LEN]) -> Result<Verdict, ParseError> {
    if capsule.seal != capsule_seal(&capsule.nonce, &capsule.targets, capsule.trace_target) {
        return Err(ParseError("capsule integrity failure"));
    }
    let mut verdict = Vm::new(&capsule.nonce).execute(candidate, &capsule.targets)?;
    verdict.accepted &= verdict.trace == capsule.trace_target;
    Ok(verdict)
}

pub fn encode_capsule(capsule: &Capsule) -> String {
    let mut bytes = Vec::with_capacity(16 + 4 * 8 + 16);
    bytes.extend_from_slice(&capsule.nonce);
    for target in capsule.targets {
        bytes.extend_from_slice(&target.to_le_bytes());
    }
    bytes.extend_from_slice(&capsule.trace_target.to_le_bytes());
    bytes.extend_from_slice(&capsule.seal.to_le_bytes());
    hex_encode(&bytes)
}

pub fn decode_capsule(text: &str) -> Result<Capsule, ParseError> {
    let bytes = hex_decode(text)?;
    if bytes.len() != 64 {
        return Err(ParseError("wrong capsule length"));
    }
    let mut nonce = [0u8; 16];
    nonce.copy_from_slice(&bytes[..16]);
    let mut targets = [0u64; LANE_COUNT];
    for (index, target) in targets.iter_mut().enumerate() {
        let start = 16 + index * 8;
        let mut word = [0u8; 8];
        word.copy_from_slice(&bytes[start..start + 8]);
        *target = u64::from_le_bytes(word);
    }
    let mut trace = [0u8; 8];
    trace.copy_from_slice(&bytes[48..56]);
    let mut seal = [0u8; 8];
    seal.copy_from_slice(&bytes[56..64]);
    Ok(Capsule {
        nonce,
        targets,
        trace_target: u64::from_le_bytes(trace),
        seal: u64::from_le_bytes(seal),
    })
}

pub fn hex_encode(bytes: &[u8]) -> String {
    const HEX: &[u8; 16] = b"0123456789abcdef";
    let mut output = String::with_capacity(bytes.len() * 2);
    for byte in bytes {
        output.push(HEX[(byte >> 4) as usize] as char);
        output.push(HEX[(byte & 0x0f) as usize] as char);
    }
    output
}

pub fn hex_decode(text: &str) -> Result<Vec<u8>, ParseError> {
    if text.len() & 1 != 0 {
        return Err(ParseError("odd hexadecimal length"));
    }
    let mut output = Vec::with_capacity(text.len() / 2);
    let bytes = text.as_bytes();
    for pair in bytes.chunks_exact(2) {
        let high = hex_nibble(pair[0])?;
        let low = hex_nibble(pair[1])?;
        output.push((high << 4) | low);
    }
    Ok(output)
}

fn hex_nibble(byte: u8) -> Result<u8, ParseError> {
    match byte {
        b'0'..=b'9' => Ok(byte - b'0'),
        b'a'..=b'f' => Ok(byte - b'a' + 10),
        b'A'..=b'F' => Ok(byte - b'A' + 10),
        _ => Err(ParseError("invalid hexadecimal digit")),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const EXPECTED: &[u8; INPUT_LEN] = b"trace_the_ashen_thread_9f2a7c1de";

    fn test_capsule() -> Capsule {
        let nonce = derive_nonce(b"test-master-seed", b"0123456789abcdef");
        make_capsule(nonce, EXPECTED).unwrap()
    }

    #[test]
    fn correct_candidate_is_accepted() {
        assert!(validate(&test_capsule(), EXPECTED).unwrap().accepted);
    }

    #[test]
    fn incorrect_candidate_is_rejected() {
        let mut wrong = *EXPECTED;
        wrong[17] ^= 1;
        assert!(!validate(&test_capsule(), &wrong).unwrap().accepted);
    }

    #[test]
    fn capsule_round_trip_is_exact() {
        let capsule = test_capsule();
        assert_eq!(decode_capsule(&encode_capsule(&capsule)).unwrap(), capsule);
    }

    #[test]
    fn repeated_generation_is_deterministic() {
        let first = test_capsule();
        let second = test_capsule();
        assert_eq!(first, second);
    }

    #[test]
    fn capsule_mutation_is_detected() {
        let mut capsule = test_capsule();
        capsule.targets[2] ^= 1;
        assert!(validate(&capsule, EXPECTED).is_err());
    }
}

