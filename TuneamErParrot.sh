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
# 2 opciones, modificando el systemd o un crontab para @reboot y que cree un archivo como flag, si elarchivo existe continua desde 1 punto y si no desde el inicio
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
cp sxhkdrc ~/.config/sxhkd/
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/sxhkd/sxhkdrc
cd ../../sxhkd
make
fucking make install
cd ~/Downloads/
rm -rf bspwm/ sxhkd/
mkdir ~/.config/bspwm/scripts







############ Ahora hay que traducir el sxhkdrc porque el emulador del terminal no es una kitty
############ Lo suyo seria usar tr (lo digo yo no porque lo haya visto en ningun sitio)
# cambiar de urxvt -> kitty 
# /opt/kitty/bin/kitty seria la ruta absoluta
# Tambien hay que repasar los shortcuts
# quit/retart bspwm -> cambiar a super + shift
# close and kill -> cambiar a super + q
# focus the node in the given direction -> Left,Down,Up,Right 
# preselect the direction -> Left,Down,Up,Right
# cancel the preselection for the focused node -> super + ctrl + alt + space
# move/resize -> borrar hasta "move a floating window" 
# move a floating windows -> super + shift + {Left,Down,Up,Right}
# program launcher cambiar a super + d y en vez de dmenu_run -> /usr/bin/rofi -show run
# agragar # Custom Resize -> super + alt + {Left,Down,Up,Right}
#								$HOME/.config/bspwm/scripts/bspwm_resize {west,south,north,east}

########### CREANDO ARCHIVO DE CUSTOM RESIZE
curl https://raw.githubusercontent.com/unvo1d/TuneamErParrot/main/bspwm_resize -o $HOME/.config/bspwm/scripts/bspwm_resize
chmod +x $OME/.config/bspwm/scripts/bspwm_resize

############ SIEMPRE QUE HAYAN CAMBIOS HAY QUE RINICIAR EL BSPWM 

########## Recordatorio de las apps de proton

echo -e "ACUERDATE DE INSTALAR LAS APPS DE PROTON\n"
sleep 3

############ Instalando discord para los labs de vulnlab

wget https://discord.com/api/download?platform=linux&format=deb
fucking dpkg -i discord-0.0.51.deb
rm discord-0.0.51.deb




########### Instalando la Polybar

fucking apt install polybar -y



########### Instalando rofi 

please apt install rofi -y



########## Instalando Picom
# de https://github.com/yshui/picom

fucking apt install libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev libxext-dev meson ninja-build uthash-dev -y

git clone https://github.com/yshui/picom
cd picom/
meson setup --buildtype=release build
ninja -C build
ninja -C build install



########## Instalando fuentes

cd /usr/local/share/fonts

echo -e "Mete las hack nerd fonts de nerdfonts.com\n"
echo -e "Pulsa una tecla para continuar...\n"
read 

##fucking curl https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip -o Hack.zip
# ESTO NO FUNCIONA, MIRAR BIEN COMO DESCARGARLO

######### Instalando zsh 

fucking apt install -y zsh
# Opcion 0 al iniciar

######### Instalando kitty
######### Hay que descargarlo de https://github.com/kovidgoyal/kitty/releases/download/v0.34.1/kitty-0.34.1-x86_64.txz
######### Ver como automatizar que se descargue siempre la ultima version
######### mover a /opt/
######### sudo mkdir /opt/kitty  
######### mv /opt/kitty-xxxxx-xxxx.x.x.x /opt/kitty/
######### cd /opt/kitty 
######### 7z x kitty-xxx.xxx.xx
######### sudo tar -xf kitty-xxx.xx.xx
######### fucking rm kitty-xx.x.x.xx

curl https://raw.githubusercontent.com/unvo1d/TuneamErParrot/main/color.ini -o $HOME/.config/kitty/color.ini
curl https://raw.githubusercontent.com/unvo1d/TuneamErParrot/main/kitty.conf -o $HOME/.config/kitty/kitty.conf

######### no se pa que carajo es, tratamiento de imagenes dice

sudo apt install imagemagick -y


######### feh que es un visor de imagenes asi ligerito y to wapo

fucking apt install feh -y 
mkdir $HOME/fondos


######## DESCARGAR ALGUN FONDO POTENTE Y METERLO EN $HOME/fondos con el nombre de fondo1.extension a ser posible
######### Agregar al bspwmrc la siguiente linea al final

#echo '/usr/bin/feh --bg-fill $HOME/fondos/fondoAElegir.extension' >> $HOME/.config/bspwm/bspwmrc
 
######## DESPLIEGUE DE POLYBAR

cd ~/Downloads/
git clone https://github.com/VaughnValle/blue-sky.git
cd blue-sky/polybar
cp -r * $HOME/.config/polybar
echo '$HOME/.config/polybar/./launch.sh &' >> ~/.config/bspwm/bspwmrc
cd fonts
sudo cp * /usr/share/fonts/truetype
sudo fc-cache -v


###########    Picom



mkdir ~/.config/picom
cd ~/.config/picom
curl https://raw.githubusercontent.com/unvo1d/TuneamErParrot/main/picom.conf -o picom.conf
echo '/usr/local/bin/picom &' >> ~/.config/bspwm/bspwmrc


######### OPCIONAL PARA BORDER DE VENTANAS 

#echo 'bspc config border_width 0' >> ~/.config/bspwm/bspwmrc


########### ZSH y Powerlevel10k


sudo apt install zsh-autocomplete zsh-autosuggestions zsh-syntax-highlighting


######## Cambiar las shells por defecto del usuario y root

sudo usermod --shell /usr/bin/zsh root
sudo usermod --shell /usr/bin/zsh $USER

######## Instalando powerlevel10k
##### instrucciones del repo https://github.com/romkatv/powerlevel10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
## ^ ^ ^ ^ ^ ^ ^ ^ ^ PONER RUTA ABSOLUTA PARA QUE EL LINK SIMBOLICO LUEGO NO PETE 

########### CONFIGURACION P10K 
# si no usar p10k configure

# Ubicacion de archivo de conf de p10k $HOME/.p10k.zsh
# CONFIGURAR EL ARCHIVO P10K AL GUSTO, LO STANDARD ES COMENTAR TODO LO DE RIGHT PROMP, PERO DEBERIA HACERLO A MI GUSTO
# Y SUBIRLO AL GIT
# en la parte de left, agregamos context, command_execution_time y status en ese orden
# poner DIR_ANCHOR en false
# Hay que hacer el mismo procedimiento de instalar segun las instrucciones del repo como usuario root,

#aplicar link simbolico al a zshrc de root para que apunte a la del usuario 

ln -s -f /home/unv0id/.zshrc /root/.zshrc 

chown root:root /usr/local/share/zsh/site-functions/_bspc

## SUBIR EL .ZSHRC porque lo hemos modificado bastante,
# EJEMPLO DE OCMO PONER UN PLUGIN PARA QUE SE AUTOINICIE EN ZSHRC
# ZSH Syntax Highlighting Plugin
# if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
#     source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# fi

# PLUGINS INSTALADOS : 
# autosuggestion
# autocomplete
# sudo ( wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh )  
# syntax highlighting 

# File History 
# Agregar un historial poniendo esto 
# HISTFILE=~/.zsh_history
# HISTSIZE=10000
# SAVEHIST=10000
# setopt histignorealldups sharehistory # para que puedas hacer echo '' > ~/.zsh_history y limpiar el historial

# Agregar el autocompletado este para mancos del pastebin https://pastebin.com/raw/H87J3nMj


################ AGREGAR BATCAT Y LSD


#### BATCAT 

cd ~
### Ultima release bat_ x.xx.x_amd64.deb de https://github.com/sharkdp/bat

# sudo dpkg -i archivodescargado
#### LSD 

## ultima release de https://github.com/lsd-rs/lsd
# sudo dpkg -i archivodescargado

echo $LS_COLORS | sed 's/=01;/=/g' # Para quitar los 01 del ls_colors que hace que se vean algunas cosas en engrita y no se vea bien

# Meter en la zshrc esto
# export LS_COLORS="rs=0:di=34:ln=36:mh=00:pi=40;33:so=35:do=35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=32:*.tar=31:*.tgz=31:*.arc=31:*.arj=31:*.taz=31:*.lha=31:*.lz4=31:*.lzh=31:*.lzma=31:*.tlz=31:*.txz=31:*.tzo=31:*.t7z=31:*.zip=31:*.z=31:*.dz=31:*.gz=31:*.lrz=31:*.lz=31:*.lzo=31:*.xz=31:*.zst=31:*.tzst=31:*.bz2=31:*.bz=31:*.tbz=31:*.tbz2=31:*.tz=31:*.deb=31:*.rpm=31:*.jar=31:*.war=31:*.ear=31:*.sar=31:*.rar=31:*.alz=31:*.ace=31:*.zoo=31:*.cpio=31:*.7z=31:*.rz=31:*.cab=31:*.wim=31:*.swm=31:*.dwm=31:*.esd=31:*.avif=35:*.jpg=35:*.jpeg=35:*.mjpg=35:*.mjpeg=35:*.gif=35:*.bmp=35:*.pbm=35:*.pgm=35:*.ppm=35:*.tga=35:*.xbm=35:*.xpm=35:*.tif=35:*.tiff=35:*.png=35:*.svg=35:*.svgz=35:*.mng=35:*.pcx=35:*.mov=35:*.mpg=35:*.mpeg=35:*.m2v=35:*.mkv=35:*.webm=35:*.webp=35:*.ogm=35:*.mp4=35:*.m4v=35:*.mp4v=35:*.vob=35:*.qt=35:*.nuv=35:*.wmv=35:*.asf=35:*.rm=35:*.rmvb=35:*.flc=35:*.avi=35:*.fli=35:*.flv=35:*.gl=35:*.dl=35:*.xcf=35:*.xwd=35:*.yuv=35:*.cgm=35:*.emf=35:*.ogv=35:*.ogx=35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.swp=00;90:*.tmp=00;90:*.dpkg-dist=00;90:*.dpkg-old=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:"


# para arreglar el burp desde rofi hay que decargarse el burpsuite-launcher de mi github y meterlo en /usr/bin 
# de esta manera cuando abramos rofi, lanzamos burpsuite-launcher en vez de burpsuite

################## POLYBAR


# Hay que toquetear el .config/polybar/current.ini, bajar del github
# tambien hay que toquetear el .config/polybar/launch.sh bajar del github
# Los scripts customs se van a guardar en $HOME/.config/polybar/scripts 

