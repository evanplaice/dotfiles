#!/usr/bin/env bash

###############################################################################
# Pre-Install                                                                 #
###############################################################################

	# enable bash strict mode
	# set -eo pipefail

	# force apt to run fully non-interactive 
	DEBIAN_FRONTEND=noninteractive
	# update sources
	sudo apt-get update

	# upgrade existing packages (non-interactive hack)
  sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade

	# C++ Runtime
	sudo apt-get -y install libc++1

	# Snap package manager
	sudo apt-get -y install snapd

  # Python package manager 
  sudo apt-get -y install python-pip

  # Python 3 package manager (ie pip3)
  sudo apt-get -y install python3-pip

  # Python distutils 
  sudo apt-get -y install python3-distutils

	# NVM (Node Version Manager)
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
	. $HOME/.nvm/nvm.sh
	nvm install 12.8 2> /dev/null

	# Update NPM (Node Package Manager)
	npm i -g npm

	# Git
	sudo apt-get -y install git

	# allow non-default PPA sources (not included in Elementary OS)
	sudo apt-get -y install software-properties-common

	# set the Terminal to always run as a bash login shell
	sudo touch /bin/bashlogin
	sudo bash -c 'printf "#!/bin/sh\n\nexec bash --login" > /bin/bashlogin'
	sudo chmod +x /bin/bashlogin
	gsettings set io.elementary.terminal.settings shell 'bashlogin'

  # load the inital profile
	. .profile

###############################################################################
# Install                                                                     #
###############################################################################

