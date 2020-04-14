[![Maven Build and Deployment](https://github.com/lmdbjava/native/workflows/Maven%20Build%20and%20Deployment/badge.svg)](https://github.com/lmdbjava/native/actions)
[![Maven Central](https://img.shields.io/maven-central/v/org.lmdbjava/lmdbjava-native-parent.svg?maxAge=3600)](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22org.lmdbjava%22%20AND%20a%3A%22lmdbjava-native-parent%22)
[![License](https://img.shields.io/badge/license-OpenLDAP-blue.svg?maxAge=2592000)](http://www.openldap.org/software/release/license.html)

# LMDB Native Libraries

This repository creates standard builds of the [LMDB](http://symas.com/mdb/)
native library. It packages the built libraries into operating system-specific
JARs (with POMs). This allows LmdbJava (or other interested Java projects) to
depend on these JARs using the normal Maven dependency resolution process.

The following dependencies are required (plus Java and Maven):

* GCC for building the Linux or macOS shared library
* [Mingw-w64](http://mingw-w64.org/) for building the Windows DLL (on Linux)
  (Arch Linux uses can `pacman -S mingw-w64-gcc`)
* [Android NDK](https://developer.android.com/ndk/) (Arch Linux users can
  `packer -S android-ndk`)

### Installation

This project is mainly intended to be built by GitHub Actions, as Linux and
macOS operating systems are both required. Linux is used for compiling all
modules (ie Linux, Windows, Android) except macOS.

Once the platform dependencies are met:

```bash
git submodule update --init
mvn clean install
```

An appropriate Maven profile will automatically be used for Linux or macOS.

### Versioning

This project uses the `major.minor.patch-qualifier` version numbering typical
of Maven projects. The major, minor and patch directly reflect the upstream
LMDB library version, as expressed by `lmdb.h` `MDB_VERSION_*` definitions.
The qualifier resets to `1` on a new major, minor or patch release.

### Repository

LmdbJava shades inside its JAR all of the system libraries produced by this
project. As such, end users typically have no need to refer to any artifacts
produced by this project.

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
