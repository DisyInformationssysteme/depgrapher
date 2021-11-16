#!/bin/sh

# prepare the autotools part if needed
make -q -f Makefile configure 1>/dev/null 2>/dev/null || autoreconf -i
# use the arguments to this script to (re-)create the Makefile
./configure -q "$@"
