[![Build](https://github.com/lmdbjava/native/workflows/Build/badge.svg)](https://github.com/lmdbjava/native/actions)
[![Maven Central](https://img.shields.io/maven-central/v/org.lmdbjava/native.svg?maxAge=3600)](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22org.lmdbjava%22%20AND%20a%3A%22native%22)
[![License](https://img.shields.io/badge/license-OpenLDAP-blue.svg?maxAge=2592000)](http://www.openldap.org/software/release/license.html)

# LMDB Native Libraries

Compiled LMDB native libraries for Linux (glibc/musl), macOS and Windows on x86_64 and aarch64.

**If you are using LMDB from Java, use the [LmdbJava](https://github.com/lmdbjava/lmdbjava) project instead.** This artifact is a dependency of LmdbJava.

### Updating LMDB

```bash
cd lmdb
git fetch --tags
git checkout LMDB_0.9.XX
cd ..
git add lmdb
```

### Releasing

```bash
mvn release:clean release:prepare
```

### License

LMDB (and this repository for simplicity) is licensed under [The OpenLDAP Public License](http://www.openldap.org/software/release/license.html).
