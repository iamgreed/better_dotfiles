function askI3Dialog() {
    # dialog menu
    cmd=(dialog --separate-output --checklist "Please select i3 package to be installed:" 22 76 16)

    options=(
        1 "i3" on
        2 "i3 lock" off
        3 "scrot" off
        4 "picom" on
        5 "conky" off
        6 "polybar" on
        7 "rofi" on
        8 "rofi greenclip" off
        9 "fhe" off
        10 "i3 battery popup git" off
        11 "morc_menu" on
        12 "i3-scrot" on
        13 "pacman-contrib" off
        14 "i3exit" on
    )
    i3Choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
    clear
}

function clearI3Dialog() {
    i3Choices='0'
}

function installI3Choice() {
    for i3Choice in $i3Choices; do
        case $i3Choice in
        1)
            echo PRE INSTALLING I3
            installWYay i3
            ;;
        2)
            echo PRE INSTALL I3 LOCK
            installWYay i3lock
            ;;
        3)
            echo PRE INSTALL SCROT
            installWYay scrot
            ;;
        4)
            echo PRE INSTALL PICOM
            installWYay picom
            ;;
        5)
            echo PRE INSTALL CONKY
            installWYay conky
            ;;
        6)
            echo PRE INSTALL POLYBAR
            installWYay polybar
            ;;
        7)
            echo PRE INSTALL ROFI
            installWYay rofi
            ;;
        8)
            echo PRE INSTALL ROFI GREENCLIP
            installRofiGreenclip
            ;;
        9)
            echo PRE INSTALL FEH
            installWYay feh
            ;;
        10)
            echo PRE INSTALL I3 BATTERY POPUP GIT
            installWYay i3-battery-popup-git
            ;;
        11)
            echo PRE INSTALL MORC_MENU
            installWYay morc_menu
            ;;
        12)
            echo PRE INSTALL i3-scrot
            installWYay i3-scrot
            ;;
        13)
            echo PRE INSTALL pacman-contrib
            installWYay pacman-contrib
            ;;
        14)
            echo PRE INSTALL i3exit
            installWYay i3exit
            ;;

        esac

    done
}

function installRofiGreenclip() {
    if ! [ -x "$(command -v rofi-greenclip)" ]; then
        echo INSTALLING ROFI GREENCLIP

        # clipboard manager
        yay -Sy --noconfirm rofi-greenclip
        systemctl --user enable greenclip.service
    else
        echo ROFI GREENCLIP ALREADY INSTALLED
    fi
}
