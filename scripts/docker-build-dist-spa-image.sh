#!/bin/bash

# RUN THIS FILE to develop out of the ./src-app directory

sdir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $sdir
cd ..

cdir=$(pwd)

docker build \
    -f ./dockerfiles/Deploy.SPA.Dockerfile \
    -t quasar_app:dist-spa \
    src-app
