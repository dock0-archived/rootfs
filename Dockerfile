FROM dock0/pkgforge
MAINTAINER akerl <me@lesaker.org>
RUN pacman -S --needed --noconfirm btrfs-progs arch-install-scripts squashfs-tools
RUN gem install --no-user-install --no-rdoc --no-ri dock0
