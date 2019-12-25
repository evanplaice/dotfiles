#!/usr/bin/env bash

# Configure the system and included applications

###############################################################################
# Global Config                                                               #
###############################################################################

# move built-in application shortcuts to more suitable categories
sudo sed -i 's/Categories=.*$/Categories=Utility;/' /usr/share/applications/io.elementary.camera.desktop
sudo sed -i 's/Categories=.*$/Categories=Utility;/' /usr/share/applications/io.elementary.calendar.desktop
sudo sed -i 's/Categories=.*$/Categories=Utility;/' /usr/share/applications/io.elementary.files.desktop
sudo sed -i 's/Categories=.*$/Categories=Utility;/' /usr/share/applications/io.elementary.music.desktop
sudo sed -i 's/Categories=.*$/Categories=Utility;/' /usr/share/applications/io.elementary.photos.desktop
sudo sed -i 's/Categories=.*$/Categories=Utility;/' /usr/share/applications/io.elementary.videos.desktop
sudo sed -i 's/Categories=.*$/Categories=AudioVideo;/' /usr/share/applications/com.github.artemanufrij.screencast.desktop
sudo sed -i 's/Categories=.*$/Categories=Graphics;/' /usr/share/applications/io.elementary.screenshot-tool.desktop

# remove built-in application shortcuts from the menu
sudo rm /usr/share/applications/org.gnome.Epiphany.desktop
sudo rm /usr/share/applications/org.pantheon.mail.desktop
sudo rm /usr/share/applications/io.elementary.code.desktop
 
# /etc/bluetooth/main.conf
# auto-enable bluetooth on boot, req'd for wireless keyboard
sudo sed -i 's/^.*AutoEnable=.*$/AutoEnable=true/' /etc/bluetooth/main.conf

# hide the snap folder in ~
echo snap >> ~/.hidden


###############################################################################
# Application Specific Config                                                 #
###############################################################################

