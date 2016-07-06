[![Build Status](https://travis-ci.org/lmdbjava/native.svg?branch=master)](https://travis-ci.org/lmdbjava/native)
[![Download](https://api.bintray.com/packages/lmdbjava/maven/org.lmdbjava:native/images/download.svg)](https://bintray.com/lmdbjava/maven/org.lmdbjava:native/_latestVersion)
[![Dependency Status](https://www.versioneye.com/user/projects/577d1dab91aab50027c6ca38/badge.svg?style=flat-square)](https://www.versioneye.com/user/projects/577d1dab91aab50027c6ca38)
[![License](https://img.shields.io/hexpm/l/plug.svg?maxAge=2592000)](http://www.openldap.org/software/release/license.html)
![Size](https://reposs.herokuapp.com/?path=lmdbjava/native)

# LMDB Native Libraries

This repository creates standard builds of the [LMDB](http://symas.com/mdb/)
native library. It packages the built libraries into operating system-specific
JARs (with POMs). This allows LmdbJava (or other interested Java projects) to
depend on these JARs using the normal Maven dependency resolution process.

The following dependencies are required (plus Java and Maven):

* GCC for building the Linux or OS X shared library
* [Mingw-w64](http://mingw-w64.org/) for building the Windows DLL (on Linux)
  (Arch Linux uses can `pacman -S mingw-w64-gcc`)

### Installation

This project is mainly intended to be built by Travis CI, as a Linux operating
system is required to build the Linux and Windows libraries, and an OS X
operating system is needed to build the OS X library. Nevertheless it is
possible to execute the Linux or OS X component of the build locally.

Once the platform dependencies are met:

```bash
git submodule update --init
mvn clean install
```

An appropriate Maven profile will automatically be used for Linux or OS X.

### Versioning

This project uses the `major.minor.patch-qualifier` version numbering typical
of Maven projects. The major, minor and patch directly reflect the upstream
LMDB library version, as expressed by `lmdb.h` `MDB_VERSION_*` definitions.
The qualifier resets to `1` on a new major, minor or patch release.

### Repository

LmdbJava shades inside its JAR all of the system libraries produced by this
project. As such, end users typically have no need to refer to any artifacts
produced by this project.

Should you require native build artifacts produced by this project (eg you are
developing some new Java library etc), these are always available from the
[JCenter](https://bintray.com/bintray/jcenter) repository. We synchronise a
subset of the artifacts to Maven Central, but JCenter is the primary repository.

### Support

Please [open a GitHub issue](https://github.com/lmdbjava/native/issues) if you
have any questions.

### Contributing

Contributions are welcome! Please see the LmdbJava project's
[Contributing Guidelines](https://github.com/lmdbjava/lmdbjava/blob/master/CONTRIBUTING.md).

### Releasing

Refer to
[LmdbJava Releasing](https://github.com/lmdbjava/lmdbjava/blob/master/RELEASE.md).

### License
LMDB (and this repository for simplicity) is licensed under
[The OpenLDAP Public License](http://www.openldap.org/software/release/license.html).
