#!/bin/bash

BUILD_DIR="./build"
FIRMWARE="${BUILD_DIR}/firmware/portapack-h2-BOO.bin"

if [ ! -d $BUILD_DIR ]; then
  mkdir $BUILD_DIR
fi

docker run -it -v ${PWD}:/havoc portahack

if [ $? == 0 ]; then

  D=`lsusb -d 1d50:6089`

  if [ "$D" == "" ]; then 
    echo "Nao achei o HackRF..."
  else
    hackrf_spiflash -v -w ${FIRMWARE}
  fi
fi
