#!/bin/bash

/usr/bin/dump1090-mutability --net-http-port $DUMP_HTTP_PORT --net --net-sbs-port $DUMP_SBS_PORT --interactive --lat $DUMP_LAT --lon $DUMP_LON
