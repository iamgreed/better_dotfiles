function askDevelopmentDialog() {
    # dialog menu
    cmd=(dialog --separate-output --checklist "Please select general library to be installed:" 22 76 16)

    options=(
        1 "Git" on
        2 "dot net sdk" off
        3 "NVM" off
        4 "Yarn" off
        5 "Docker" off
        6 "Docker compose" off
        7 "Rust" off
    )
    devChoices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
    clear
}

function clearDevelopmentDialog(){
    devChoices='0';
}

function installDevChoice() {
    for devChoice in $devChoices; do
        case $devChoice in
        1)
            echo PRE INSTALLING GIT
            installWYay git
            ;;
        2)
            echo PRE INSTALLING DOT NET SDK
            installWYay dotnet-runtime
            ;;
        3)
            echo PRE INSTALLING NVM
            installWYay nvm
            ;;
        4)
            echo PRE INSTALLING YARN
            installWYay yarn
            ;;
        5)
            echo PRE INSTALLING DOCKER
            installDocker
            ;;
        6)
            echo PRE INSTALLING DOCKER COMPOSE
            installWYay docker-compose
            ;;
        7)
            echo PRE INSTALLING RUST
            installRust
            ;;
        esac

    done

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

function installRust() {
    if ! [ -x "$(command -v rust)" ]; then
        echo INSTALLING RUST
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    else
        echo RUST ALREADY INSTALLED
    fi
}
