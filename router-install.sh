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
        sudo apt-get -y install git-core httpie bird & EPID=$!
        wait $EPID

       # Install custom software
       sudo git clone https://github.com/peeringtestbed/client & EPID=$!
       wait $EPID
       sudo echo $'184.164.240.0/24\n184.164.241.0/24\n184.164.242.0/24\n184.164.243.0/24' > client/prefixes.txt	
fi
##### Run Boot-time commands
# Start my service -- assume it was installed at /usr/local/bin
