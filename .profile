#!/usr/bin/env bash

# editor
export EDITOR="nano"
export VISUAL=$EDITOR

# prefer US english and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# load the Bash-specific profile if necessary
[[ -n "$BASH_VERSION" ]] && [[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

# set PATH so it includes user's private bin if it exists
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

# add node to $PATH
export PATH="$HOME/.fnm:$PATH"
eval "`fnm env --multi`"

# add flatpak to $PATH
export PATH="/var/lib/flatpak/exports/bin:$PATH"
export PATH="/var/lib/flatpak/exports/share:$PATH"
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"

# add snap to $PATH
export PATH="/snap/bin:$PATH"

# add go to $PATH
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin:$GOBIN

# Load aliases
[[ -s "$HOME/.aliases" ]] && . "$HOME/.aliases"

# Personal environment
[[ -s "$HOME/.env" ]] && . "$HOME/.env"
