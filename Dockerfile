FROM docker.pkg.github.com/dock0/pkgforge/pkgforge
MAINTAINER akerl <me@lesaker.org>
RUN pacman -S --needed --noconfirm btrfs-progs arch-install-scripts squashfs-tools
RUN gem install --no-user-install --no-document dock0
