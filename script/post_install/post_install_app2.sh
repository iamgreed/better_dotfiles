FIRACODE_VERSION=2
FONTAWESOME_VERSION=5.12.1
NERDFONT_VERSION=2.0.0

function askApp2Dialog() {
    # dialog menu
    cmd=(dialog --separate-output --checklist "Please select app 2 to be installed:" 22 76 16)

    options=(
        1 "vifm" on
        2 "joplin" on
        3 "cmus" on
        4 "youtube-viewer" on
        5 "ncpamixer" on
        6 "calcurse" on
    )
    a2Choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
    clear
}

function clearApp2Dialog(){
    a2Choices='0';
}

function installApp2() {
    for a2Choice in $a2Choices; do
        case $a2Choice in
        1)
            echo PRE INSTALLING VIFM
            installWYay vifm
            ;;
        2)
            echo PRE INSTALLING JOPLIN
            installWYay joplin
            ;;
        3)
            echo PRE INSTALLING CMUS
            installWYay cmus
            ;;
        4)
            echo PRE INSTALLING YOUTUBE VIEWER
            installWYay youtube-viewer
            ;;
        5)
            echo PRE INSTALLING NCPAMIXER
            installWYay ncpamixer-git ncpamixer
            ;;
        6)
            echo PRE INSTALLING CALCURSE
            installWYay calcurse
            ;;
        esac
    done
}