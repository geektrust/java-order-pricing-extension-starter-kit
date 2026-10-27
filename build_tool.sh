#!/usr/bin/env bash
# Shared helper for run.sh and run_unittests.sh: picks Maven or Gradle.
# Prefers the project wrappers (./mvnw, ./gradlew) if you add them.

if [ -x ./mvnw ]; then MVN=./mvnw; else MVN=mvn; fi
if [ -x ./gradlew ]; then GRADLE=./gradlew; else GRADLE=gradle; fi

if [ -z "$BUILD_TOOL" ]; then
    if [ -x ./mvnw ] || command -v mvn >/dev/null 2>&1; then
        BUILD_TOOL=maven
    elif [ -x ./gradlew ] || command -v gradle >/dev/null 2>&1; then
        BUILD_TOOL=gradle
    else
        echo "Neither Maven nor Gradle was found. Install one of them (see README.md)." >&2
        exit 1
    fi
fi

if [ "$BUILD_TOOL" != "maven" ] && [ "$BUILD_TOOL" != "gradle" ]; then
    echo "BUILD_TOOL must be 'maven' or 'gradle' (got '$BUILD_TOOL')." >&2
    exit 1
fi
