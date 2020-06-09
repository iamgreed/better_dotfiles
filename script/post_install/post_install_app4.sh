function askApp4Dialog() {
    # dialog menu
    cmd=(dialog --separate-output --checklist "Please select app 3 to be installed:" 22 76 16)

    options=(
        1 "bmenu" on
    )
    a4Choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
    clear
}

function clearApp4Dialog() {
    a4Choices='0'
}

function installApp4() {
    for a4Choice in $a4Choices; do
        case $a4Choice in
        1)
            echo PRE INSTALLING BMENU
            installWYay bmenu
            ;;
        esac
    done
}
