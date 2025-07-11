#!/bin/bash

# Create home subdirectories
echo "Creating home subdirectories"
mkdir -p $HOME/Documents $HOME/Downloads $HOME/Music $HOME/Pictures $HOME/programming/projects $HOME/temp

# Install yay if not installed
if ! command -v yay > /dev/null 2>&1; then
	echo "Installing yay"
	sudo pacman -S --needed git base-devel
	[ -d $HOME/Downloads/yay ] && rm -rf $HOME/Downloads/yay
	git clone https://aur.archlinux.org/yay.git $HOME/Downloads/yay
	(cd $HOME/Downloads/yay && makepkg -si)
	rm -rf $HOME/Downloads/yay
fi

# Clone and checkout dotfiles
if [ -d $HOME/.dotfiles ]; then
	echo -e "\e[31mError:\e[0m Directory .dotfiles already exists, please remove or backup this directory first"
	exit 1
else
	echo "Cloning and checking out dotfiles"
	git clone --bare https://github.com/mcttn22/dotfiles.git $HOME/.dotfiles
	git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
	git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
fi

# Sync and update current packages
echo "Syncing and updating current packages"
yay -Syu

# Installed required packages
echo "Installing required packages"
yay -S --needed \
	sddm \
	hyprland \
	xorg-xwayland \
	pipewire \
	wireplumber \
	pavucontrol \
	xdg-desktop-portal-hyprland \
	qt5-wayland \
	qt6-wayland \
	hyprpaper \
	hypridle \
	hyprlock \
	hyprpolkitagent \
	brightnessctl \
	networkmanager \
	network-manager-applet \
	playerctl \
	wl-clipboard \
	cliphist \
	waybar \
	waybar-module-pacman-updates-git \
	wttrbar \
	wofi \
	kitty \
	dolphin \
	firefox \
	cmus \
	cava \
	fastfetch \
	nerd-fonts \
	grim \
	slurp \
	dunst \
	neovim \
	npm

# Enable network manager service for nm applet
echo "Enable and start NetworkManager service for NM applet"
sudo systemctl enable --now NetworkManager

# Enable sddm service
echo "Enable and start sddm service"
sudo systemctl enable --now sddm

