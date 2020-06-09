#!/bin/bash
. ./post_install_helper.sh
. ./post_install_general.sh
. ./post_install_code.sh
. ./post_install_i3.sh
. ./post_install_app1.sh
. ./post_install_app2.sh
. ./post_install_app3.sh
. ./post_install_app4.sh
. ./post_install_development.sh
. ./post_install_terminal.sh

echo "Updating and Upgrading"
sudo pacman -Syyu

installYay
installSnap

# install dialog if needed
installDialog

mainDialog