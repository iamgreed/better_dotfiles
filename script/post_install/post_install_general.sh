FIRACODE_VERSION=2
FONTAWESOME_VERSION=5.12.1
NERDFONT_VERSION=2.0.0

function askGeneralDialog() {
    # dialog menu
    cmd=(dialog --separate-output --checklist "Please select general library to be installed:" 22 76 16)

    options=(
        1 "Git" on
        2 "Lsd" off
        3 "Oh my zsh" on
        4 "bd" off
        5 "dot net sdk" off
        6 "NVM" off
        7 "Yarn" off
        8 "Docker" off
        9 "Docker compose" off
        10 "Emacs" off
        11 "Dustn" off
        12 "Kitty" off
        13 "Firacode 2" on
        14 "Furacode 2.0.0" on
        15 "Font awesome 5.12.1" on
        16 "Rust" off
        17 "Lynx" on
        18 "Rtv" off
        19 "Tuid" on
        20 "neomutt" on
        21 "vifm" on
        22 "joplin" on
        23 "cmus" on
        24 "youtube-viewer" on
        25 "ncpamixer" on
    )
    genealChoices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
    clear
}

function installGeneralChoice() {
    for genealChoice in $genealChoices; do
        case $genealChoice in
        1)
            echo PRE INSTALLING GIT
            installWYay git
            ;;
        2)
            echo PRE INSTALLING LSD
            installLsd
            ;;
        3)
            echo PRE INSTALLING OH MY ZSH
            installOhMyZsh
            ;;
        4)
            echo PRE INSTALLING Bd
            installBd
            ;;
        5)
            echo PRE INSTALLING DOT NET SDK
            installWYay dotnet-runtime
            ;;
        6)
            echo PRE INSTALLING NVM
            installWYay nvm
            ;;
        7)
            echo PRE INSTALLING YARN
            installWYay yarn
            ;;
        8)
            echo PRE INSTALLING DOCKER
            installDocker
            ;;
        9)
            echo PRE INSTALLING DOCKER COMPOSE
            installWYay docker-compose
            ;;
        10)
            echo PRE INSTALLING EMACS
            installEmacs
            ;;
        11)
            echo PRE INSTALLING DUNST
            installWYay dunst
            ;;
        12)
            echo PRE INSTALLING KITTY
            installWYay kitty
            ;;
        13)
            echo PRE INSTALLING FIRACODE
            installFiraCode
            ;;
        14)
            echo PRE INSTALLING PATCHED FIRACODE
            installFuraCode
            ;;
        15)
            echo PRE INSTALLING FONTAWESOME
            installFontAwesome
            ;;
        16)
            echo PRE INSTALLING RUST
            installRust
            ;;
        17)
            echo PRE INSTALLING LYNX
            installWYay lynx
            ;;
        18)
            echo PRE INSTALLING RTV
            installWYay rtv
            ;;
        19)
            echo PRE INSTALLING TUIR
            installWYay tuir
            ;;
        20)
            echo PRE INSTALLING NEOMUTT
            installWYay neomutt
            ;;
        21)
            echo PRE INSTALLING VIFM
            installWYay vifm
            ;;
        22)
            echo PRE INSTALLING JOPLIN
            installWYay joplin
            ;;
        23)
            echo PRE INSTALLING CMUS
            installWYay cmus
            ;;
        24)
            echo PRE INSTALLING YOUTUBE VIEWER
            installWYay youtube-viewer
            ;;
        25)
            echo PRE INSTALLING NCPAMIXER
            installNcpamixer
            ;;
        esac

    done

}

installWYay() {
    local package="$1"
    if ! [ -x "$(command -v $package)" ]; then
        echo INSTALLING $package
        yay -S --noconfirm $package
    else
        echo $package ALREADY INSTALLED
    fi
}

function installLsd() {
    if ! [ -x "$(command -v lsd)" ]; then
        echo INSTALLING LSD
        sudo snap install lsd --devmode
    else
        echo LSD ALREADY INSTALLED
    fi
}

function installNcpamixer() {
    if ! [ -x "$(command -v ncpamixer)" ]; then
        echo INSTALLING NCPAMIXER
        yay -S --noconfirm ncpamixer-git
    else
        echo NCPAMIXER ALREADY INSTALLED
    fi
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

function installDocker() {
    if ! [ -x "$(command -v docker)" ]; then
        echo INSTALLING DOCKER
        yay -Sy --noconfirm docker
        sudo groupadd docker
        sudo usermod -aG docker $USER
        newgrp docker
        sudo systemctl enable docker
        sudo systemctl start docker
    else
        echo DOCKER ALREADY INSTALLED
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

function installRust() {
    if ! [ -x "$(command -v rust)" ]; then
        echo INSTALLING RUST
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    else
        echo RUST ALREADY INSTALLED
    fi
}
