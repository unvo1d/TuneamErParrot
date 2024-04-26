#!/bin/bash
################################################################################################





###############################################################################################
# SCRIPT PARA INSTALAR LAS COSAS A PARROT 
# primero upgradear todo
sudo parrot-upgrade


############ ahora deberiamos mirar si es compatible con el driver de nvidia, puesto que en teoria es para mi uso, se que si
############ pero si por lo que sea quiero hacerlo mas general, deberia agregar ese paso

#PLACE HOLDER






############ meter al final de /etc/modprobe.d/blacklist-nouveau.conf las lineas:

# blacklist nouveau
# options nouveau modeset=0
# alias nouveau off



############ ahora instalar drivers de nvidia

sudo apt update && sudo apt install nvidia-driver nvidia-smi -y

############ comprobacion de que todo esta bien 

nvidia-smi

########### deberiamos ahora reiniciar 

# REINICIO
# REINICIO


########### Instalacion de dependencias y  yakuake
fucking apt install yakuake build-essential git vim xcb libxcb-util0-dev \
libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev \
libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev -y



########## Instalando bspwm y sxhkd
mkdir ~/.config/{bspwm,sxhkd}
cd ~/Downloads
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
cd bspwm
make
please make install
cd examples/
cp bspwmrc ~/.config/bspwm/
cd ../../sxhkd
make
fucking make install
cd examples/background_shell/
cp sxhkdrc ~/.config/sxhkd/
cd ~/Downloads/
rm -rf bspwm/ sxhkd/
mkdir ~/.config/bspwm/scripts

############ Ahora hay que traducir el sxhkdrc porque el emulador del terminal no es una kitty
############ Lo suyo seria usar tr (lo digo yo no porque lo haya visto en ningun sitio)
# cambiar de urxvt -> kitty 
# /usr/bin/kitty seria la ruta absoluta
# Tambien hay que repasar los shortcuts
# quit/retart bspwm -> cambiar a super + shift
# close and kill -> cambiar a super + q
# focus the node in the given direction -> Left,Down,Up,Right 
# preselect the direction -> Left,Down,Up,Right
# cancel the preselection for the focused node -> super + ctrl + alt + space
# move/resize -> borrar hasta "move a floating window" 
# move a floating windows -> super + shift + {Left,Down,Up,Right}
# agragar # Custom Resize -> super + alt + {Left,Down,Up,Right}
#								$HOME/bspwm/scripts/bspwm_resize {west,south,north,east}

########### CREANDO ARCHIVO DE CUSTOM RESIZE
curl https://raw.githubusercontent.com/unvo1d/TuneamErParrot/main/bspwm_resize -o $HOME/bspwm/scripts/bspwm_resize
chmod +x $OME/bspwm/scripts/bspwm_resize

############ SIEMPRE QUE HAYAN CAMBIOS HAY QUE RINICIAR EL BSPWM 

########## Recordatorio de las apps de proton

echo -e "ACUERDATE DE INSTALAR LAS APPS DE PROTON\n"
sleep 3

########## Instalando discord para los labs de vulnlab

wget https://discord.com/api/download?platform=linux&format=deb
fucking dpkg -i discord-0.0.51.deb


