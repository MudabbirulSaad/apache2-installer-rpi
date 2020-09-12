#!/bin/bash

echo initializing system!
# Update process
sudo apt-get update

echo installing Apache!
# Install Apache2
sudo apt-get -y install apache2

echo installing PHP!
# Install php7.4
sudo apt -y install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt -y install php7.4

echo installing some importent PHP extensions!
# install php extensions
sudo apt-get install php7.4-mysql php7.4-bcmath php7.4-bz2 php7.4-intl php7.4-gd php7.4-mbstring php7.4-zip php7.4-apcu php7.4-uploadprogress php7.4-imagick php7.4-mcrypt php7.4-gettext

echo installing mysql-server latest!
# install mysql latest
wget https://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb
sudo dpkg -i mysql-apt-config*
sudo apt-get update
rm mysql-apt-config*
sudo apt-get install mysql-server
mysql_secure_installation

echo adding phpMyAdmin support!
# install phpmyadmin
sudo add-apt-repository -y ppa:nijel/phpmyadmin
sudo apt-get update
sudo apt-get -y install phpmyadmin
sudo phpenmod mcrypt
sudo phpenmod mbstring

echo installing certbot to generate trusted SSL!
# Installing certbot
sudo add-apt-repository ppa:certbot/certbot
apt-get update
sudo apt install python-certbot-apache

echo restarting installed services!
# Restarting Services
sudo systemctl restart apache2

echo final result:
# Finalizing Result
php -v
apachectl --version
mysql --version
php -r 'echo "\nWebserver has been installed in your system and working nicely.\n";'
