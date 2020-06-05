#!/bin/bash
. ./post_install_helper.sh
. ./post_install_general.sh
. ./post_install_code.sh
. ./post_install_i3.sh

echo "Updating and Upgrading"
sudo pacman -Syyu

installYay
installSnap

# install dialog if needed
installDialog

mainDialog