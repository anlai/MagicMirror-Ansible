#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install python-pip git python-dev sshpass -y
sudo pip install ansible

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install nodejs -y