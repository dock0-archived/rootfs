rootfs
=======

[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/dock0/rootfs/Build)](https://github.com/dock0/rootfs/actions))
[![GitHub release](https://img.shields.io/github/release/dock0/rootfs.svg)](https://github.com/dock0/rootfs/releases)
[![License](https://img.shields.io/github/license/dock0/rootfs)](https://github.com/dock0/rootfs/blob/master/LICENSE)

A meta-container, designed to build out components of my VMs

## Usage

To build a new VM root, run `make`. To start a shell in the build environment for manual actions, run `make manual`.

This will build a new root image and push it up to GitHub as a release asset.

## License

The scripts in this repo are released under the MIT License. See the bundled LICENSE file for details. The packages and other content stored in root.tar.xz retains its original licenses.

