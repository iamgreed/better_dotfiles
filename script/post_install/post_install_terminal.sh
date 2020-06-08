FIRACODE_VERSION=2
FONTAWESOME_VERSION=5.12.1
NERDFONT_VERSION=2.0.0

function askTerminalDialog() {
    # dialog menu
    cmd=(dialog --separate-output --checklist "Please select terminal related stuff to be installed:" 22 76 16)

    options=(
        1 "Kitty" off
        2 "Oh my zsh" on
        3 "Lsd" off
        4 "bd" off
    )
    terminalChoices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
    clear
}

function clearTerminalDialog(){
    terminalChoices='0';
}

function installTerminalChoice() {
    for terminalChoice in $terminalChoices; do
        case $terminalChoice in
        1)
            echo PRE INSTALLING KITTY
            installWYay kitty
            ;;
        2)
            echo PRE INSTALLING OH MY ZSH
            installOhMyZsh
            ;;
        3)
            echo PRE INSTALLING LSD
            installLsd
            ;;
        4)
            echo PRE INSTALLING Bd
            installBd
            ;;

        esac

    done

}

function installLsd() {
    if ! [ -x "$(command -v lsd)" ]; then
        echo INSTALLING LSD
        sudo snap install lsd --devmode
    else
        echo LSD ALREADY INSTALLED
    fi
}

function installOhMyZsh() {
    if [ ! -d ~/.oh-my-zsh ]; then
        echo INSTALLING OH-MY-ZSH
        # echo TELL YES TO CHANGE TO SHELL AND THEN EXIT!
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed '/\s*env\s\s*zsh\s*/d')"

        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

        git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
        git clone https://github.com/lukechilds/zsh-better-npm-completion ~/.oh-my-zsh/custom/plugins/zsh-better-npm-completion
        git clone https://github.com/buonomo/yarn-completion ~/.oh-my-zsh/custom/plugins/yarn-completion
    else
        echo OH-MY-ZSH ALREADY INSTALLED
    fi
}

function installBd() {
    if ! [ -x "$(command -v bd)" ]; then
        echo INSTALLING BD
        mkdir -p ~/.oh-my-zsh/custom/plugins/bd
        curl https://raw.githubusercontent.com/Tarrasch/zsh-bd/master/bd.zsh >~/.oh-my-zsh/custom/plugins/bd/bd.zsh
        echo -e "\n# zsh-bd\n. ~/.oh-my-zsh/custom/plugins/bd/bd.zsh" >>~/.zshrc
    else
        echo BD ALREADY INSTALLED
    fi
}