FROM resin/raspberrypi3-debian:jessie

RUN apt-get update && apt-get install -qy wget

WORKDIR /tmp

RUN wget $(wget -qO- https://planefinder.net/sharing/client | egrep armhf.deb | awk -F\" '{print $2}') \
    && dpkg -i pfclient*armhf.deb

EXPOSE 30053

ENV DUMP1090_HOST="" DUMP1090_PORT="" PF_SHARECODE="" LAT="" LONG=""

ENTRYPOINT ["/usr/bin/pfclient --address=$DUMP1090_HOST --port=$DUMP1090_PORT --sharecode=$PF_SHARECODE --lat=$LAT --long=$LONG --data_format=1"]
