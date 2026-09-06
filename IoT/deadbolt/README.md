# Deadbolt

**Category:** IoT
**Difficulty:** Insane
**Points:** 750

The DB-2000 was bolted to a door nobody at the facility will talk about. The last technician sent to service it filed no report; his badge still pings the reader every night at 3:07 a.m. from the inside.

We cut the lock out of the wall and dumped its flash. The thing is still powered, still on the network, still politely refusing every code we feed it. Marketing calls the admin console "cryptographically sealed." Marketing has never met you.

Open it. Whatever's counting down in there has been waiting for company.

### Connection

```
nc <HOST> <PORT>
```

(It does not speak plain text. Look at the flash first.)

### Files

- `deadbolt-flash.bin` — a raw dump of the device flash.

### Objective

Recover the firmware, work out how the lock talks, and make the live device hand you what's in its vault.

> Note: nothing you need is written on the flash. The flash tells you *how*. The answer only exists on the device that's still running.
