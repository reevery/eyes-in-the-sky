FROM resin/raspberrypi3-debian:jessie

WORKDIR /root

RUN apt-get update -qy \
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

RUN git clone https://github.com/mutability/dump1090
    
RUN git clone git://git.osmocom.org/rtl-sdr.git \
     && mkdir rtl-sdr/build
    
WORKDIR /tmp/dump1090

RUN dpkg-buildpackage \
    && dpkg -i ../dump1090*.deb
    
    
WORKDIR /tmp/rtl-sdr/build

RUN cmake ../ -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON \
    && make -j 4 \
    && make install \
    && ldconfig

# web overview
EXPOSE 8080

# ports for FlightAware etc
EXPOSE 30003
EXPOSE 30005
EXPOSE 30104

# Update your lat/lon values.
ENV DUMP_HTTP_PORT="" DUMP_SBS_PORT="" DUMP_LAT="" DUMP_LON="" 

ENTRYPOINT [/usr/bin/dump1090-mutability --net-http-port $DUMP_HTTP_PORT --net --net-sbs-port $DUMP_SBS_PORT --interactive --lat $DUMP_LAT --lon $DUMP_LON
]
