#!/bin/bash -e

# Install required packages for customization
# Get fonts
echo Get fonts
git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git
cp -v YosemiteSanFranciscoFont/*.ttf /usr/share/fonts
rm -rf YosemiteSanFranciscoFont

# Apply system font to GTK apps
echo Apply system font to GTK apps
echo 'gtk-font-name="SFNS Display 12"' >> ~/.gtkrc-2.0
echo 'gtk-font-name="SFNS Display 12"' >> ~/.config/gtk-3.0/settings.ini

# Install Arc theme
rm -rf /usr/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.local/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.themes/{Arc,Arc-Darker,Arc-Dark}

wget http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/Release.key
sudo apt-key add - < Release.key
sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list"
sudo apt-get update
sudo apt-get install arc-theme
rm -rf Release.key

echo "gtk-theme-name=Arc-Darker" >> ~/.config/gtk-3.0/settings.ini
