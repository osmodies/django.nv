#!/bin/bash
set -v

export IGNORE_FILE="/bandit.ignore"
export RESULT_FILE="/bandit-output.json"

echo '[!] Running Bandit tests'
bandit -r -f json -o $RESULT_FILE /

if [ ! -f $IGNORE_FILE ]; then
    echo "[!] Initially creating bandit.ignore file"
    mv bandit.ignore.example //bandit.ignore
    chmod -R 666 "$IGNORE_FILE"
fi

echo 'Results:'
python3 banditParser.py -o $RESULT_FILE -i $IGNORE_FILE