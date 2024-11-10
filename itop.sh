#!/bin/bash

# Limpio la pantalla y comienzo con el chisme

  clear

# Créditos, si los borras, te buscaré y te nalguearé

  echo " Guión creado por Proyectos Himmeros"
  echo " proceso de instalación y configuración de iTop "
  echo " se va a actualizar Linux y a instalar net-tools + mc + Webmin "
  sleep 3

# -------------------------------------------------------------------- #

## Pongo el prompt bonito ::

    echo export "PS1='\[\e[34m\]\u\[\e[m\]@\[\e[31m\]\h\[\e[m\]:\e[38;5;202m$(pwd):' " >> .bash_profile

## Corrigo la fecha ::

    timedatectl set-timezone America/Caracas

    echo " Actualizo ... "
    sleep 3

    sudo apt -y update
    sudo apt -y upgrade

## Instalo algunas herramientas

    sudo apt -y install mc curl wget openssh-server 

# -------------------------------------------------------------------- #

# Webmin

    echo ' Una vez instalado webmin se debe abrir el puerto 10000 para que acepte las conexiones . '
    sleep 3

    curl -o setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh
    sudo sh setup-repos.sh

    sudo apt-get -y install --install-recommends webmin



# Comienza la magia de la instalación de iTop

    sudo apt-get -y update
    
    sudo apt -y install curl wget dnf acl php-xml apache2 mariadb-server
    sudo apt -y install php php-mysql php-ldap php-cli php-soap php-json graphviz
    sudo apt -y install php-xml php-gd php-zip libapache2-mod-php php-mbstring php-curl php-imap php-apcu
   
    wget https://sourceforge.net/projects/itop/files/latest/download -O /tmp/itop.zip
    sudo unzip /tmp/itop.zip "web/*" -d /var/www/html/itop
    sudo mv /var/www/html/itop/web/*  /var/www/html/itop
    sudo rmdir /var/www/html/itop/web

    sudo setfacl -dR -m u:"www-data":rwX /var/www/html/itop/data /var/www/html/itop/log
    sudo setfacl -R -m u:"www-data":rwX /var/www/html/itop/data /var/www/html/itop/log
    sudo mkdir /var/www/html/itop/conf /var/www/html/itop/env-production /var/www/html/itop/env-production-build
    sudo chown www-data: /var/www/html/itop/conf /var/www/html/itop/env-production /var/www/html/itop/env-production-build