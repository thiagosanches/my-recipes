#!/bin/bash

sudo apt install -y \
	git \
	software-properties-common \
	apt-transport-https \
	wget

# add vscode as apt package.
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update

# add keepassxc as apt package.
sudo add-apt-repository -y ppa:phoerious/keepassxc

sudo apt install -y \
	flameshot \
	xterm \
	htop \
	code \
	git \
	thunar \
	i3 \
	feh \
	fonts-font-awesome \
	rofi \
	pulseaudio-utils \
	xbacklight \
	alsa-tools \
	clipit \
	gcc \
	locate \
	pcmanfm \
	acpi \
	libnotify-bin keepassxc \
	lxappearance gtk-chtheme \
	ansible \
	jq \
	meld

# install awslcli:
# https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html

# create my common folders
# t is for tooling
# r is for repos
# downloads for downloads (but not capital d)
# void is for temporary and any kind of file
# mkdir -p ~/t ~/r ~/downloads ~/void

# clone my recipes
# git clone https://github.com/thiagosanches/my-recipes.git .my-recipes || echo 'already cloned!!!'

# Install .Xresources theme (dracula)
# Or install nord https://github.com/arcticicestudio/nord-xresources

# eval "$(ssh-agent -s)"

# nvm
#curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash


