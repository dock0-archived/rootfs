FROM dock0/arch
MAINTAINER akerl <me@lesaker.org>
RUN pacman -S --noconfirm ruby
RUN git clone git://github.com/Homebrew/linuxbrew.git /opt/linuxbrew
ADD run /opt/run
ADD manifest.yml /opt/manifest.yml
CMD ["/opt/run"]
