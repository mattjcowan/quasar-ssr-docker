#!/bin/bash

# RUN THIS FILE to run a container using the dist-spa image

sdir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $sdir
cd ..

cdir=$(pwd)

docker run -p 80:3000 --rm quasar_app:dist-ssr
