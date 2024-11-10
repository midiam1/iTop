#!/bin/bash

# Limpio la pantalla y comienzo con el chisme

  clear

# Créditos, si los borras, te buscaré y te nalguearé

  echo " Guión creado por Proyectos Himmeros para Ra+"
  echo " proceso de instalación y configuración de iTop "
  echo " se va a actualizar Linux y a instalar net-tools + mc + Webmin "
  sleep 3

# -------------------------------------------------------------------- #

## Pongo el prompt bonito ::

    echo 'export PS1="\[\e[34m\]\u\[\e[m\]@\[\e[31m\]\h\[\e[m\]:\[\e[32m\]\w\[\e[m\] "' >> $HOME/.profile

## Corrigo la fecha ::

    timedatectl set-timezone America/Caracas

    echo " Actualizo ... "
    sleep 3

    sudo apt -y update
    sudo apt -y upgrade

## Instalo algunas herramientas

    sudo apt -y install net-tools mc

# -------------------------------------------------------------------- #

# Webmin
## Importante ::

    clear
    echo ' Instalo certificados para que la instalación de Webmin no arroje error '
    sudo apt install ca-certificates -y
    sleep 3

## Configuro los repositorios de webmin

    sudo apt -y install curl
    sudo curl -o setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh
    sudo sh setup-repos.sh

## Instalo Webmin

    sudo apt -y install --install-recommends webmin
    echo ' Una vez instalado webmin se debe abrir el puerto 10000 para que acepte las conexiones . '
    sleep 3

## Instalación de Apache
    echo "Instalación de Apache y php 7.4"
    sleep 3
    sudo apt -y install apache2
    sudo apt -y install libapache2-mod-php7.4
    sudo apt-get -y install php-curl

# Comienza la magia de la instalación de iTop

    sudo apt-get -y update
    sudo apt-get -y install apache2 mariadb-server php7.4 php7.4-mysql php7.4-ldap php7.4-cli php7.4-soap php7.4-json graphviz php7.4-xml php7.4-gd php7.4-zip php7.4-fpm php7.4-mbstring acl
    cd
    wget https://sourceforge.net/projects/itop/files/latest/download -O /tmp/itop.zip
    sudo unzip /tmp/itop.zip "web/*" -d /var/www/html/itop
    sudo mv /var/www/html/itop/web/*  /var/www/html/itop
    sudo rmdir /var/www/html/itop/web

    sudo setfacl -dR -m u:"www-data":rwX /var/www/html/itop/data /var/www/html/itop/log
    sudo setfacl -R -m u:"www-data":rwX /var/www/html/itop/data /var/www/html/itop/log
    sudo mkdir /var/www/html/itop/conf /var/www/html/itop/env-production /var/www/html/itop/env-production-build
    sudo chown www-data: /var/www/html/itop/conf /var/www/html/itop/env-production /var/www/html/itop/env-production-build