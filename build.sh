#!/bin/bash
# prepare build folder
mkdir -p BUILD
# copy debian rules
cp -a debian BUILD/debian
# extract libvzctl src into build dir
tar xf libvzctl*.orig.tar --strip-components=1 -C BUILD
# create folder for vztt includes
mkdir -p BUILD/include/vz
# extract vztt include headers
tar xf vztt*.orig.tar -C BUILD/include/vz --strip-components=2 --wildcards '*/include/vztt_error.h' '*/include/vztt_types.h' '*/include/vztt.h' '*/include/vztt_options.h'
# change current dir to build
cd BUILD
# run build
debuild -us -uc -b -I.git -i'\.git/'
