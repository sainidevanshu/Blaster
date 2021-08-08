#!/bin/bash

detect_distro() {
    if [[ "$OSTYPE" == linux-android* ]]; then
            distro="termux"
    fi

    if [ -z "$distro" ]; then
        distro=$(ls /etc | awk 'match($0, "(.+?)[-_](?:release|version)", groups) {if(groups[1] != "os") {print groups[1]}}')
    fi

    if [ -z "$distro" ]; then
        if [ -f "/etc/os-release" ]; then
            distro="$(source /etc/os-release && echo $ID)"
        elif [ "$OSTYPE" == "darwin" ]; then
            distro="darwin"
        else 
            distro="invalid"
        fi
    fi
}

pause() {
    read -n1 -r -p "Press any key to continue..." key
}
banner() {
    clear
    echo -e "\e[1;31m"
    if ! [ -x "$(command -v figlet)" ]; then
        echo 'Introducing Blaster'
    else
        figlet Blaster
    fi
    if ! [ -x "$(command -v toilet)" ]; then
        echo -e "\e[4;34m This Bomber Was Modify By \e[1;32mDEVANSHU SAINI \e[0m"
    else
        echo -e "\e[1;34mCreated By \e[1;34m"
        toilet -f mono12 -F border sainidevanshu
    fi
    echo " "
    echo "NOTE: Kindly move to the PIP version Of Blaster for more stability."
    echo " "
}

init_environ(){
    declare -A backends; backends=(
        ["arch"]="pacman -S --noconfirm"
        ["debian"]="apt-get -y install"
        ["ubuntu"]="apt -y install"
        ["termux"]="apt -y install"
        ["fedora"]="yum -y install"
        ["redhat"]="yum -y install"
        ["SuSE"]="zypper -n install"
        ["sles"]="zypper -n install"
        ["darwin"]="brew install"
        ["alpine"]="apk add"
    )

    INSTALL="${backends[$distro]}"

    if [ "$distro" == "termux" ]; then
        PYTHON="python"
        SUDO=""
    else
        PYTHON="python3"
        SUDO="sudo"
    fi
    PIP="$PYTHON -m pip"
}

install_deps(){
    
    packages=(openssl git $PYTHON $PYTHON-pip figlet toilet)
    if [ -n "$INSTALL" ];then
        for package in ${packages[@]}; do
            $SUDO $INSTALL $package
        done
        $PIP install -r requirements.txt
    else
        echo "We could not install dependencies."
        echo "Please make sure you have git, python3, pip3 and requirements installed."
        echo "Then you can execute blaster.py ."
        exit
    fi
}

banner
pause
detect_distro
init_environ
if [ -f .update ];then
    echo "All Requirements Found...."
else
    echo 'Installing Requirements....'
    echo .
    echo .
    install_deps
    echo This Script Was Made By sainidevanshu > .update
    echo 'Requirements Installed....'
    pause
fi
while :
do
    banner
    echo -e "\e[4;31m Please Read Instruction Carefully !!! \e[0m"
    echo " "
    echo "Press 1 To  Start SMS  Bomber "
    echo "Press 2 To  Start CALL Bomber "
    echo "Press 3 To  Start MAIL Bomber "
    echo "Press 4 To  Update (Works On Linux And Linux Emulators) "
    echo "Press 5 To  Exit "
    read ch
    clear
    if [ $ch -eq 1 ];then
        echo -e "\e[1;34m        wait please"
        echo -e "\e[1;32m   Subscribe Nitro Hacker Youtube Channel"
        sleep 5
        cd $HOME
        cd Tbomb
        python3 blaster.py
       
        exit
    elif [ $ch -eq 2 ];then
        echo -e "\e[1;34m          wait please"
        echo -e "\e[1;32m    Subscribe Nitro Hacker Youtube Channel"
        sleep 5
        cd $HOME
        cd Tbomb
        python3 blaster.py
        
        exit
        exit
    elif [ $ch -eq 3 ];then
         echo -e "\e[1;34m        wait please"
        echo -e "\e[1;32m   Follow on Instagram - @ethical_hacking.courses"
         sleep 5
         cd $HOME
        git clone https://github.com/sainidevanshu/Emailbomber
         cd Emailbomber
         cd Emailbomber
        chmod +x Emailbomb.py
        python2 Emailbomb.py

        exit
    elif [ $ch -eq 4 ];then
        echo -e "\e[1;34m            email bombing comming soon"
        echo -e "\e[1;32m        Follow on instagram - @ethical_hacking.courses"
        sleep 5
        cd $HOME
        cd Blaster
        bash Blaster.sh
    elif [ $ch -eq 5 ];then
        echo -e "\e[1;34m Downloading Latest Files..."
        cd $HOME
        rm -rf Blaster
        git clone https://github.com/sainidevanshu/Blaster
                cd Blaster
        bash Blaster.sh
       
        exit
    elif [ $ch -eq 6 ];then
        cd $HOME
        exit
        
    else
        echo -e "\e[4;32m Invalid Input !!! \e[0m"
        pause
    fi
done
