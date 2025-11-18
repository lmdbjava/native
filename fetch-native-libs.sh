#!/bin/bash

set -euo pipefail

#######################################################################
# IMPORTANT: Benchmark new versions using run-lmdb.sh before updating
LMDB_VERSION="0.9.33"
#######################################################################

# Check required tools
missing_tools=()
command -v curl >/dev/null 2>&1 || missing_tools+=("curl")
command -v tar >/dev/null 2>&1 || missing_tools+=("tar")
command -v zstd >/dev/null 2>&1 || missing_tools+=("zstd")
command -v rpm2cpio >/dev/null 2>&1 || missing_tools+=("rpm2cpio")
command -v cpio >/dev/null 2>&1 || missing_tools+=("cpio")

if [ ${#missing_tools[@]} -ne 0 ]; then
  echo "Error: Missing required tools: ${missing_tools[*]}"
  echo ""
  echo "Install them with:"
  echo "  Ubuntu/Debian: sudo apt-get install ${missing_tools[*]}"
  echo "  Arch Linux:    sudo pacman -S ${missing_tools[*]//rpm2cpio/rpm-tools}"
  echo "  macOS:         brew install ${missing_tools[*]}"
  exit 1
fi

DEST="${DEST:-src/main/resources/org/lmdbjava/native}"
TMP=$(mktemp -d)
trap "rm -rf $TMP" EXIT

mkdir -p "$DEST"

# Alpine Linux x86_64 (musl)
if [ ! -f "$DEST/x86_64-linux-musl.so" ]; then
  curl -sL "https://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/lmdb-${LMDB_VERSION}-r0.apk" -o "$TMP/x64-musl.apk"
  tar xzf "$TMP/x64-musl.apk" -C "$TMP" usr/lib/liblmdb.so.0.0.0 --strip-components=2 2>/dev/null
  mv -f "$TMP/liblmdb.so.0.0.0" "$DEST/x86_64-linux-musl.so"
fi

# Alpine Linux aarch64 (musl)
if [ ! -f "$DEST/aarch64-linux-musl.so" ]; then
  curl -sL "https://dl-cdn.alpinelinux.org/alpine/v3.21/main/aarch64/lmdb-${LMDB_VERSION}-r0.apk" -o "$TMP/arm64-musl.apk"
  tar xzf "$TMP/arm64-musl.apk" -C "$TMP" usr/lib/liblmdb.so.0.0.0 --strip-components=2 2>/dev/null
  mv -f "$TMP/liblmdb.so.0.0.0" "$DEST/aarch64-linux-musl.so"
fi

# Fedora x86_64 (glibc)
if [ ! -f "$DEST/x86_64-linux-gnu.so" ]; then
  curl -sL "https://dl.fedoraproject.org/pub/fedora/linux/releases/41/Everything/x86_64/os/Packages/l/lmdb-libs-${LMDB_VERSION}-2.fc41.x86_64.rpm" -o "$TMP/x64-glibc.rpm"
  (cd "$TMP" && rpm2cpio x64-glibc.rpm | cpio -idm) >/dev/null 2>&1
  mv -f "$TMP/usr/lib64/liblmdb.so.0.0.0" "$DEST/x86_64-linux-gnu.so"
fi

# Fedora aarch64 (glibc)
if [ ! -f "$DEST/aarch64-linux-gnu.so" ]; then
  curl -sL "https://dl.fedoraproject.org/pub/fedora/linux/releases/41/Everything/aarch64/os/Packages/l/lmdb-libs-${LMDB_VERSION}-2.fc41.aarch64.rpm" -o "$TMP/arm64-glibc.rpm"
  (cd "$TMP" && rpm2cpio arm64-glibc.rpm | cpio -idm) >/dev/null 2>&1
  mv -f "$TMP/usr/lib64/liblmdb.so.0.0.0" "$DEST/aarch64-linux-gnu.so"
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
  zstd -d "$TMP/win.tar.zst" -o "$TMP/win.tar" -q
  tar xf "$TMP/win.tar" -C "$TMP" mingw64/bin/liblmdb.dll --strip-components=2
  mv -f "$TMP/liblmdb.dll" "$DEST/x86_64-windows-gnu.dll"
fi

ls -lh "$DEST"
