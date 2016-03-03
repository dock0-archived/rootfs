FROM dock0/build
MAINTAINER akerl <me@lesaker.org>
RUN pacman-key --refresh-keys
RUN pacman -S --needed --noconfirm btrfs-progs arch-install-scripts squashfs-tools
RUN gem install --no-user-install --no-rdoc --no-ri dock0
