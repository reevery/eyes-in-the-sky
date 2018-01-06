FROM resin/raspberrypi3-debian:jessie

ENV DUMP1090_HOST="" DUMP1090_PORT="" PF_SHARECODE="" LAT="" LONG=""

RUN \
 apt-get update -qy \
 && apt-get install -qy \
    wget

WORKDIR /tmp

RUN \
 wget $(wget -qO- https://planefinder.net/sharing/client | egrep armhf.deb | awk -F\" '{print $2}') \
 && dpkg -i pfclient*armhf.deb

RUN \
 apt-get clean \
 && rm -rf \
    /tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

EXPOSE 30053

WORKDIR /root

COPY ./start.sh start.sh
RUN chmod +x start.sh

ENTRYPOINT ["/root/start.sh"]
