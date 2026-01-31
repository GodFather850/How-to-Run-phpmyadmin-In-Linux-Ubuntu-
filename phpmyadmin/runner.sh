#!/bin/bash

# update your host
sudo apt update && sudo apt upgrade -y

# read json file
if ! command -v jq &> /dev/null; then
    sudo apt install -y jq
fi

json_file="config.json"
packages_php=($(jq -r '.Packages[]' "$json_file"))

# install packages:
echo "installing Packages for run phpmyadmin"

for php in "${packages_php[@]}"; do
    echo "installing $php"
    sudo apt install -y $php
done

# start apache2

sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl status apache2