rootfs
=======

[![Build Status](https://img.shields.io/circleci/project/dock0/rootfs/master.svg)](https://circleci.com/gh/dock0/rootfs)
[![GitHub release](https://img.shields.io/github/release/dock0/rootfs.svg)](https://github.com/dock0/rootfs/releases)
[![MIT Licensed](http://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

A meta-container, designed to build out components of my VMs

## Usage

To build a new VM root, run `make`. To start a shell in the build environment for manual actions, run `make manual`.

This will build a new root image and push it up to GitHub as a release asset.

## License

The scripts in this repo are released under the MIT License. See the bundled LICENSE file for details. The packages and other content stored in root.tar.xz retains its original licenses.

