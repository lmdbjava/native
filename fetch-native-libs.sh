#!/bin/bash

set -euo pipefail

#######################################################################
# IMPORTANT: Benchmark new versions using run-lmdb.sh before updating
LMDB_VERSION="0.9.33"
#######################################################################

DEST="${DEST:-src/main/resources/org/lmdbjava/native}"
TMP=$(mktemp -d)
trap "rm -rf $TMP" EXIT

mkdir -p "$DEST"

# Arch Linux x86_64
if [ ! -f "$DEST/x86_64-linux-gnu.so" ]; then
  curl -sL "https://archive.archlinux.org/packages/l/lmdb/lmdb-${LMDB_VERSION}-1-x86_64.pkg.tar.zst" -o "$TMP/x64.tar.zst"
  zstd -d "$TMP/x64.tar.zst" -o "$TMP/x64.tar"
  tar xf "$TMP/x64.tar" -C "$TMP" usr/lib/liblmdb.so --strip-components=2
  mv -f "$TMP/liblmdb.so" "$DEST/x86_64-linux-gnu.so"
fi

# Arch Linux ARM aarch64
if [ ! -f "$DEST/aarch64-linux-gnu.so" ]; then
  curl -sL "http://mirror.archlinuxarm.org/aarch64/extra/lmdb-${LMDB_VERSION}-1-aarch64.pkg.tar.xz" -o "$TMP/arm64.tar.xz"
  tar xf "$TMP/arm64.tar.xz" -C "$TMP" usr/lib/liblmdb.so --strip-components=2
  mv -f "$TMP/liblmdb.so" "$DEST/aarch64-linux-gnu.so"
fi

# Homebrew macOS x86_64
if [ ! -f "$DEST/x86_64-macos-none.so" ]; then
  curl -sL "https://mirrors.sustech.edu.cn/homebrew-bottles/bottles/lmdb-${LMDB_VERSION}.sonoma.bottle.tar.gz" -o "$TMP/brew-x64.tar.gz"
  tar xzf "$TMP/brew-x64.tar.gz" -C "$TMP" lmdb/${LMDB_VERSION}/lib/liblmdb.dylib --strip-components=3
  mv -f "$TMP/liblmdb.dylib" "$DEST/x86_64-macos-none.so"
fi

# Homebrew macOS arm64
if [ ! -f "$DEST/aarch64-macos-none.so" ]; then
  curl -sL "https://mirrors.sustech.edu.cn/homebrew-bottles/bottles/lmdb-${LMDB_VERSION}.arm64_sonoma.bottle.tar.gz" -o "$TMP/brew-arm.tar.gz"
  tar xzf "$TMP/brew-arm.tar.gz" -C "$TMP" lmdb/${LMDB_VERSION}/lib/liblmdb.dylib --strip-components=3
  mv -f "$TMP/liblmdb.dylib" "$DEST/aarch64-macos-none.so"
fi

# MSYS2 Windows x86_64
if [ ! -f "$DEST/x86_64-windows-gnu.dll" ]; then
  curl -sL "https://repo.msys2.org/mingw/mingw64/mingw-w64-x86_64-lmdb-${LMDB_VERSION}-1-any.pkg.tar.zst" -o "$TMP/win.tar.zst"
  zstd -d "$TMP/win.tar.zst" -o "$TMP/win.tar"
  tar xf "$TMP/win.tar" -C "$TMP" mingw64/bin/liblmdb.dll --strip-components=2
  mv -f "$TMP/liblmdb.dll" "$DEST/x86_64-windows-gnu.dll"
fi

ls -lh "$DEST"
