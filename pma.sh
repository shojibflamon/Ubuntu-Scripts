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
    Yes)
      sudo apt update
      #sudo apt -qq update
      echo -e "${TEXT_GREEN} APT UPDATE FINISHED... ${TEXT_RESET}"
      break
      ;;
    No) break ;;
    esac
  done
}

upgrade() {
  echo -e "\n ${TEXT_GREEN} Command : sudo apt upgrade (UPGRADE PACKAGE) \n Do you wish to agree? ${TEXT_RESET}"
  select yn in "Yes" "No"; do
    case $yn in
    Yes)
      sudo apt upgrade
      echo -e "${TEXT_GREEN} APT UPGRADE FINISHED... ${TEXT_RESET}"
      break
      ;;
    No) break ;;
    esac
  done
}

distUpgrade() {
  echo -e "\n ${TEXT_GREEN} Command : sudo apt dist-upgrade (APT DISTRIBUTIVE UPGRADE : install or remove packages as necessary to complete the upgrade) \n Do you wish to agree? ${TEXT_RESET}"
  select yn in "Yes" "No"; do
    case $yn in
    Yes)
      sudo apt dist-upgrade
      echo -e "${TEXT_GREEN} APT DISTRIBUTIVE FINISHED... ${TEXT_RESET}"
      break
      ;;
    No) break ;;
    esac
  done
}

autoRemove() {
  echo -e "\n ${TEXT_GREEN} Command : sudo apt auto-remove (APT AUTO REMOVE) \n Do you wish to agree? ${TEXT_RESET}"
  select yn in "Yes" "No"; do
    case $yn in
    Yes)
      sudo apt autoremove
      echo -e "${TEXT_GREEN} APT AUTO REMOVE FINISHED... ${TEXT_RESET}"
      break
      ;;
    No) break ;;
    esac
  done
}

actionPhpmyadmin() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION Phpmyadmin.\n  Select 1 = Download Only,\n 2 = Download & Install,\n 3 = Uninstall & Keep Configurations,\n S = Skip\n ${TEXT_RESET}"
  read action
  case $action in

  \
    1)
    if ls phpMyAdmin-*.gz &>/dev/null; then
      echo -e "${TEXT_RED_B} File Exists... ${TEXT_RESET}"
    else
      echo -e "${TEXT_PURPLE} File Not Exists. Downloading... ${TEXT_RESET}"
      DATA="$(wget https://www.phpmyadmin.net/home_page/version.txt -q -O-)"
      URL="$(echo $DATA | cut -d ' ' -f 3)"
      VERSION="$(echo $DATA | cut -d ' ' -f 1)"
      wget https://files.phpmyadmin.net/phpMyAdmin/${VERSION}/phpMyAdmin-${VERSION}-english.tar.gz

      echo -e "${TEXT_CYAN} Downloading Complete  ${TEXT_RESET}"
    fi
    ;;

  2)
    if ls phpMyAdmin-*.gz &>/dev/null; then
      echo -e "${TEXT_PURPLE} File Exists. Installing... ${TEXT_RESET}"

      DATA="$(wget https://www.phpmyadmin.net/home_page/version.txt -q -O-)"
      URL="$(echo $DATA | cut -d ' ' -f 3)"
      VERSION="$(echo $DATA | cut -d ' ' -f 1)"

      echo -e "${TEXT_CYAN} Extract... ${TEXT_RESET}"
      tar -xf phpMyAdmin-${VERSION}-english.tar.gz
      #tar -xvf phpMyAdmin-${VERSION}-english.tar.gz
      # v= show the extract progress

      echo -e "${TEXT_CYAN} Move... ${TEXT_RESET}"
      sudo mv phpMyAdmin-*/ /var/www/html/db

      echo -e "${TEXT_CYAN} tmp directory create... ${TEXT_RESET}"
      sudo mkdir -p /var/www/html/db/tmp
      
      echo -e "${TEXT_CYAN} give permission to nginx (www:data:www-data) in tmp directory... ${TEXT_RESET}"
      sudo chown -R www-data:www-data tmp/

      echo -e "${TEXT_CYAN} config file configure... ${TEXT_RESET}"
      sudo cp /var/www/html/db/config.sample.inc.php /var/www/html/db/config.inc.php
      
      echo -e "${TEXT_CYAN} config file configure... ${TEXT_RESET}"
      sudo cp /var/www/html/db/config.sample.inc.php /var/www/html/db/config.inc.php
      
      echo -e "${TEXT_CYAN} Generating blowfish_secret using pwgen ${TEXT_RESET}"
      echo -e "${TEXT_CYAN} Generate a Sample 32 Characters Secred ... ${TEXT_RESET}"

      pwgen -s 32 1
      sleep 3
      
      echo -e "${TEXT_CYAN} Put this secret key in /var/www/html/db/config.inc.php (blowfish_secret) ... ${TEXT_RESET}"

      echo -e "${TEXT_CYAN} change ownership... ${TEXT_RESET}"
      sudo chown -R $USER:www-data /var/www/html/db/

      echo -e "${TEXT_CYAN} change permission... ${TEXT_RESET}"
      sudo find /var/www/html/db/ -type d -exec chmod 755 {} \;
      sudo find /var/www/html/db/ -type f -exec chmod 644 {} \;
      
      echo -e "${TEXT_CYAN} give full permission tmp directory so that phpmyadmin can access... ${TEXT_RESET}"
      sudo chown -R www-data:www-data tmp/

      echo -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"

      echo -e "\n ${TEXT_GREEN} Create User root...\n ${TEXT_RESET}"

      sudo mysql <<EOF
        SELECT user,authentication_string,plugin,host FROM mysql.user WHERE user = 'root';
        ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'XXXX';
        FLUSH PRIVILEGES;
        SELECT user,authentication_string,plugin,host FROM mysql.user WHERE user = 'root';
EOF

    else

      echo -e "${TEXT_PURPLE} File Not Exists. Downloading... ${TEXT_RESET}"
      DATA="$(wget https://www.phpmyadmin.net/home_page/version.txt -q -O-)"
      URL="$(echo $DATA | cut -d ' ' -f 3)"
      VERSION="$(echo $DATA | cut -d ' ' -f 1)"
      wget https://files.phpmyadmin.net/phpMyAdmin/${VERSION}/phpMyAdmin-${VERSION}-english.tar.gz
      echo -e "${TEXT_CYAN} Downloading Complete ${TEXT_RESET}"

      echo -e "${TEXT_CYAN} Extract... ${TEXT_RESET}"
      tar -xf phpMyAdmin-${VERSION}-english.tar.gz
      #tar -xvf phpMyAdmin-${VERSION}-english.tar.gz
      # v= show the extract progress

      echo -e "${TEXT_CYAN} Move... ${TEXT_RESET}"
      sudo mv phpMyAdmin-*/ /var/www/html/db

      echo -e "${TEXT_CYAN} tmp directory create... ${TEXT_RESET}"
      sudo mkdir -p /var/www/html/db/tmp

      echo -e "${TEXT_CYAN} give permission to nginx (www:data:www-data) in tmp directory... ${TEXT_RESET}"
      sudo chown -R www-data:www-data tmp/

      echo -e "${TEXT_CYAN} config file configure... ${TEXT_RESET}"
      sudo cp /var/www/html/db/config.sample.inc.php /var/www/html/db/config.inc.php
      
      echo -e "${TEXT_CYAN} Generating blowfish_secret using pwgen ${TEXT_RESET}"
      echo -e "${TEXT_CYAN} Generate a Sample 32 Characters Secred ... ${TEXT_RESET}"

      pwgen -s 32 1
      sleep 3
      
      echo -e "${TEXT_CYAN} Put this secret key in /var/www/html/db/config.inc.php (blowfish_secret) ... ${TEXT_RESET}"


      echo -e "${TEXT_CYAN} change ownership... ${TEXT_RESET}"
      sudo chown -R $USER:www-data /var/www/html/db/

      echo -e "${TEXT_CYAN} change permission... ${TEXT_RESET}"
      sudo find /var/www/html/db/ -type d -exec chmod 755 {} \;
      sudo find /var/www/html/db/ -type f -exec chmod 644 {} \;

      echo -e "${TEXT_CYAN} give full permission tmp directory so that phpmyadmin can access... ${TEXT_RESET}"
      sudo chown -R www-data:www-data tmp/

      echo -e "${TEXT_CYAN} Installation Done... ${TEXT_RESET}"
      echo -e "\n ${TEXT_GREEN} Create User root...\n ${TEXT_RESET}"

      sudo mysql <<EOF
        SELECT user,authentication_string,plugin,host FROM mysql.user WHERE user = 'root';
        ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'XXXX';
        FLUSH PRIVILEGES;
        SELECT user,authentication_string,plugin,host FROM mysql.user WHERE user = 'root';
EOF

    fi
    ;;

  3)
    echo -e "${TEXT_PURPLE} Uninstalling & Do Not Keep Configurations... ${TEXT_RESET}"
    sudo rm -rf /var/www/html/db
    ;;

  *)
    echo -e "${TEXT_PURPLE} Skipping... ${TEXT_RESET}"
    ;;

  esac
}

installPwgen() {
  echo -e "\n ${TEXT_GREEN} INSTALLATION PWGEN. It is needed for generating secret that is need to put in phpmyadmin config.inc.php file (blowfish_secret) \n  Select 1 = Install,\n 2 = Uninstall,\n S = Skip\n ${TEXT_RESET}"
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


#RUN
update
upgrade
distUpgrade
autoRemove

installPwgen
actionPhpmyadmin

