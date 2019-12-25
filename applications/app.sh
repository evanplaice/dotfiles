#!/usr/bin/env bash

# which app should be installed
APPLICATION=$1

###############################################################################
# Setup                                                                       #
###############################################################################

pre() {
	rm app.log
}

setup() {
  SETUP_PATH="./$APPLICATION/.setup"
  if [ -f SETUP_PATH ]; then
    echo $SETUP_PATH
    # . $SETUP_PATH | tee -a install.log
  fi
}

exports() {
	EXPORTS_PATH="./$APPLICATION/.exports"
  if [ -f EXPORTS_PATH ]; then
    echo $EXPORTS_PATH
    # cat $EXPORTS_PATH >> "$HOME/.exports"
  fi
}

aliases() {
	ALIASES_PATH="./$APPLICATION/.aliases"
  if [ -f ALIASES_PATH ]; then
    echo $ALIASES_PATH
    # cat $ALIASES_PATH >> "$HOME/.aliases"
  fi
}

config() {
  CONFIG_PATH="./$APPLICATION/.config"
  if [ -f CONFIG_PATH ]; then
    echo $CONFIG_PATH
    # . $CONFIG_PATH | tee -a install.log
  fi
}

pre
setup
exports
aliases
config
