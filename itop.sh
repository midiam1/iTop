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
