#!/bin/bash

# fetch - fetches sources from openvz git for specified reponame and release tag and makes orig.tar
function fetch() {
  REPONAME="${1}"
  VERSION="${2}"
  TAG="v${VERSION}"
  URL="https://src.openvz.org/scm/ovz/${REPONAME}.git"

  git clone --quiet --depth 1 --branch ${TAG} ${URL} ${REPONAME}-${VERSION} &>/dev/null \
    && tar --exclude-vcs -cf ${REPONAME}_${VERSION}.orig.tar ${REPONAME}-${VERSION} \
    && rm -rf ${REPONAME}-${VERSION}
}

# libvzctl
fetch "libvzctl" "7.0.497"
# vztt
fetch "vztt" "7.0.60"
