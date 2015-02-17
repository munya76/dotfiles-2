#!/bin/bash

# Todo - xorg.conf, saml alle .config filer osv i samme mappe, så det hele kan automatiseres. Themes/icons. Delete ZOMBPONIES, fontawesome. Infinality. Saml alt på D-drev.

echo "Installerer RPMFusion"
sleep 5
cd ~/Downloads/
wget http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-21.noarch.rpm
wget http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-21.noarch.rpm
sudo rpm -i rpmfusion-free-release-21.noarch.rpm rpmfusion-nonfree-release-21.noarch.rpm
sudo dnf -y update

echo "Installerer Nvidia-driver"
sleep 5
sudo dnf -y install akmod-nvidia "kernel-devel-uname-r == $(uname -r)"
sudo dnf -y install xorg-x11-drv-nvidia.x86_64 xorg-x11-drv-nvidia-cuda.x86_64 xorg-x11-drv-nvidia-kmodsrc.x86_64 xorg-x11-drv-nvidia-libs.i686 xorg-x11-drv-nvidia-libs.x86_64 xorg-x11-drv-nvidia-libs.x86_64

echo "Fjerner linuxkernen + nvidia fra opdateringslisten"
sleep 5
sudo echo "exclude=kernel* *nvidia" >> /etc/yum.conf

#echo "Opdater hostname"
#sleep 5
#echo "Bragi" > /etc/hostname

echo "Installerer depedencies"
sleep 5
sudo dnf -y install icedtea-web p7zip zip unzip i3 xfce4-notifyd xfce4-volumed numlockx redshift nitrogen lxappearance file-roller scrot libXinerama-devel libXft-devel ruby ruby-ronn ruby-devel rubygem-ronn xcb-util-keysyms-devel pango-devel xcb-util-devel xcb-util-cursor-devel xcb-util-renderutil-devel xcb-util-wm-devel yajl-devel startup-notification-devel pcre-devel libev-devel cmake clang gcc-c++ xdotool xfce4-terminal xprop asciidoc libXcomposite-devel libXrandr-devel libconfig-devel dbus-devel lm_sensors firefox hexchat thunar thunar-archive-plugin thunar-volman vim zsh gtk-murrine-engine
sudo gem install --no-ri --no-rdoc wombat

echo "Installer i3gaps og accesories"
sleep 5
cd ~/Downloads/

git clone https://github.com/vivien/i3blocks.git
cd i3blocks/
sudo make clean
sudo make install

cd ~/Downloads/

git clone https://github.com/Airblader/i3.git
cd i3
make
sudo make install

cd ~/Downloads/

git clone https://github.com/enkore/j4-dmenu-desktop.git
cd j4-dmenu-desktop
cmake .
sudo make install

cd ~/Downloads/

wget https://bitbucket.org/melek/dmenu2/downloads/dmenu2-0.2.tar.gz
tar -xf dmenu2-0.2.tar.gz
cd dmenu2-0.2/
sudo make clean install

cd ~/Downloads/

git clone https://github.com/chjj/compton.git
cd compton
make
make docs
sudo make install

cd

cd .i3/scripts
sudo chmod +x *

cd

cd Bin
sudo chmod +x *

echo "Ordner fstab."
sleep 5
sudo mkdir /media/WinD
sudo echo "/dev/sdb1 /media/WinD ntfs-3g defaults 0 0" >> /etc/fstab

echo "Installerer Flash"
sleep 5
sudo rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
sudo dnf -y update
yum install flash-plugin nspluginwrapper alsa-plugins-pulseaudio libcurl

echo "Installerer Wine+OpenMW, fjerner bloatware."
sleep 5
sudo dnf -y install wine openmw xboxdrv
sudo dnf -y remove nautilus rhythmbox gedit evolution shotwell

echo "Installerer nu Dropbox. Kopier efterfølgende xorg.conf fra Dropbox til /etc/X11/xorg.conf. Installer efterfølgende infinality"

cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
/.dropbox-dist/dropboxd

echo "Færdig. Genstart efter dette."
