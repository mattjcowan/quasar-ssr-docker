#!/bin/bash

# RUN THIS FILE and at the prompt, initialize your quasar app
# $> npm init quasar

# Follow the prompts and put the app in the ./src-app directory

sdir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $sdir
cd ..

cdir=$(pwd)

docker run -it -v $cdir/:/quasar-setup --rm quasar_helper
