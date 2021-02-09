#!/bin/bash
#Setup shell script that runs on boot, and installs core files if not present

sudo apt-get update --force-yes

sudo apt-get upgrade --force-yes

sudo apt install -y git

#install directory
MAIN = "/darkheart"

if [-d "$MAIN"]; then
  if [git -C "$MAIN" rev-parse -eq 0]; then
    echo 'looks like this is a github repo.\nChecking for updates...'
    git fetch
    echo '...done.'
  fi
fi

if [! -d "$MAIN"]; then
  git clone -q --progress eclipsemodular/darkheart-core