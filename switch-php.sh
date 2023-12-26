#!/bin/bash

webServer=$1
version=$2

if [ "$webServer" == "nginx" ]; then
   if [ "$version" == "8.2" ]; then
      echo "* Switching CLI PHP to 8.2 ..."
      sudo update-alternatives --set php /usr/bin/php8.2 > /dev/null
      echo "* Switch to PHP 8.2 complete."

      echo "* Restart $webServer"
      sudo nginx -s reload
    elif [ "$version" == "7.4" ]; then
      echo "* Switching CLI PHP to 7.4 ..."
        sudo update-alternatives --set php /usr/bin/php7.4 > /dev/null
        echo "* Switch to PHP 7.4 complete."

        echo "* Restart $webServer"
        sudo nginx -s reload
    else
      echo "Nothing to switch to..."
    fi
elif [ "$webServer" == "apache" ]; then
  if [ "$version" == "8.2" ]; then
      echo "* Disabling Apache PHP 7.4 module ..."
      sudo a2dismod php7.4 > /dev/null

      echo "* Enabling Apache PHP 8.2 module ..."
      sudo a2enmod php8.2 > /dev/null

      echo "* Switching CLI PHP to 8.2 ..."
      sudo update-alternatives --set php /usr/bin/php8.2 > /dev/null
      echo "* Switch to PHP 8.2 complete."

      echo "* Restart $webServer"
      sudo systemctl restart apache2.service
  elif [ "$version" == "7.4" ]; then
    echo "* Disabling Apache PHP 8.2 module ..."
    sudo a2dismod php8.2 > /dev/null

    echo "* Enabling Apache PHP 7.4 module ..."
    sudo a2enmod php7.4 > /dev/null

    echo "* Switching CLI PHP to 7.4 ..."
    sudo update-alternatives --set php /usr/bin/php7.4 > /dev/null
    echo "* Switch to PHP 7.4 complete."

    echo "* Restart $webServer"
    sudo systemctl restart apache2.service
  else
      echo "Nothing to switch to..."
  fi
else
    echo "No Webserver selected..."
fi

echo "* PHP Version Now..."
sudo php -v
