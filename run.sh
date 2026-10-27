#!/usr/bin/env bash
# Compiles the project and runs the program once for each input.
# Usage: ./run.sh '<input 1>' '<input 2>' ...
# Example: ./run.sh 'Regular Electronics:100:1 Books:20:2' 'Guest Books:10:1'
set -e
cd "$(dirname "$0")"

if [ "$#" -eq 0 ]; then
    echo "Usage: ./run.sh '<input 1>' '<input 2>' ..."
    exit 1
fi

mvn -q -DskipTests compile

for input in "$@"; do
    java -cp target/classes pricing.Main "$input"
done
