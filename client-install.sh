#!/bin/sh
# Usual directory for downloading software in ProtoGENI hosts is `/local`
cd /local

##### Check if file is there #####
if [ ! -f "./installed.txt" ]
then
       #### Create the file ####
        sudo touch "./installed.txt"

       #### Run  one-time commands ####
       
       #Install necessary packages
        sudo apt-get update & EPID=$!
        wait $EPID

       # Install custom software
       sudo wget "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US" & EPID=$!
       wait $EPID
       sudo mv index.html\?product\=firefox-latest-ssl\&os\=linux64\&lang\=en-US firefox.tar.bz2 
       sudo tar xjf firefox.tar.bz2
fi
##### Run Boot-time commands
# Start my service -- assume it was installed at /usr/local/bin
