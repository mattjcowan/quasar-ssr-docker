#!/bin/bash

# RUN THIS FILE to develop out of the ./src-app directory

sdir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $sdir
cd ..

cdir=$(pwd)

docker run -it -v $cdir/src-app:/quasar_app -p 9100:9100 -p 9025:9025 --rm quasar_app:dev-ssr
