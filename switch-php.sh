#!/bin/bash


version=$1

if [ "$version" == "7.4" ]; then
  echo "* Disabling Apache PHP 8.2 module ..."
  sudo a2dismod php8.2 > /dev/null
elif [ "$version" == "8.2" ]; then
    echo "* Disabling Apache PHP 7.4 module ..."
      sudo a2dismod php7.4 > /dev/null

      echo "* Enabling Apache PHP 8.2 module ..."
      sudo a2enmod php8.2 > /dev/null

      echo "* Switching CLI PHP to 8.2 ..."
      sudo update-alternatives --set php /usr/bin/php8.2 > /dev/null

      echo "* Switch to PHP 8.2 complete."

      echo "* Restart apache"
      sudo systemctl restart apache2.service
else
  echo "Nothing to switch to..."
fi


