[![Maven Build and Deployment](https://github.com/lmdbjava/native/workflows/Maven%20Build%20and%20Deployment/badge.svg)](https://github.com/lmdbjava/native/actions)
[![Maven Central](https://img.shields.io/maven-central/v/org.lmdbjava/native.svg?maxAge=3600)](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22org.lmdbjava%22%20AND%20a%3A%22native%22)
[![License](https://img.shields.io/badge/license-OpenLDAP-blue.svg?maxAge=2592000)](http://www.openldap.org/software/release/license.html)

# LMDB Native Libraries

Provides pre-compiled LMDB native libraries for Linux, macOS and Windows. These libraries are fetched from distribution package managers (Arch Linux, Homebrew, MSYS2) and packaged into a single JAR for easy dependency resolution.

**If you are using LMDB from Java, use the [LmdbJava](https://github.com/lmdbjava/lmdbjava) project instead.** This artifact is a dependency of LmdbJava.

Available from [Maven Central](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22org.lmdbjava%22%20AND%20a%3A%22native%22) and [Central Portal Snapshots](https://central.sonatype.com/repository/maven-snapshots/org/lmdbjava/native).

### Version Management

Update all dependency and plugin versions:
```bash
mvn versions:update-properties
```

Update the LMDB version by editing `LMDB_VERSION` in `fetch-native-libs.sh`.

### Releasing

GitHub Actions will perform an official release whenever a developer executes `mvn release:clean release:prepare`.

### License

LMDB (and this repository for simplicity) is licensed under [The OpenLDAP Public License](http://www.openldap.org/software/release/license.html).
