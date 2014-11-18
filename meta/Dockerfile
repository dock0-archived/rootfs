FROM dock0/arch
MAINTAINER akerl <me@lesaker.org>
RUN pacman -S --noconfirm ruby make btrfs-progs
RUN gem install --no-user-install --no-rdoc --no-ri targit dock0
WORKDIR /opt/vm_root
CMD ["make", "local"]
