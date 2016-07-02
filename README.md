[![Build Status](https://travis-ci.org/lmdbjava/native.svg?branch=master)](https://travis-ci.org/lmdbjava/native)
[![Download](https://api.bintray.com/packages/lmdbjava/maven/native/images/download.svg)](https://bintray.com/lmdbjava/maven/native/_latestVersion)

# LMDB Native Libraries

This repository creates standard builds of the [LMDB](http://symas.com/mdb/)
native library. It packages the built libraries into operating system-specific
JARs (with POMs). This allows LmdbJava (or other interested Java projects) to
depend on these JARs using the normal Maven dependency resolution process.

The repository expects to be executed on a Linux machine.

The following dependencies are required (plus Java and Maven):

* GCC for building the Linux SO
* [Mingw-w64](http://mingw-w64.org/) for building the Windows DLL

### Installation

- Arch Linux
```bash
pacman -S mingw-w64-gcc
```

### Usage

```bash
git submodule update
mvn clean install
```

### Support

Please [open a GitHub issue](https://github.com/lmdbjava/native/issues) if you
have any questions.

### Releasing

Travis CI automatically releases built JARs to a Maven-structured BinTray repository.

To perfom a release:

1. Edit the `pom.xml` files to reflect the new version
2. Edit `descriptor.json` to reflect a new version number
3. Run a `git tag` for the version
4. Perform a `git push origin --tags`.

The new version for Linux, Windows and OS X should automatically arrive on BinTray.

### Contributing

Contributions are welcome! Please see the LmdbJava project's
[Contributing Guidelines](https://github.com/lmdbjava/lmdbjava/blob/master/CONTRIBUTING.md).

### License

LMDB (and this repository for simplicity) is licensed under
[The OpenLDAP Public License](http://www.openldap.org/software/release/license.html).
