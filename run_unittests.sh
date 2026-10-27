#!/usr/bin/env bash
# Builds the project and runs all unit tests in src/test/java.
set -e
cd "$(dirname "$0")"

mvn test
