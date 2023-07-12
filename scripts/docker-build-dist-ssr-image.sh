#!/bin/bash

# RUN THIS FILE to develop out of the ./src-app directory

sdir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $sdir
cd ..

cdir=$(pwd)

docker build \
    -f ./dockerfiles/Deploy.SSR.Dockerfile \
    -t quasar_app:dist-ssr \
    src-app
