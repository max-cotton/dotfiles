#!/bin/bash

# Create home subdirectories
echo -e "\e[32mCreating home subdirectories\e[0m"
mkdir -p "$HOME/Documents" "$HOME/Downloads" "$HOME/Music" "$HOME/Pictures" "$HOME/programming/projects" "$HOME/temp"

# Install yay if not installed
if ! command -v yay > /dev/null 2>&1; then
	echo -e "\e[32mInstalling yay\e[0m"
	sudo pacman -S --needed git base-devel
	[ -d "$HOME/Downloads/yay" ] && rm -rf "$HOME/Downloads/yay"
	git clone https://aur.archlinux.org/yay.git "$HOME/Downloads/yay"
	(cd "$HOME/Downloads/yay" && makepkg -si)
	rm -rf "$HOME/Downloads/yay"
fi

# Check for files that would be overwritten
if [ -f "$HOME/.bashrc" ]; then
	echo -e "\e[31mError:\e[0m File .bashrc already exists, please remove or backup this file first"
	exit 1
elif [ -d "$HOME/.config" ]; then
	echo -e "\e[31mError:\e[0m Directory .config already exists, please remove or backup this directory first"
	exit 1
elif [ -d "$HOME/.github" ]; then
	echo -e "\e[31mError:\e[0m Directory .github already exists, please remove or backup this directory first"
	exit 1
elif [ -d "$HOME/.dotfiles" ]; then
	echo -e "\e[31mError:\e[0m Directory .dotfiles already exists, please remove or backup this directory first"
	exit 1
fi

# Clone and checkout dotfiles
echo -e "\e[32mCloning and checking out dotfiles\e[0m"
git clone --bare https://github.com/mcttn22/dotfiles.git "$HOME/.dotfiles"
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" checkout
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" config --local status.showUntrackedFiles no

# Sync and update current packages
echo -e "\e[32mSyncing and updating current packages\e[0m"
yay -Syu

# Installed required packages
echo -e "\e[32mInstalling required packages\e[0m"
yay -S --needed \
	sddm \
	sddm-theme-sugar-candy-git \
	hyprland \
	xorg-xwayland \
	pipewire \
	wireplumber \
	pavucontrol \
	xdg-desktop-portal-hyprland \
	qt5-wayland \
	qt6-wayland \
	orchis-theme \
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
	nemo \
	firefox \
	cmus \
	cava \
	discord \
	fastfetch \
	nerd-fonts \
	grim \
	slurp \
	dunst \
	neovim \
	npm

# Apply sddm theme
echo -e "\e[32mApply sddm theme\e[0m"
sudo cp ~/.config/sddm/themes/Sugar-Candy/theme.conf /usr/share/sddm/themes/Sugar-Candy/theme.conf.user
echo -e "[Theme]\n\nCurrent=Sugar-Candy\n" | sudo tee /etc/sddm.conf > /dev/null

# Apply gtk theme
gsettings set org.gnome.desktop.interface gtk-theme Orchis-Dark

# Enable network manager service for nm applet
echo -e "\e[32mEnable and start NetworkManager service for NM applet\e[0m"
sudo systemctl enable --now NetworkManager

# Enable sddm service
echo -e "\e[32mEnable and start sddm service\e[0m"
sudo systemctl enable --now sddm

