#!/bin/bash

# This script will create an image with a snapshot of the 
# app in the src-app directory

sdir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $sdir
cd ..

cdir=$(pwd)

docker rmi quasar_app:dev-spa

docker build \
    -f ./dockerfiles/Dev.SPA.Dockerfile \
    -t quasar_app:dev-spa \
    src-app
