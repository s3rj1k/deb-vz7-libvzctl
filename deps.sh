#!/bin/bash
# install dev pacakges
apt-get -y install build-essential devscripts
# install build dependencies
mk-build-deps --install --remove debian/control --tool "apt-get -y --no-install-recommends"
# fix package errors if any
apt-get -y -f install
