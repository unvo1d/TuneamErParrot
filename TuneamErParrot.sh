#!/bin/bash
################################################################################################

# SCRIPT PARA INSTALAR LAS COSAS A PARROT 

# primero upgradear todo
sudo parrot-upgrade


# ahora deberiamos mirar si es compatible con el driver de nvidia, puesto que en teoria es para mi uso, se que si
# pero si por lo que sea quiero hacerlo mas general, deberia agregar ese paso


# meter al final de /etc/modprobe.d/blacklist-nouveau.conf las lineas:
#	blacklist nouveau
#	options nouveau modeset=0
#	alias nouveau off



# ahora instalar drivers de nvidia

sudo apt update && sudo apt install nvidia-driver nvidia-smi -y

# comprobacion de que todo esta bien 

nvidia-smi

# deberiamos ahora reiniciar 
###################### REINICIO
###################### REINICIO

fucking apt install build-essential git vim xcb libxcb-util0-dev \
libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev \
libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev -y

cd ~/Downloads
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git

cd bspwm
make
please make install

cd ../sxhkd
make
fucking make install
cd ..
rm -rf bspwm/ sxhkd/

# Probar si esto se puede sin cookies de inicio de sesion, sino hardcodear
curl https://hack4u.io/wp-content/uploads/2022/09/bspwm_resize.txt -o ../bspwm_resize.txt

echo -e "ACUERDATE DE INSTALAR LAS APPS DE PROTON\n"
sleep 10
