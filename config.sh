#!/usr/bin/env bash

# Configure the system and included applications

###############################################################################
# Global Config                                                               #
###############################################################################

# re-categorize built-in shortcuts
sudo sed -i 's/Categories=.*$/Categories=Utility;/' /usr/share/applications/io.elementary.camera.desktop
sudo sed -i 's/Categories=.*$/Categories=Utility;/' /usr/share/applications/io.elementary.files.desktop
sudo sed -i 's/Categories=.*$/Categories=Utility;/' /usr/share/applications/io.elementary.photos.desktop
sudo sed -i 's/Categories=.*$/Categories=AudioVideo;/' /usr/share/applications/com.github.artemanufrij.screencast.desktop
sudo sed -i 's/Categories=.*$/Categories=Graphics;/' /usr/share/applications/io.elementary.screenshot-tool.desktop

# rename built-in shortcuts
sudo sed -i 's/Name=.*$/Name=Settings/' /usr/share/applications/io.elementary.switchboard.desktop

# remove built-in shortcuts
sudo rm /usr/share/applications/gala-multitaskingview.desktop
 
# /etc/bluetooth/main.conf
# auto-enable bluetooth on boot, req'd for wireless keyboard
sudo sed -i 's/^.*AutoEnable=.*$/AutoEnable=true/' /etc/bluetooth/main.conf

# hide the snap folder in ~
echo snap >> ~/.hidden

# devilspie2
mkdir -p $HOME/.config/devilspie2
mkdir -p $HOME/.config/autostart
cat <<EOT > ~/.config/autostart/devilspie2.desktop
[Desktop Entry]
Name="devilspie2"
GenericName="devilspie2"
Exec=/usr/bin/devilspie2
Terminal=false
Type=Application
X-Gnome-Autostart=true
EOT

###############################################################################
# Application Specific Config                                                 #
###############################################################################

