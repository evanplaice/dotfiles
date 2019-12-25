Dotfiles
-----------

## Description

Dotfiles comes in many forms. Ranging from a few scripts to custom frameworks. This one attempts to keep things simple. The dotfiles themselves represent the different steps of the installation/configuration process.

*Top-Level*

The top-level contain system-wide configuration and/or setup steps. This is where os-specific and/or application agnostic steps should be added.

*Application*

Each application has its own directory. Within this directory are application-specific steps as well as any required setup/configuration files required. For exmaple here's the directory for git.

```
git
├── config
│   ├── .gitconfig
│   └── .gitignore
├── .aliases
└── .config
```

*How it works*

Installation is simple. It collects, combines, then runs all of the included dotfiles in the correct order. There's no magic here, it's just a bunch of shell scripts.

## Installation

Run the following to download the dotfiles from GitHub (sans git)

```bash
# Define the GitHub username
GITHUB_USER=[your-github-user-name]

# Download and extract into ./dotfiles
mkdir dotfiles && wget -qO- https://github.com/$GITHUB_USER/dotfiles/tarball/elementaryos-dev | tar xzf - -C dotfiles --strip 1 && cd dotfiles

# Run
bash install.sh
```

## Usage

Run `install.sh`

The install script is the main entrypoint that bootstraps the entire dotfiles provisioning.

Top-level-specific dotfiles include:

- `.aliases` - global aliases
- `.exports` - global export definitions
- `.profile` - user ENV config
- `config.sh` - global configuration instructions
- `setup.sh` - setup instructions


Application dotfiles include:

- `.setup` - application installation instructions
- `.exports` - application environment variables
- `.aliases` - application aliases
- `.config` - application configuration instructions

## GUI Applications

Apps installed with these dotfiles. 

**Note: `*` marks applications pre-installed w/ ElementaryOS**

*Accessories*

- Albert - Quick Shortcut/Search Bar
- Calculator*
- Calendar*
- Camera*
- Files* - Filesystem Viewer
- KeePassXC - Password Management
- Music*
- Photos* - Picture Viewer
- Videos*

*Education*

- Anki - Flashcard Study Tool
- Freemind - Mindmap Editor

*Graphics*

- GIMP - Pixel Graphics Editor
- Inkscape - Vector Graphics Editor
- Screenshot* - Take Screenshots
- TypeCatcher - Manage Google Fonts

*Internet*

- Brave - Advertisement blocking browser
- Chromium - Open Source Chrome
- Discord - Internet Chat
- Firefox - Web Browser
- Google Chrome - Web Browser
- Slack - Internet Chat
- Transmission - Torrent Client

*Programming*

- GitKraken - Git GUI
- Postman - HTTP Request Builder
- Sublime Text - Code Editor
- Visual Studio Code - IDE

*Sound & Video*

- Audacity - Sound Recorder/Editor
- OBS - Video Broadcasting
- Screencast - Simple Screen Recorder
- Shotcut - Video Editor
- Spotify - Music Player
- VLC - Video Player

*System Tools*

- App Center*
- DConf Editor - Advanced Settings Editor
- Disks - Disk Utility
- ElementaryOS Tweaks - Advanced shell settings
- GParted - Partition Editor
- Guake - Popup Terminal
- Multitasking View*s
- System Monitor - Resource Monitor
- System Settings*
- Terminal*
- Virtualbox - Virtual Machines

## CLI Applications

- apidoc - REST API Doc Generator
- aws - Amazon Web Services
- cheat - Cheatsheets
- circleci - Run Circle CI build jobs locally
- docker - Container Tool
- fx - JSON viewer
- git - DVCS
- go - Go Language Runtime
- jest - JS Unit Testing (w/ DOM)
- live-server - Simple HTTP server w/ LiveReload
- node - JavaScript Language Runtime
- nodemon - Node Monitor
- postgresql - SQL server
- nvm - Node Version Manager
- pip - Python Package Manager
- python - Python Runtime
- rclone - RSync for the cloud
- ripit - CLI CD Ripper
- tap-spec - Tap Test Formatter
- tape - JS Unit Testing (outputs TAP)
- tree - File Tree Viewer
- vagrant - Virtual Machine Automation
- vue - Vue.js CLI
- youtube-dl - YouTube Downloader
