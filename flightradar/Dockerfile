FROM resin/raspberrypi3-debian:jessie

# Import GPG key for the APT repository
RUN gpg --keyserver pgp.mit.edu --recv-keys 40C430F5 && \
    gpg --armor --export 40C430F5 | apt-key add -

# Add APT repository to the config file, removing older entries if exist
 RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
     grep -v flightradar24 /etc/apt/sources.list.bak > /etc/apt/sources.list && \
     echo 'deb http://repo.feed.flightradar24.com flightradar24 raspberrypi-stable' >> /etc/apt/sources.list

RUN apt-get update && apt-get install --assume-yes --no-install-recommends \
    fr24feed

# needed for some network utils that i think flightradar needs to connect (possibly openSSL)
RUN apt-get install iputils-ping && \
  apt-get install nano

EXPOSE 8754

ENV DUMP1090_HOST="" DUMP1090_PORT="" FR24_KEY="" 

ENTRYPOINT ["/usr/bin/fr24feed --fr24key=$FR24_KEY --receiver=beast-tcp --logmode=1 --host=$DUMP1090_HOST:$DUMP1090_PORT --logpath=/var/log --mlat=yes mlat-without-gps=yes --bs=no --raw=yes
"]
