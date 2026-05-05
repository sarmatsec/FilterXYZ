#!/bin/bash

INPUT_FILE=$1
NUMBER=$2
OUTPUT_FILE=$3

if [[ -z "$INPUT_FILE" || -z "$NUMBER" || -z "$OUTPUT_FILE" ]]; then
    echo "Usage: ./simple.sh <input_filename> <number> <output_filename>"
    exit 1
fi

if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Error: file '$INPUT_FILE' not found"
    exit 1
fi

if ! [[ "$NUMBER" =~ ^[0-9]+$ ]]; then
    echo "Error: '$NUMBER' is not a valid number"
    exit 1
fi

echo "File to process: $INPUT_FILE"
echo "The number is: $NUMBER"

> "$OUTPUT_FILE"

ACCEPT_COUNT=0
PROCESSED_COUNT=0
TOTAL_COUNT=$(wc -l < "$INPUT_FILE")
CHUNK_SIZE=$(( TOTAL_COUNT / 10 ))
NEXT_CHUNK=$CHUNK_SIZE
CURRENT_PERCENT=0

echo "Total lines: $TOTAL_COUNT"

while IFS= read -r line; do
    ((PROCESSED_COUNT++))

    if [[ $CHUNK_SIZE -gt 0 && $PROCESSED_COUNT -ge $NEXT_CHUNK && $CURRENT_PERCENT -lt 100 ]]; then
        (( CURRENT_PERCENT += 10 ))
        (( NEXT_CHUNK += CHUNK_SIZE ))
        echo "Completed: $CURRENT_PERCENT%"
    fi

    if [[ "${#line}" -eq "$NUMBER" ]]; then
        echo "$line" >> "$OUTPUT_FILE"
        ((ACCEPT_COUNT++))
    fi
done < "$INPUT_FILE"

echo "Completed: 100%"
echo "Done"
echo "Matched lines: $ACCEPT_COUNT / $TOTAL_COUNT"