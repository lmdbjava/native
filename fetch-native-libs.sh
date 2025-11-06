#!/bin/bash

set -euo pipefail

LMDB_VERSION="0.9.18-3"
DEST="${DEST:-src/main/resources/org/lmdbjava/native}"
TMP=$(mktemp -d)
trap "rm -rf $TMP" EXIT

mkdir -p "$DEST"

# Extract from old Maven Central artifacts and rename to new format
# Linux x86_64
if [ ! -f "$DEST/x86_64-linux-gnu.so" ]; then
  curl -sL "https://repo1.maven.org/maven2/org/lmdbjava/lmdbjava-native-linux-x86_64/${LMDB_VERSION}/lmdbjava-native-linux-x86_64-${LMDB_VERSION}.jar" -o "$TMP/linux.jar"
  unzip -q "$TMP/linux.jar" -d "$TMP/linux"
  mv -f "$TMP/linux/org/lmdbjava/lmdbjava-native-linux-x86_64.so" "$DEST/x86_64-linux-gnu.so"
fi

# macOS x86_64
if [ ! -f "$DEST/x86_64-macos-none.so" ]; then
  curl -sL "https://repo1.maven.org/maven2/org/lmdbjava/lmdbjava-native-osx-x86_64/${LMDB_VERSION}/lmdbjava-native-osx-x86_64-${LMDB_VERSION}.jar" -o "$TMP/osx.jar"
  unzip -q "$TMP/osx.jar" -d "$TMP/osx"
  mv -f "$TMP/osx/org/lmdbjava/lmdbjava-native-osx-x86_64.dylib" "$DEST/x86_64-macos-none.so"
fi

# Windows x86_64
if [ ! -f "$DEST/x86_64-windows-gnu.dll" ]; then
  curl -sL "https://repo1.maven.org/maven2/org/lmdbjava/lmdbjava-native-windows-x86_64/${LMDB_VERSION}/lmdbjava-native-windows-x86_64-${LMDB_VERSION}.jar" -o "$TMP/windows.jar"
  unzip -q "$TMP/windows.jar" -d "$TMP/windows"
  mv -f "$TMP/windows/org/lmdbjava/lmdbjava-native-windows-x86_64.dll" "$DEST/x86_64-windows-gnu.dll"
fi

ls -lh "$DEST"
