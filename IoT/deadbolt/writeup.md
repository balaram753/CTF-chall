# Deadbolt — command walkthrough

Follow these in order. Replace `HOST` and `PORT` with the ones on the challenge page.
`solve.py` is the exploit script provided with this sheet.

## 1. Carve the firmware

```sh
binwalk deadbolt-flash.bin                 # spot the SquashFS at offset 0x1000
binwalk -e deadbolt-flash.bin              # extract it
cd _deadbolt-flash.bin.extracted/squashfs-root
find . -type f                             # list the recovered filesystem
```

## 2. Look around the device

```sh
cat etc/deadbolt.conf                       # device config (note: "key fused in silicon")
cat etc/banner
cat etc/init.d/rcS                          # shows /usr/bin/lockd runs at boot
file usr/bin/lockd                          # stripped 64-bit ELF controller
strings usr/bin/lockd | grep -iE 'sig=|role=|salt=|vault|urandom|DEVICE_KEY'
```

## 3. Run the controller locally (optional, to practice)

```sh
./usr/bin/lockd &                           # prints: lockd listening on 6000
python3 solve.py 127.0.0.1 6000             # local run -> placeholder flag
kill %1                                      # stop the local controller
```

Local run returns the practice flag, not the scored one:

```text
[+] secret length = 16
[+] flag: CTF{local_dev_instance_not_the_real_flag}
```

## 4. Attack the live device (this gives the real flag)

```sh
python3 solve.py HOST PORT
```

```text
[+] secret length = 21
[+] flag: CTF{...the real flag...}
```

Notes:
- `nc HOST PORT` by hand will not work — the protocol is framed and masked, so use `solve.py`.
- The secret length is different on every device, so the script brute-forces it. Just wait for the flag line.
