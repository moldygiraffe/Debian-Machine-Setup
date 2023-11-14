#!/bin/bash

# Ensure the script is run as root or with sudo
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or with sudo."
  exit 1
fi

# Update the package list and upgrade existing packages
apt update
apt upgrade -y

# Install the desired packages
apt install -y zsh git htop neofetch emacs fzf terminator cowsay w3m python3 python3-pip ssh vlc curl wget wine lutris playonlinux krusader mc kate i3

# Set Zsh as the default shell for the current user
chsh -s /usr/bin/zsh $USER

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Zsh-syntax-highlighting and Zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions


echo "Installation completed. Please restart your terminal or log out and log back in to start using Zsh."
