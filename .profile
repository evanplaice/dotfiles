#!/usr/bin/env bash

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# load the Bash-specific profile if necessary
[[ -n "$BASH_VERSION" ]] && [[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

# set PATH so it includes user's private bin if it exists
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"

# set PATH so it includes user's private bin if it exists
[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"

# add snap to $PATH
export PATH="/snap/bin:$PATH"

# load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Load dotfiles
[[ -s "$HOME/.exports" ]] && . "$HOME/.exports"
[[ -s "$HOME/.aliases" ]] && . "$HOME/.aliases"

# Personal environment
[[ -s "$HOME/.env" ]] && . "$HOME/.env"
