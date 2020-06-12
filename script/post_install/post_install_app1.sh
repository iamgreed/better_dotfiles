function askApp1Dialog() {
    # dialog menu
    cmd=(dialog --separate-output --checklist "Please select app keybinding 1 to be installed:" 22 76 16)

    options=(
        1 "Lynx" on
        2 "Rtv" off
        3 "Tuir" on
        4 "neomutt" on
        5 "scrcpy" on
    )
    a1Choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
    clear
}

function clearApp1Dialog() {
    a1Choices='0'
}

function installApp1() {
    for a1Choice in $a1Choices; do
        case $a1Choice in
        1)
            echo PRE INSTALLING LYNX
            installWYay lynx
            ;;

        2)
            echo PRE INSTALLING RTV
            installWYay rtv
            ;;
        3)
            echo PRE INSTALLING TUIR
            installWYay tuir
            ;;
        4)
            echo PRE INSTALLING NEOMUTT
            installWYay neomutt
            ;;
        5)
            installWYay scrcpy
            ;;

        esac

    done

}
