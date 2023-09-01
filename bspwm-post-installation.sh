#!/bin/bash

# This script was made by Secret Firefox.
# This makes installing bspwm on Void Linux easy.
# This still requires some user interaction at some parts, mainly for editing 
# some values.
# This version does not include a lemonbar. 
# The screenshot functionality is copy-to-clipboard with maim and xclip.
# The terminal emulator is the xfce4-terminal.
# The compositor is picom.
# The policy kit agent is xfce-polkit
# This is meant to be started through a ~/.xinitrc, without a login manager.
# Enjoy!

# Install bspwm, sxhkd and dmenu (suckless tools)

sudo xbps-install bspwm sxhkd dmenu -y

# Install the screenshot, wallpaper selector, and appearance utilities

sudo xbps-install maim xclip feh lxappearance -y

# Install picom for compositing functionality

sudo xbps-install picom -y

# Install the terminal emulator (xfce4-terminal)

sudo xbps-install xfce4-terminal -y

# Install polkit and a polkit agent (xfce-polkit)

sudo xbps-install polkit xfce-polkit -y
sudo ln -s /etc/sv/polkitd /var/service 

# Configure bspwm and sxhkd

install -Dm755 /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc

# Copy the provided screenshooting script to sxhkd directory

cp -r print-screen.sh ~/.config/sxhkd/print-screen.sh

# Generate a ~/.xinitrc for working dbus through startx

echo "dbus-launch --exit-with-session bspwm" >> ~/.xinitrc

# Inform sxhkdrc to run the print-screen.sh script whenever PrintSc is pressed.
# Add a line for Print, then in another line hit tab, and then write:
# bash ~/.config/sxhkd/print-screen.sh
# to assign the script to be run whenever print is pressed. 
# You may want to specify the terminal emulator (xfce4-terminal) here, in place 
# of urxvt.
# You may also want to change dmenu key combination to Super + d rather than 
# Super + @space

sudo nano ~/.config/sxhkd/sxhkdrc

# Add numlockx & to start the numpad every login
# Add pipewire, pipewire-pulse, and wireplumber to start every login
# Add picom to autostart every login
# Stop the cursor from resetting every login to X's default cursor
# Fix the proportion of window distributions from 0.52 to 0.50 (manually)
# Specify the xfce-polkit to run every login

echo "numlockx &" >> ~/.config/bspwm/bspwmrc
echo "pipewire &" >> ~/.config/bspwm/bspwmrc
echo "pipewire-pulse &" >> ~/.config/bspwm/bspwmrc
echo "wireplumber &" >> ~/.config/bspwm/bspwmrc
echo "picom &" >> ~/.config/bspwm/bspwmrc
echo "xsetroot -cursor_name left_ptr &" >> ~/.config/bspwm/bspwmrc
echo "xfce-polkit &" >> ~/.config/bspwm/bspwmrc
sudo nano ~/.config/bspwm/bspwmrc

# Inform finished installation

echo "Installation complete. Reboot, login with your credentials then do startx."






