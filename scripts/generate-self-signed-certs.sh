#!/bin/bash

sdir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $sdir
cd ..

sudo mkdir -p ./certs

sudo apt-get install openssl -y

sudo openssl genrsa -out ./certs/localhost.key 2048
sudo openssl req -new -x509 -key ./certs/localhost.key -out ./certs/localhost.cert -days 3650 -subj /CN=localhost
