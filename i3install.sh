# Install Nala
sudo apt install -y nala

# Install essential applications
sudo nala install -y \
    timeshift \
    lf \
    thunar \
    firefox-esr \
    i3wm \
    i3blocks \
    rofi \
    htop \
    neovim \
    vim \
    git \
#    tlp \
#    tlp-rdw \
    redshift \
    xorg \
    xblacklight \
    xbindkeys \
    xvkbd \
    xinput \
    xorg-dev \
    python3-pip \
    intel-microcode \
    network-manager-gnome \
    xfce4-settings \
    xfce4-power-manager \
    kitty \
    pulseaudio \
    alsa-utils \
    pavucontrol \
    volumeicon-alsa \
    lxappearance \
    dialog \
    mtools \
    dosfstools \
    avahi-daemon \
    acpi \
    acpid \
    gvfs-backends \
    neofetch \
    htop \
    nitrogen \
    fonts-font-awesome \
    python3-i3ipc \
    xfce4-screenshooter \
    libreoffice \
    gimp \
    gparted \
    thunderbird \
    xdotool \
    xdo \
    hexchat \
    zathura \
    newsboat \
    cmus \
#todo
#1 setup redshift config creation
#2 pull configs for github and replace existing for i3, i3bar, redshift, lf,and others
#3setup script for if thinkpad install tlp tlp rdw and tp-smapi-dkms. from there create the file in /etc/default/tlp and enable tlp 
#Create folders in user directory (eg. Documents,Downloads,etc.)
xdg-user-dirs-update



# Dependencies for Ly Console Manager
sudo apt install -y libpam0g-dev libxcb-xkb-dev

# Install Ly Console Display Manager
cd 
cd Downloads
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly/
make
sudo make install installsystemd
sudo systemctl enable ly.service

# setup autotiling up using https://github.com/nwg-piotr/autotiling 
git clone https://github.com/nwg-piotr/autotiling
cd autotiling-master/autotiling
cp main.py autotiling
chmod +x autotiling
sudo cp autotiling /bin


# XSessions and i3.desktop
if [[ ! -d /usr/share/xsessions ]]; then
    sudo mkdir /usr/share/xsessions
fi

cat > ./temp << "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=i3
Comment=Dynamic window manager
Exec=i3
Icon=i3
Type=XSession
EOF
sudo cp ./temp /usr/share/xsessions/i3.desktop;rm ./temp


#setup charging thresholds on thinkpads
#sudo vim /etc/default/tlp
#START_CHARGE_THRESH_BAT0=75
#STOP_CHARGE_THRESH_BAT0=80
