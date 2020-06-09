function askApp3Dialog() {
    # dialog menu
    cmd=(dialog --separate-output --checklist "Please select app 2 to be installed:" 22 76 16)

    options=(
        1 "htop" on
        2 "gtop" on
        3 "nmon" on
        4 "glances" on
        5 "s-tui" on
        6 "httping" on
        7 "cmatrix" on
        8 "wopr" on
    )
    a3Choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
    clear
}

function clearApp3Dialog() {
    a3Choices='0'
}

function installApp3() {
    for a3Choice in $a3Choices; do
        case $a3Choice in
        1)
            echo PRE INSTALLING HTOP
            installWYay htop
            ;;
        2)
            echo PRE INSTALLING GTOP
            installWYay gtop
            ;;
        3)
            echo PRE INSTALLING NMON
            installWYay nmon
            ;;
        4)
            echo PRE INSTALLING GLANCES
            installWYay glances
            ;;
        5)
            echo PRE INSTALLING S-TUI
            installWYay s-tui
            ;;
        6)
            echo PRE INSTALLING HTTPING
            installWYay httping
            ;;
        7)
            echo PRE INSTALLING CMATRIX
            installWYay cmatrix
            ;;
        8)
            echo PRE INSTALLING WOPR
            installWYay wopr
            ;;
        esac
    done
}
