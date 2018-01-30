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
        sudo apt-get -y install git-core unzip & EPID=$!
        wait $EPID

       # Install custom software
       git clone https://github.com/geddings/ovsscripts & EPID=$!
       wait $EPID
       cd ovsscripts 
       sudo ./install.sh & EPID=$!
       wait $EPID
fi
##### Run Boot-time commands
# Start my service -- assume it was installed at /usr/local/bin
sudo ./ovsscripts/start.sh 