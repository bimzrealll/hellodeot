#!/bin/sh
# Simple gradlew for Unix/Linux/Termux

DIR="$(cd "$(dirname "$0")" && pwd)"
GRADLE_WRAPPER_JAR="$DIR/gradle/wrapper/gradle-wrapper.jar"

# Cari java
if [ -n "$JAVA_HOME" ] ; then
    JAVA_EXEC="$JAVA_HOME/bin/java"
else
    JAVA_EXEC="$(which java)"
fi

if [ ! -x "$JAVA_EXEC" ] ; then
    echo "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH." >&2
    exit 1
fi

# Jalankan gradle wrapper
exec "$JAVA_EXEC" -Xmx64m -Xms64m -cp "$GRADLE_WRAPPER_JAR" org.gradle.wrapper.GradleWrapperMain "$@"
