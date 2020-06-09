function installDialog() {
  if ! [ -x "$(command -v dialog)" ]; then
    echo INSTALLING dialog
    pacman -S dialog
  else
    echo "Dialog already intalled"
  fi
}

function askDialog() {
  # dialog menu
  cmd=(dialog --separate-output --checklist "Please select category:" 22 76 16)

  options=(
    1 "General" off
    2 "App1" off
    3 "App2" off
    4 "App3" off
    5 "Dev" off
    6 "Code" off
    7 "i3" off
    8 "terminal" off
    9 "App4" off
  )
  categories=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
  clear

  for category in $categories; do
    case $category in
    1)
      askGeneralDialog
      ;;
    2)
      askApp1Dialog
      ;;
    3)
      askApp2Dialog
      ;;
    4)
      askApp3Dialog
      ;;
    5)
      askDevelopmentDialog
      ;;
    6)
      askCodeDialog
      ;;
    7)
      askI3Dialog
      ;;
    8)
      askTerminalDialog
      ;;
    9)
      askApp4Dialog
      ;;

    esac
  done
}

clearSelection() {
  clearGeneralDialog
  clearApp1Dialog
  clearApp2Dialog
  clearApp3Dialog
  clearApp4Dialog
  clearDevelopmentDialog
  clearCodeDialog
  clearI3Dialog
  clearTerminalDialog
}

function installYay() {
  if ! [ -x "$(command -v yay)" ]; then
    echo INSTALLING YAY
    git clone https://aur.archlinux.org/yay.git
    cd yay && makepkg -si --noconfirm && cd ..
    rm -rf yay
  else
    echo YAY ALREADY INSTALLED
  fi
}

function installSnap() {
  if ! [ -x "$(command -v snap)" ]; then
    echo INSTALLING SNAP
    yay -Sy --noconfirm snapd
    sudo systemctl enable --now snapd.socket
    echo Either log out and back in again, or restart your system, to ensure snap’s paths are updated correctly.
    echo Once done, restart the script!
    exit 1
  else
    echo SNAP ALREADY INSTALLED
  fi
}

installWYay() {
  local package="$1"

  if [ -z "$2" ]; then
    local command="$1"
  else
    local command="$2"
  fi

  if ! [ -x "$(command -v $command)" ]; then
    echo INSTALLING $package
    yay -S --noconfirm $package
  else
    echo $package ALREADY INSTALLED
  fi
}

function mainDialog() {
  clear
  # setup variables
  TEMP_DIR=~/setup-temp

  mkdir -p $TEMP_DIR
  mkdir -p ~/.config/autostart

  #move to temp folder
  cd $TEMP_DIR

  clearSelection
  askDialog

  installGeneralChoice
  installApp1
  installApp2
  installApp3
  installApp4
  installDevChoice
  installCodeChoice
  installI3Choice
  installTerminalChoice

  rm -rf $TEMP_DIR

  echo Purged temp folder

  read -n 1 -p "Press any key to continue" mainmenuinput

  askRestart
}

function askRestart() {
  dialog --title "Restart wizard?" \
    --backtitle "Do you want to restart the installation wizard?" \
    --yesno "Are you sure you want to restart the installation wizard?" 7 60

  # Get exit status
  # 0 means user hit [yes] button.
  # 1 means user hit [no] button.
  # 255 means user hit [Esc] key.
  response=$?
  case $response in
  0) mainDialog ;;
  1)
    clear
    echo "gg"
    ;;
  255)
    clear
    echo "all done"
    ;;
  esac
}
