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
./simple.sh example.txt 4 example_filtered.txt
```

**Output file** `example_filtered.txt`:
```
abcd
as12
asd3
```

Lines `12345` (5 chars) and `ad` (2 chars) were excluded, the rest matched length 4.

## Usage

```bash
./simple.sh <input_file> <number> <output_file>
```

| Argument | Description |
|---|---|
| `input_file` | Path to the source file (e.g. `rockyou.txt`) |
| `number` | Target line length to filter by |
| `output_file` | Path to write the filtered results |

**Real-world example:**
```bash
./filterxyz.sh /usr/share/wordlists/rockyou.txt 6 rockyou_filtered.txt
```

## Setup

```bash
git clone https://github.com/sakamailsec/FilterXYZ.git
cd FilterXYZ
chmod +x simple.sh
```

## Requirements

- Bash 4+
- Unix-based OS (Linux / macOS)
