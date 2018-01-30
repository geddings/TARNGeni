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
        sudo apt-get -y install git-core maven httpie & EPID=$!
        wait $EPID

       # Install custom software
       git clone https://github.com/geddings/tarn & EPID=$!
       wait $EPID
       sudo ./tarn/setup/install_java & EPID=$!
       wait $EPID
       sudo mvn package -f tarn/floodlight/pom.xml	
fi
##### Run Boot-time commands
# Start my service -- assume it was installed at /usr/local/bin
