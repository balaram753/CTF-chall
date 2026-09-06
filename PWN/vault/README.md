# Vault — CTF Challenge

Category: PWN / BIN
Difficulty: Medium
Points: 200

## Player handout
Only `handout/vault` should be distributed.

## CTFd description

The vault protects its secrets with a simple arithmetic check.

The developer was sure that the access calculation could never produce an unexpected result.

Can you open the vault?

Connection:
nc <HOST> <PORT>

Objective:
Get the program to reveal the flag.

Hint 1 (10 pts): Look closely at the type used for the access-code calculation.

Hint 2 (20 pts): A signed integer cannot represent every mathematical result of an addition.

## Organizer
The vulnerable source, flag, Docker configuration and solution are organizer-only.
