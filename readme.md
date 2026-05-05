# FilterXYZ

A bash script that filters lines in a file by their character length.

## Why?

While solving labs on [TryHackMe](https://tryhackme.com), bruteforcing passwords with large wordlists like `rockyou.txt` takes a lot of time. THM often gives a visual hint showing how many characters the password contains. FilterXYZ lets you pre-filter the wordlist to only matching lengths — making bruteforce significantly faster.

## What it does

Reads an input file line by line and writes only the lines whose length exactly matches the given number to an output file.

## Example

**Input file** `example.txt`:
```
12345
abcd
as12
ad
asd3
```

**Command:**
```bash
./filterxyz.sh example.txt 4 example_filtered.txt
```

**Output file** `example_filtered.txt`:
```
abcd
as12
asd3
```

Lines `12345` (5 chars) and `ad` (2 chars) were excluded, the rest matched length 4.

## Real-world case — TryHackMe + rockyou.txt

THM gave a hint that the password is **4 characters long**. `rockyou.txt` has over 14 million entries — bruteforcing all of them is slow. FilterXYZ cuts it down instantly.

```bash
./filterxyz.sh /usr/share/wordlists/rockyou.txt 4 rockyou_filtered.txt
```

```
File to process: /usr/share/wordlists/rockyou.txt
The number is: 4
Total lines:    14344392
Input size:     134M
----------------------------
Completed: 10%
...
Completed: 100%
----------------------------
          RESULTS
----------------------------
Time elapsed:     266s
Input lines:      14344392
Matched lines:    18152
Skipped lines:    14326240
List reduction:   99%
Input file size:  134M
Output file size: 96K
----------------------------
Done — output saved to: rockyou_filtered.txt
```

**99% of the wordlist eliminated** — from 14 344 392 lines down to 18 152. Your bruteforce tool now has ~790x less work to do.

## Usage

```bash
./filterxyz.sh <input_file> <number> <output_file>
```

| Argument | Description |
|---|---|
| `input_file` | Path to the source file (e.g. `rockyou.txt`) |
| `number` | Target line length to filter by |
| `output_file` | Path to write the filtered results |

## Setup

```bash
git clone https://github.com/sarmatsec/FilterXYZ.git
cd FilterXYZ
chmod +x filterxyz.sh
```

## Requirements

- Bash 4+
- Unix-based OS (Linux / macOS / Kali)
