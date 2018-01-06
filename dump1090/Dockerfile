FROM resin/raspberrypi3-debian:jessie

ENV DUMP_HTTP_PORT="" DUMP_SBS_PORT="" DUMP_LAT="" DUMP_LON="" 

RUN [ "cross-build-start" ]

RUN \
 apt-get update -qy \
 && apt-get install --no-install-recommends -qy \
    git-core \
    git \
    cmake \
    libusb-1.0.0-dev \
    build-essential \
    librtlsdr-dev \
    debhelper \
    pkg-config

WORKDIR /tmp

RUN \
 git clone https://github.com/mutability/dump1090
    
RUN \
 git clone git://git.osmocom.org/rtl-sdr.git \
 && mkdir rtl-sdr/build
    
WORKDIR /tmp/dump1090

RUN \
 dpkg-buildpackage \
 && dpkg -i ../dump1090*.deb
    
    
WORKDIR /tmp/rtl-sdr/build

RUN \
 cmake ../ -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON \
 && make -j 4 \
 && make install \
 && ldconfig
 
 RUN [ "cross-build-end" ] 

# web overview
EXPOSE 8080

# ports for FlightAware etc
EXPOSE 30003
EXPOSE 30005
EXPOSE 30104

RUN \
 apt-get clean \
 && rm -rf \
      /tmp/* \
	  /var/lib/apt/lists/* \
	  /var/tmp/*

WORKDIR /root

COPY ./start.sh start.sh
RUN chmod +x start.sh

ENTRYPOINT ["/root/start.sh"]
