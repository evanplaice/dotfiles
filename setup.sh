#!/usr/bin/env bash

###############################################################################
# Pre-Install                                                                 #
###############################################################################

# enable bash strict mode
# set -eo pipefail

# force apt to run fully non-interactive 
DEBIAN_FRONTEND=noninteractive

# update
sudo apt-get update

# upgrade existing packages (non-interactive hack)
sudo apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade

# uninstall default programs
sudo apt purge -y maya-calendar # calendar
sudo apt purge -y elementary.code # code
sudo apt purge -y epiphany-browser epiphany-browser-data # epiphany
sudo apt purge -y pantheon-mail # mail
sudo apt purge -y noise # music
sudo apt purge -y audience # videos

# c++ runtime
sudo apt install -y libc++1

# snap package manager
sudo apt install -y snapd

# add flathub to flatPak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# fnm (fast node manager)
curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash
PATH=/home/vagrant/.fnm:$PATH
eval "`fnm env --multi`"
fnm install 13.2
fnm use 13.2

# update npm (node package manager)
npm i -g npm

# Install Go
sudo snap install go --classic
mkdir -p $HOME/.go/src

# Git
sudo apt install -y git

# allow non-default PPA sources (not included in Elementary OS)
sudo apt install -y software-properties-common

# set the Terminal to always run as a bash login shell
sudo touch /bin/bashlogin
sudo bash -c 'printf "#!/bin/sh\n\nexec bash --login" > /bin/bashlogin'
sudo chmod +x /bin/bashlogin
gsettings set io.elementary.terminal.settings shell 'bashlogin'

# disable dynamic workspaces
gsettings set org.pantheon.desktop.gala.behavior dynamic-workspaces false

# set set num of workspaces to 5
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6

# install devilspie for auto workspaces management
sudo apt install -y devilspie2 lua5.2

###############################################################################
# Install                                                                     #
###############################################################################

