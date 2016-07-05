[![Build Status](https://travis-ci.org/lmdbjava/native.svg?branch=master)](https://travis-ci.org/lmdbjava/native)
[![Download](https://api.bintray.com/packages/lmdbjava/maven/native/images/download.svg)](https://bintray.com/lmdbjava/maven/native/_latestVersion)

# LMDB Native Libraries

This repository creates standard builds of the [LMDB](http://symas.com/mdb/)
native library. It packages the built libraries into operating system-specific
JARs (with POMs). This allows LmdbJava (or other interested Java projects) to
depend on these JARs using the normal Maven dependency resolution process.

The following dependencies are required (plus Java and Maven):

* GCC for building the Linux or OS X SO
* [Mingw-w64](http://mingw-w64.org/) for building the Windows DLL (on Linux)
  (Arch Linux uses can `pacman -S mingw-w64-gcc`)

### Installation

This project is mainly intended to be built by Travis CI, as a Linux operating
system is required to build the Linux and Windows libraries, and an OS X
operating system is needed to build the OS X library. Nevertheless it is
possible to execute the Linux or OS X component of the build on those systems.

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

### Support

Please [open a GitHub issue](https://github.com/lmdbjava/native/issues) if you
have any questions.

### Contributing

Contributions are welcome! Please see the LmdbJava project's
[Contributing Guidelines](https://github.com/lmdbjava/lmdbjava/blob/master/CONTRIBUTING.md).

### Releasing

Any tagged commit will cause Travis CI to build a release and deploy it to the
BinTray Maven repository. BinTray will GPG sign the release.

Project maintainers can run `mvn -Prelease release:clean release:prepare` to
update the POMs to a formal release version number, Git tag, and increment the
version number for ongoing development. Travis will perform the actual release.

### License

LMDB (and this repository for simplicity) is licensed under
[The OpenLDAP Public License](http://www.openldap.org/software/release/license.html).
