FIRACODE_VERSION=2
FONTAWESOME_VERSION=5.12.1
NERDFONT_VERSION=2.0.0

function askGeneralDialog() {
    # dialog menu
    cmd=(dialog --separate-output --checklist "Please select general library to be installed:" 22 76 16)

    options=(
        1 "Emacs" off
        2 "Dustn" on
        3 "Firacode 2" on
        4 "Furacode 2.0.0" on
        5 "Font awesome 5.12.1" on
        6 "nvim" on
        7 "volumeicon" on
        8 "xorg-xkill" on
        9 "nitrogen" on
        10 "oblogout" on
        11 "octopi" on
    )
    genealChoices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
    clear
}

function clearGeneralDialog() {
    genealChoices='0'
}

function installGeneralChoice() {
    for genealChoice in $genealChoices; do
        case $genealChoice in
        1)
            installEmacs
            ;;
        2)
            installWYay dunst
            ;;
        3)
            installFiraCode
            ;;
        4)
            installFuraCode
            ;;
        5)
            installFontAwesome
            ;;
        6)
            installWYay neovim-git nvim
            ;;
        7)
            installWYay volumeicon
            ;;
        8)
            installWYay xkill
            ;;
        9)
            installWYay nitrogen
            ;;
        10)
            installWYay oblogout
            ;;
        11)
            installWYay octopi
            ;;
        esac

    done

}

function installFiraCode() {
    if ! [ "$(fc-list | grep -c 'FiraCode')" -ge 1 ]; then
        echo INSTALLING FIRACODE
        wget https://github.com/tonsky/FiraCode/releases/download/$FIRACODE_VERSION/FiraCode_$FIRACODE_VERSION.zip -O $TEMP_DIR/FiraCode.zip

        unzip $TEMP_DIR/FiraCode.zip -d ~/.fonts

        fc-cache

    else
        echo FIRACODE ALREADY INSTALLED
    fi
}

function installFuraCode() {
    if ! [ "$(fc-list | grep -c 'Fura Code')" -ge 1 ]; then
        echo INSTALLING PATCHED FIRACODE
        wget https://github.com/ryanoasis/nerd-fonts/releases/download/v$NERDFONT_VERSION/FiraCode.zip -O $TEMP_DIR/FuraCode.zip

        unzip $TEMP_DIR/FuraCode.zip -d ~/.fonts

        fc-cache

    else
        echo PATCHED FIRACODE ALREADY INSTALLED
    fi
}

function installFontAwesome() {
    if ! [ "$(fc-list | grep -c 'Font Awesome 5 Free')" -ge 1 ]; then
        echo INSTALLING FONTAWESOME
        wget https://github.com/FortAwesome/Font-Awesome/releases/download/$FONTAWESOME_VERSION/fontawesome-free-$FONTAWESOME_VERSION-desktop.zip -O $TEMP_DIR/FontAwesome.zip

        unzip $TEMP_DIR/FontAwesome.zip -d ~/.fonts

        fc-cache
    else
        echo FONTAWESOME ALREADY INSTALLED
    fi
}

function installEmacs() {
    if ! [ -x "$(command -v emacs)" ]; then
        echo INSTALLING EMACS
        echo SELECT THE VERSION NEEDED BY DOOM EMACS
        sudo snap install emacs --channel=latest/beta --classic
        yay -Sy --noconfirm ripgrep
        git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
        ~/.emacs.d/bin/doom install
    else
        echo EMACS ALREADY INSTALLED
    fi
}
