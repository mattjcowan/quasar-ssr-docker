#!/bin/bash

sdir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $sdir
cd ..

cdir=$(pwd)

docker build \
  --build-arg USER_ID=$(id -u) \
  --build-arg GROUP_ID=$(id -g) \
  -t quasar_helper - < ./dockerfiles/Setup.Dockerfile
