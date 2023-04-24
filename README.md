# THIS PROJECT IS ARCHIVED

**Cross compilation is now performed in the
[LmdbJava](https://github.com/lmdbjava/lmdbjava) project.**

[![Maven Build and Deployment](https://github.com/lmdbjava/native/workflows/Maven%20Build%20and%20Deployment/badge.svg)](https://github.com/lmdbjava/native/actions)
[![Maven Central](https://img.shields.io/maven-central/v/org.lmdbjava/lmdbjava-native-parent.svg?maxAge=3600)](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22org.lmdbjava%22%20AND%20a%3A%22lmdbjava-native-parent%22)
[![License](https://img.shields.io/badge/license-OpenLDAP-blue.svg?maxAge=2592000)](http://www.openldap.org/software/release/license.html)

# LMDB Native Libraries

This repository creates standard builds of the [LMDB](http://symas.com/mdb/)
native library. It packages the built libraries into operating system-specific
JARs (with POMs). This allows [LmdbJava](https://github.com/lmdbjava/lmdbjava)
(or other interested Java projects) to depend on these JARs using the normal
Maven dependency resolution process.

**If you are simply wishing to use LMDB from Java, please use the
[LmdbJava](https://github.com/lmdbjava/lmdbjava) project.**

This project is intended to be executed by GitHub Actions, as Linux, Windows and
macOS operating systems are all required. Linux is used for compiling the Linux
modules, whereas Windows and macOS compile their modules.

### Versioning

This project uses the `major.minor.patch-qualifier` version numbering typical
of Maven projects. The major, minor and patch directly reflect the upstream
LMDB library version, as expressed by `lmdb.h` `MDB_VERSION_*` definitions.
The qualifier resets to `1` on a new major, minor or patch release.

### Repository

[LmdbJava](https://github.com/lmdbjava/lmdbjava) shades inside its JAR all of
the system libraries produced by this project. As such, end users typically have
no need to refer to any artifacts produced by this project.

### Snapshots

GitHub Actions automatically publishes snapshot releases to the
[OSS Sonatype Snapshots Repository](https://oss.sonatype.org/content/repositories/snapshots/org/lmdbjava/lmdbjava-native-parent/).

### Support

Please [open a GitHub issue](https://github.com/lmdbjava/native/issues) if you
have any questions.

### Contributing

Contributions are welcome! Please see the LmdbJava project's
[Contributing Guidelines](https://github.com/lmdbjava/lmdbjava/blob/master/CONTRIBUTING.md).

### Releasing

Please see the [Acegi Standard Project Release Instructions](https://github.com/acegi/acegi-standard-project#performing-a-release).

### License
LMDB (and this repository for simplicity) is licensed under
[The OpenLDAP Public License](http://www.openldap.org/software/release/license.html).
