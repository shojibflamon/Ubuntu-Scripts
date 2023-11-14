#!/bin/bash

TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED_B='\e[1;31m'
TEXT_GREEN='\e[1;32m'
TEXT_BLUE='\e[0;34m'
TEXT_PURPLE='\e[0;35m'
TEXT_CYAN='\e[0;36m'


update() {
	echo -e "\n ${TEXT_GREEN} Command : sudo apt update (UPDATE/DOWNLOAD PACKAGE INFORMATION) \n Do you wish to agree? ${TEXT_RESET}"
  select yn in "Yes" "No"; do
      case $yn in
          Yes ) 
            sudo apt update; 
            #sudo apt -qq update
            echo -e "${TEXT_GREEN} APT UPDATE FINISHED... ${TEXT_RESET}"
            break;;
          No ) break;;
      esac
  done
}

upgrade() {
	echo -e "\n ${TEXT_GREEN} Command : sudo apt upgrade (UPGRADE PACKAGE) \n Do you wish to agree? ${TEXT_RESET}"
  select yn in "Yes" "No"; do
      case $yn in
          Yes ) 
            sudo apt upgrade;
            echo -e "${TEXT_GREEN} APT UPGRADE FINISHED... ${TEXT_RESET}"
            break;;
          No ) break;;
      esac
  done
}

distUpgrade() {
	echo -e "\n ${TEXT_GREEN} Command : sudo apt dist-upgrade (APT DISTRIBUTIVE UPGRADE : install or remove packages as necessary to complete the upgrade) \n Do you wish to agree? ${TEXT_RESET}"
  select yn in "Yes" "No"; do
      case $yn in
          Yes ) 
            sudo apt dist-upgrade;
            echo -e "${TEXT_GREEN} APT DISTRIBUTIVE FINISHED... ${TEXT_RESET}"
            break;;
          No ) break;;
      esac
  done
}

autoRemove() {
	echo -e "\n ${TEXT_GREEN} Command : sudo apt autoremove (APT AUTO REMOVE) \n Do you wish to agree? ${TEXT_RESET}"
  select yn in "Yes" "No"; do
      case $yn in
          Yes ) 
            sudo apt autoremove;
            echo -e "${TEXT_GREEN} APT AUTO REMOVE FINISHED... ${TEXT_RESET}"
            break;;
          No ) break;;
      esac
  done
}

actionChrome() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION Chrome.\n  Select 1 = Download Only,\n 2 = Download & Install,\n 3 = Update,\n 4 = Uninstall & Keep Configurations,\n 5 = Uninstall & Don't Keep Configurations,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in

    1)
      if [[ -e "google-chrome-stable_current_amd64.deb" ]]; then
        echo -e "${TEXT_RED_B} File Exists... ${TEXT_RESET}"
      else
        echo -e "${TEXT_PURPLE} File Not Exists. Downloading... ${TEXT_RESET}"
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        echo -e "${TEXT_CYAN} Downloading Complete  ${TEXT_RESET}"
      fi
        ;;

    2) 
      if [[ -e "google-chrome-stable_current_amd64.deb" ]]; then
        echo -e "${TEXT_PURPLE} File Exists. Installing... ${TEXT_RESET}"
        sudo apt install ./google-chrome-stable_current_amd64.deb;
      else
        echo -e "${TEXT_PURPLE} File Not Exists. Downloading... ${TEXT_RESET}"
          wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
          echo -e "${TEXT_CYAN} Downloading Complete ${TEXT_RESET}"

          echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
          sudo apt install ./google-chrome-stable_current_amd64.deb;
          echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"
        fi    
      ;;

    3)
      echo -e "${TEXT_PURPLE} Upgrading... ${TEXT_RESET}"
      sudo apt upgrade google-chrome-stable;
      echo -e "${TEXT_CYAN} Upgrading Done... ${TEXT_RESET}"
      ;;

    4) 
      echo -e "${TEXT_PURPLE} Uninstalling & Keep Configurations... ${TEXT_RESET}"
      sudo apt remove google-chrome-stable;
      ;;

    5)
      echo -e "${TEXT_PURPLE} Uninstalling & Do Not Keep Configurations... ${TEXT_RESET}"
      sudo apt --purge remove google-chrome-stable;
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}

dashToDockAction(){

echo -e "\n ${TEXT_GREEN} DASH TO DOCK SETTINGS.\n  Select 1 = Minize Enable,\n  2 = Minimize Reset,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in
    1) 
      echo -e "${TEXT_PURPLE} Enabling... ${TEXT_RESET}"
          gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
          echo  -e "${TEXT_CYAN} Enable Done... ${TEXT_RESET}"
      ;;
          
    2)
      echo -e "${TEXT_PURPLE} Reseting... ${TEXT_RESET}"
      	  gsettings reset org.gnome.shell.extensions.dash-to-dock click-action
      echo -e "${TEXT_CYAN} Reseting Done... ${TEXT_RESET}"
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}




actionTimeshift() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION Timeshift.\n  Select 1 = Install,\n  2 = Update,\n 3 = Uninstall & Keep Configurations,\n 4 = Uninstall & Don't Keep Configurations,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in
    1) 
      echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
          sudo apt install timeshift;
          echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"
      ;;
          
    2)
      echo -e "${TEXT_PURPLE} Upgrading... ${TEXT_RESET}"
      sudo apt upgrade timeshift;
      echo -e "${TEXT_CYAN} Upgrading Done... ${TEXT_RESET}"
      ;;

    3) 
      echo -e "${TEXT_PURPLE} Uninstalling & Keep Configurations... ${TEXT_RESET}"
      sudo apt remove timeshift;
      ;;

    4)
      echo -e "${TEXT_PURPLE} Uninstalling & Do Not Keep Configurations... ${TEXT_RESET}"
      sudo apt --purge remove timeshift;
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}


actionGuake() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION Guake.\n  Select 1 = Install,\n  2 = Update,\n 3 = Uninstall & Keep Configurations,\n 4 = Uninstall & Don't Keep Configurations,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in
    1) 
      echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
          sudo apt install guake;
          echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"
      ;;
          
    2)
      echo -e "${TEXT_PURPLE} Upgrading... ${TEXT_RESET}"
      sudo apt upgrade guake;
      echo -e "${TEXT_CYAN} Upgrading Done... ${TEXT_RESET}"
      ;;

    3) 
      echo -e "${TEXT_PURPLE} Uninstalling & Keep Configurations... ${TEXT_RESET}"
      sudo apt remove guake;
      ;;

    4)
      echo -e "${TEXT_PURPLE} Uninstalling & Do Not Keep Configurations... ${TEXT_RESET}"
      sudo apt --purge remove guake;
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}


actionVlc() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION VLC Media Player.\n  Select 1 = Install,\n  2 = Update,\n 3 = Uninstall & Keep Configurations,\n 4 = Uninstall & Don't Keep Configurations,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in
    1) 
      echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
          sudo apt install vlc;
          echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"
      ;;
          
    2)
      echo -e "${TEXT_PURPLE} Upgrading... ${TEXT_RESET}"
      sudo apt upgrade vlc;
      echo -e "${TEXT_CYAN} Upgrading Done... ${TEXT_RESET}"
      ;;

    3) 
      echo -e "${TEXT_PURPLE} Uninstalling & Keep Configurations... ${TEXT_RESET}"
      sudo apt remove vlc;
      ;;

    4)
      echo -e "${TEXT_PURPLE} Uninstalling & Do Not Keep Configurations... ${TEXT_RESET}"
      sudo apt --purge remove vlc;
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}


actionPhpStorm() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION PhpStorm.\n  Select 1 = Download Only,\n 2 = Download & Install,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in

    1)
      if [[ -e "PhpStorm-2023.2.3.tar.gz" ]]; then
        echo -e "${TEXT_RED_B} File Exists... ${TEXT_RESET}"
      else
        echo -e "${TEXT_PURPLE} File Not Exists. Downloading... ${TEXT_RESET}"
        wget https://download.jetbrains.com/webide/PhpStorm-2023.2.3.tar.gz
        echo -e "${TEXT_CYAN} Downloading Complete  ${TEXT_RESET}"
      fi
        ;;

    2) 
      if [[ -e "PhpStorm-2023.2.3.tar.gz" ]]; then
        echo -e "${TEXT_PURPLE} File Exists. Installing... ${TEXT_RESET}"
        sudo tar -xzf PhpStorm-*.tar.gz -C /opt
	      /opt/PhpStorm-*/bin/phpstorm.sh

      else
        echo -e "${TEXT_PURPLE} File Not Exists. Downloading... ${TEXT_RESET}"
          wget https://download.jetbrains.com/webide/PhpStorm-2023.2.3.tar.gz
          echo -e "${TEXT_CYAN} Downloading Complete ${TEXT_RESET}"

          echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
          sudo tar -xzf PhpStorm-*.tar.gz -C /opt
          /opt/PhpStorm-*/bin/phpstorm.sh

          echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"
        fi    
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}



actionZoom() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION Zoom.\n  Select 1 = Download Only,\n 2 = Download & Install,\n 3 = Update,\n 4 = Uninstall & Keep Configurations,\n 5 = Uninstall & Don't Keep Configurations,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in

    1)
      if [[ -e "zoom_amd64.deb" ]]; then
        echo -e "${TEXT_RED_B} File Exists... ${TEXT_RESET}"
      else
        echo -e "${TEXT_PURPLE} File Not Exists. Downloading... ${TEXT_RESET}"
        wget https://zoom.us/client/latest/zoom_amd64.deb
        echo -e "${TEXT_CYAN} Downloading Complete  ${TEXT_RESET}"
      fi
        ;;

    2) 
      if [[ -e "zoom_amd64.deb" ]]; then
        echo -e "${TEXT_PURPLE} File Exists. Installing... ${TEXT_RESET}"
        sudo apt install ./zoom_amd64.deb;
      else
        echo -e "${TEXT_PURPLE} File Not Exists. Downloading... ${TEXT_RESET}"
          wget https://zoom.us/client/latest/zoom_amd64.deb
          echo -e "${TEXT_CYAN} Downloading Complete ${TEXT_RESET}"

          echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
          sudo apt install ./zoom_amd64.deb;
          echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"
        fi    
      ;;

    3)
      echo -e "${TEXT_PURPLE} Upgrading... ${TEXT_RESET}"
      sudo apt upgrade zoom;
      echo -e "${TEXT_CYAN} Upgrading Done... ${TEXT_RESET}"
      ;;

    4) 
      echo -e "${TEXT_PURPLE} Uninstalling & Keep Configurations... ${TEXT_RESET}"
      sudo apt remove zoom;
      ;;

    5)
      echo -e "${TEXT_PURPLE} Uninstalling & Do Not Keep Configurations... ${TEXT_RESET}"
      sudo apt --purge remove zoom;
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}


actionViber() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION Viber.\n  Select 1 = Download Only,\n 2 = Download & Install,\n 3 = Update,\n 4 = Uninstall & Keep Configurations,\n 5 = Uninstall & Don't Keep Configurations,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in

    1)
      if [[ -e "viber.deb" ]]; then
        echo -e "${TEXT_RED_B} File Exists... ${TEXT_RESET}"
      else
        echo -e "${TEXT_PURPLE} File Not Exists. Downloading... ${TEXT_RESET}"
        wget https://download.cdn.viber.com/cdn/desktop/Linux/viber.deb
        echo -e "${TEXT_CYAN} Downloading Complete  ${TEXT_RESET}"
      fi
        ;;

    2) 
      if [[ -e "viber.deb" ]]; then
        echo -e "${TEXT_PURPLE} File Exists. Installing... ${TEXT_RESET}"
        sudo apt install ./viber.deb;
      else
        echo -e "${TEXT_PURPLE} File Not Exists. Downloading... ${TEXT_RESET}"
          wget https://download.cdn.viber.com/cdn/desktop/Linux/viber.deb
          echo -e "${TEXT_CYAN} Downloading Complete ${TEXT_RESET}"

          echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
          sudo apt install ./viber.deb;
          echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"
        fi    
      ;;

    3)
      echo -e "${TEXT_PURPLE} Upgrading... ${TEXT_RESET}"
      sudo apt upgrade viber;
      echo -e "${TEXT_CYAN} Upgrading Done... ${TEXT_RESET}"
      ;;

    4) 
      echo -e "${TEXT_PURPLE} Uninstalling & Keep Configurations... ${TEXT_RESET}"
      sudo apt remove viber;
      ;;

    5)
      echo -e "${TEXT_PURPLE} Uninstalling & Do Not Keep Configurations... ${TEXT_RESET}"
      sudo apt --purge remove viber;
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}



actionApache() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION Apache2.\n  Select 1 = Install,\n 2 = Uninstall,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in
    1) 
      echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
          sudo apt install apache2;
          echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"
      ;;
    
    2)
      echo -e "${TEXT_PURPLE} Uninstalling... ${TEXT_RESET}"
      sudo apt --purge remove apache2;
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}



actionNginx() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION Nginx.\n  Select 1 = Install,\n 2 = Uninstall,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in
    1) 
      echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
          sudo apt install nginx;
          echo  -e "${TEXT_CYAN} Installation Done & Check Nginx Status ... ${TEXT_RESET}"
          sudo systemctl status nginx;
      ;;
    
    2)
      echo -e "${TEXT_PURPLE} Uninstalling... ${TEXT_RESET}"
      sudo apt --purge remove nginx;
      sudo apt --purge remove nginx nginx-common;
      sudo apt autoclean;
      sudo apt autoremove;
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}



actionMySql() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION MySql.\n  Select 1 = Install,\n 2 = Uninstall,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in
    1) 
      echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
      sudo apt install mysql-server;
      echo -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"
      echo -e "${TEXT_CYAN} Status ${TEXT_RESET}"
      sudo service mysql status

      echo -e "${TEXT_CYAN} MySQL Version ${TEXT_RESET}"
      
      echo -e "${TEXT_CYAN} Login mysql using command: sudo mysql. ${TEXT_RESET}"
      echo -e "${TEXT_CYAN} mysql command: show databases;. ${TEXT_RESET}"
      echo -e "${TEXT_CYAN} mysql command: use mysql;. ${TEXT_RESET}"
      echo -e "${TEXT_CYAN} mysql command: select user, host, authentication_string, plugin from user;. ${TEXT_RESET}"
      echo -e "${TEXT_CYAN} mysql command: ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';. ${TEXT_RESET}"
      echo -e "${TEXT_CYAN} mysql command: exit. ${TEXT_RESET}"
      echo -e "${TEXT_CYAN} terminal command: mysql -u root -p;. ${TEXT_RESET}"
      
      
      
      mysql -V
      sleep 5
      ;;
    
    2)
      echo -e "${TEXT_PURPLE} Uninstalling... ${TEXT_RESET}"

      sudo apt --purge remove mysql-server*;

      #Remove MySQL configuration files
      sudo rm -rf /etc/mysql;

      #Remove database files need to be deleted manually.
      sudo rm -rf /var/lib/mysql;

      #If you have enabled logging for MySQL, make sure you delete the log files as well.
      sudo rm -r /var/log/mysql;
      sudo apt autoremove;
      sudo apt autoclean;
      echo -e "${TEXT_PURPLE} Uninstalling Done. ${TEXT_RESET}"
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}


actionMySqlSecure() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION MySql Secure.\n  Select 1 = Install,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in
    1) 
      echo -e "${TEXT_PURPLE} Installation Note ${TEXT_RESET}"
      
      echo -e "${TEXT_PURPLE} Enter Root Password : XXXX ${TEXT_RESET}"
      echo -e "${TEXT_PURPLE} VALIDATE PASSWORD COMPONENT : Y ${TEXT_RESET}"
      echo -e "${TEXT_PURPLE} Validation Lavels : 0=Local. 2=Production Env) ${TEXT_RESET}"
      echo -e "${TEXT_PURPLE} Estimated Strength of Password : 25=Local. 100=Production Env ${TEXT_RESET}"
      echo -e "${TEXT_PURPLE} Change the root Password : n=Local. Y=Production Env & Change strong password ${TEXT_RESET}"
      echo -e "${TEXT_PURPLE} Remove anonymous users : Y ${TEXT_RESET}"
      echo -e "${TEXT_PURPLE} Disallow root login remotely : Y ${TEXT_RESET}"
      echo -e "${TEXT_PURPLE} Remove test database and access to it? : Y ${TEXT_RESET}"
      echo -e "${TEXT_PURPLE} Reload privilege tables now? : Y ${TEXT_RESET}"
      echo -e "${TEXT_PURPLE} Done ${TEXT_RESET}"
      
      
      echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
          sudo mysql_secure_installation;
          echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}


actionPhpForNginx() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION PHP 7.4 with php7.4-fpm, php7.4-mysql, php7.4-curl & php7.4-xml extension for Nginx.\n  Select 1 = Install,\n 2 = Uninstall,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in
    1) 
      echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
      	  sudo add-apt-repository ppa:ondrej/php;
          sudo apt install php7.4-fpm php7.4-mysql php7.4-curl php7.4-xml;
          echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"
      ;;
    
    2)
      echo -e "${TEXT_PURPLE} Uninstalling... ${TEXT_RESET}"
      sudo apt --purge remove php*;
      sudo apt autoclean;
      sudo apt autoremove;
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}

actionGit() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION Git.\n  Select 1 = Install,\n 2 = Uninstall,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in
    1) 
      echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
          sudo apt install git;
          echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"
      ;;
    
    2)
      echo -e "${TEXT_PURPLE} Uninstalling... ${TEXT_RESET}"
      sudo apt --purge remove git;
      sudo apt autoclean;
      sudo apt autoremove;
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}


installVpn() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION VPN.\n  Select 1 = Install,\n 2 = Uninstall,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in
    1) 
      echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
	sudo add-apt-repository ppa:nm-l2tp/network-manager-l2tp
	sudo apt-get update
	sudo apt-get install network-manager-l2tp  network-manager-l2tp-gnome
          echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"
      ;;
    
    2)
      echo -e "${TEXT_PURPLE} Uninstalling... ${TEXT_RESET}"
      #sudo apt --purge remove git;
      #sudo apt autoclean;
      #sudo apt autoremove;
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}


installPwgen() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION PWGEN.\n  Select 1 = Install,\n 2 = Uninstall,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in
    1)
      echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
	    sudo apt install pwgen
      echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"

      echo  -e "${TEXT_CYAN} Generate a Sample 32 Characters Sample ... ${TEXT_RESET}"

      pwgen -s 32 1
      sleep 3
      ;;

    2)
      echo -e "${TEXT_PURPLE} Uninstalling... ${TEXT_RESET}"
      #sudo apt --purge remove git;
      #sudo apt autoclean;
      #sudo apt autoremove;
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}


installCurl() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION Curl.\n  Select 1 = Install,\n 2 = Uninstall,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in
    1)
      echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
          sudo apt install curl;
          echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"
      ;;

    2)
      echo -e "${TEXT_PURPLE} Uninstalling... ${TEXT_RESET}"
      sudo apt --purge remove curl;
      sudo apt autoclean;
      sudo apt autoremove;
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}

installWget() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION Wget.\n  Select 1 = Install,\n 2 = Uninstall,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in
    1)
      echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
          sudo apt install wget;
          echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"
      ;;

    2)
      echo -e "${TEXT_PURPLE} Uninstalling... ${TEXT_RESET}"
      sudo apt --purge remove wget;
      sudo apt autoclean;
      sudo apt autoremove;
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}

actionOhMyZsh() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION Oh My Zsh.\n  Select 1 = Install,\n 2 = Uninstall,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in
    1)
#      echo -e "${TEXT_PURPLE} Installing ZSH... ${TEXT_RESET}"
#          sudo apt install zsh;
#      echo  -e "${TEXT_CYAN} Installation ZSH Done... ${TEXT_RESET}"
#
#      echo  -e "${TEXT_CYAN} Checking ZSH Version... ${TEXT_RESET}"
#          zsh --version
#
#      echo  -e "${TEXT_CYAN} Making ZSH as a default shell... ${TEXT_RESET}"
#      echo -e "${TEXT_CYAN} Current shell: ${SHELL} ${TEXT_RESET}"
#          which zsh
#          chsh -s $(which zsh)
#      echo $SHELL
#      echo -e "${TEXT_CYAN} Current shell: ${SHELL} ${TEXT_RESET}"
#
#      echo  -e "${TEXT_CYAN} Installation Oh My Zsh... ${TEXT_RESET}"
#          sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
#      echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"







#      echo  -e "${TEXT_CYAN} Installation Syntax Highlighting Plugin... ${TEXT_RESET}"
#          git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#      echo  -e "${TEXT_CYAN} Installation Syntax Highlighting Plugin Done... ${TEXT_RESET}"
#
#      echo  -e "${TEXT_CYAN} Installation Auto Suggestion Plugin... ${TEXT_RESET}"
#          git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#      echo  -e "${TEXT_CYAN} Installation Auto Suggestion Plugin Done... ${TEXT_RESET}"
#
#      echo  -e "${TEXT_CYAN} Now open .zshrc file and update following line
#          plugins=(
#            # other plugins...
#            zsh-syntax-highlighting
#            zsh-autosuggestions
#            ) ${TEXT_RESET}"
#




      echo  -e "${TEXT_CYAN} Installation powerlevel10k theme... ${TEXT_RESET}"
          git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
      echo  -e "${TEXT_CYAN} Installation powerlevel10k theme done... ${TEXT_RESET}"

      echo  -e "${TEXT_CYAN} Now open .zshrc file and update following line
          ZSH_THEME=\"powerlevel10k/powerlevel10k\"
          ${TEXT_RESET}"

##          p10k configure

      echo  -e "${TEXT_CYAN} Installation Oh My Zsh Done... ${TEXT_RESET}"




#      echo  -e "${TEXT_CYAN} Logout & Apply Changes & Reload Command : (source ~/.zshrc) ... ${TEXT_RESET}"
#          sleep 5
#          gnome-session-quit



      echo  -e "${TEXT_CYAN} Apply Changes & Reload Done... ${TEXT_RESET}"
      ;;

    2)
      echo -e "${TEXT_PURPLE} Uninstalling Oh My Zsh... ${TEXT_RESET}"
#      uninstall oh_my_zsh;
      source ~/.oh-my-zsh/tools/uninstall.sh
      rm ~/.zshrc
      sudo apt autoclean;
      sudo apt autoremove;
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}


installTerminus() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION Terminus from snap .\n  Select 1 = Install,\n 2 = Uninstall,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in
    1)
      echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
          sudo snap install termius-app;
          echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"
      ;;

    2)
      echo -e "${TEXT_PURPLE} Uninstalling... ${TEXT_RESET}"
      sudo apt --purge remove curl;
      sudo apt autoclean;
      sudo apt autoremove;
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}

installComposer() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION Composer .\n  Select 1 = Install,\n 2 = Uninstall,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in
    1)
      echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
          php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
          php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
          php composer-setup.php
          php -r "unlink('composer-setup.php');"
          echo  -e "${TEXT_CYAN} Composer Moving to /usr/local/bin... ${TEXT_RESET}"
          sudo mv composer.phar /usr/local/bin/composer
      echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"
      ;;

    2)
      echo -e "${TEXT_PURPLE} Uninstalling... ${TEXT_RESET}"
#      sudo apt --purge remove curl;
#      sudo apt autoclean;
#      sudo apt autoremove;
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}

installJava() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION Java .\n  Select 1 = Install,\n 2 = Uninstall,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in
    1)
      echo -e "${TEXT_PURPLE} Check Java Version (java -version)... ${TEXT_RESET}"
      java -version

      echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
          sudo apt install default-jre;
      echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"

      echo -e "${TEXT_PURPLE} Check Java Version (java -version)... ${TEXT_RESET}"
            java -version
      ;;

    2)
      echo -e "${TEXT_PURPLE} Uninstalling... ${TEXT_RESET}"
#      sudo apt --purge remove curl;
#      sudo apt autoclean;
#      sudo apt autoremove;
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}

installJavaJdk() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION Java JDK .\n  Select 1 = Install,\n 2 = Uninstall,\n S = Skip\n ${TEXT_RESET}"
  read action
    case $action in
    1)
      echo -e "${TEXT_PURPLE} Check Java JDK Version (javac -version)... ${TEXT_RESET}"
      javac -version

      echo -e "${TEXT_PURPLE} Installing... ${TEXT_RESET}"
          sudo apt install default-jdk;
      echo  -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"

      echo -e "${TEXT_PURPLE} Check Java JDK Version (javac -version)... ${TEXT_RESET}"
            javac -version
      ;;

    2)
      echo -e "${TEXT_PURPLE} Uninstalling... ${TEXT_RESET}"
#      sudo apt --purge remove curl;
#      sudo apt autoclean;
#      sudo apt autoremove;
      ;;

    *)
      echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
      ;;

    esac
}

#RUN
update
upgrade
distUpgrade
autoRemove



while true
do
	echo -e "\n ${TEXT_CYAN} Press [CTRL+C] to stop... ${TEXT_RESET}"
	sleep 1


#RUN
actionChrome
dashToDockAction
actionTimeshift
actionGuake
actionVlc
actionPhpStorm
actionZoom
actionViber
actionApache
actionNginx
actionMySql
actionMySqlSecure
actionPhpForNginx
actionGit
#actionPhpmyadmin

installVpn
installPwgen
installCurl
installWget
actionOhMyZsh
installTerminus
installComposer
installJava
installJavaJdk











  if [ -f /var/run/reboot-required ]; then
      echo -e $TEXT_RED_B
      echo 'Reboot required!'
      echo 'Do you want to reboot now?'
      echo -e $TEXT_RESET
      select yn in "Yes" "No"; do
        case $yn in
          Yes ) 
            sudo reboot;
            break;;
          No ) break;;
        esac
      done
  fi

done

