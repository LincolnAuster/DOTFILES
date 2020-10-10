#!/bin/bash

# Install my dotfiles onto a fresh Arch install

pacman -Sy > /dev/null

echo "---------------------------------------"
echo " DEVICE DRIVERS AND ESSENTIAL PACKAGES "
echo "---------------------------------------"

echo "dhcpcd"
pacman -S dhcpcd

echo "git, base-devel"
pacman -S --needed git base-devel

echo "header files required for st, dwm, sowm"
pacman -S libx11 harfbuzz freetype2

echo "Video Driver Selection (arranged in order of quality): "
echo "1) AMD"
echo "2) Intel"
echo " ... "
echo "3) Nvidia"

printf "\n > "

read DRIVER_CHOICE

if [ $DRIVER_CHOICE == 1 ]; then
	pacman -S xf86-video-amdgpu
fi

if [ $DRIVER_CHOICE == 2 ]; then
	pacman -S xf86-video-intel
fi

if [ $DRIVER_CHOICE == 3 ]; then
	pacman -S nvidia
fi

echo "libinput"
pacman -S xf86-input-libinput

echo "Pulse and ALSA"

pacman -S alsa-utils
pacman -S pulseaudio pulseaudio-alsa pulseaudio-bluetooth

echo "-------------------"
echo " YAY AND AUR STUFF "
echo "-------------------"

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo "---------------------"
echo " A E S T H E T I C S "
echo "---------------------"

pacman -S neofetch
pacman -S polybar

echo "Fira Code"
pacman -S ttf-fira-code

echo "st"

git clone https://github.com/LincolnAuster/st
cd st
make
make clean install
cd ..

echo "dwm"

git clone https://github.com/LincolnAuster/dwm
cd dwm
make
make clean install
cd ..

echo "sowm"

git clone https://github.com/LincolnAuster/sowm
cd sowm
make
make clean install
cd ..

echo "INSTALL-DOTS (run without sudo) will install dotfiles"
