#!/usr/bin/env bash
# Builds the project and runs all unit tests in src/test/java.
# Uses Maven by default if it is installed, otherwise Gradle.
# Force one with: BUILD_TOOL=maven ./run_unittests.sh   or   BUILD_TOOL=gradle ./run_unittests.sh
set -e
cd "$(dirname "$0")"

source ./build_tool.sh

if [ "$BUILD_TOOL" = "maven" ]; then
    $MVN test
else
    $GRADLE test
fi
