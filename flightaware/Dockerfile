FROM resin/raspberrypi3-debian:jessie

ENV PIAWARE_HOST="" PIAWARE_PORT="" PIAWARE_USER="" PIAWARE_PASSWORD="" PIAWARE_FEEDER_ID=""

RUN \
 apt-get update -qy \
 && apt-get install -qy \
 wget

RUN \
 wget $(wget -qO- http://flightaware.com/adsb/piaware/install | egrep wget | awk '{print $3}' | awk -F\< '{print $1}') && \
 dpkg -i piaware*.deb
    
RUN \
 apt-get update -qy \
 && apt-get install -qy \
 piaware
    
RUN \
 piaware-config allow-auto-updates yes && \
 piaware-config allow-manual-updates yes

EXPOSE 8080
EXPOSE 30003

RUN \
 apt-get clean && \
 rm -rf \
    /tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

WORKDIR /root

COPY ./start.sh start.sh
RUN chmod +x start.sh

ENTRYPOINT ["/root/start.sh"]
