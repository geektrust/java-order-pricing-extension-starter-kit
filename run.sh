#!/usr/bin/env bash
# Compiles the project and runs the program once for each input.
# Usage: ./run.sh '<input 1>' '<input 2>' ...
# Example: ./run.sh 'Regular Electronics:100:1 Books:20:2' 'Guest Books:10:1'
#
# Uses Maven by default if it is installed, otherwise Gradle.
# Force one with: BUILD_TOOL=maven ./run.sh ...   or   BUILD_TOOL=gradle ./run.sh ...
set -e
cd "$(dirname "$0")"

if [ "$#" -eq 0 ]; then
    echo "Usage: ./run.sh '<input 1>' '<input 2>' ..."
    exit 1
fi

source ./build_tool.sh

if [ "$BUILD_TOOL" = "maven" ]; then
    $MVN -q -DskipTests compile
    CLASSES_DIR=target/classes
else
    $GRADLE -q classes
    CLASSES_DIR=build/classes/java/main
fi

for input in "$@"; do
    java -cp "$CLASSES_DIR" pricing.Main "$input"
done
