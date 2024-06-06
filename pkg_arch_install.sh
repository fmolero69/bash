#!/bin/bash

# Función para instalar paquetes de Wayland
install_wayland() {
    echo "$(clear)"
    sudo pacman -S --needed wayland wayland-protocols libxkbcommon --noconfirm || exit 1
    # sudo pacman -S --needed xorg-server xorg-xinit xorg-twm xterm mesa-demos xf86-video-intel --noconfirm || exit 1
    # Agrega aquí más paquetes de Wayland si es necesario
}

# Función para instalar fuentes
install_fonts() {
    echo "$(clear)"
    font_packages="noto-fonts noto-fonts-emoji ttf-bitstream-vera ttf-dejavu ttf-droid ttf-roboto ttf-liberation ttf-ubuntu-font-family ttf-anonymous-pro gnu-free-fonts ttf-inconsolata ttf-hack ttf-font-awesome cantarell-fonts terminus-font ttf-opensans ttf-nerd-fonts-symbols-mono ttf-terminus-nerd"
    sudo pacman -S --needed $font_packages --noconfirm || exit 1
    # Agrega aquí más paquetes de fuentes si es necesario
}

install_audio() {
    echo "$(clear)"
    echo "Instalando audio..."
    echo ""
    sudo pacman -S --needed pipewire-alsa pipewire-audio pipewire-jack pipewire-pulse --noconfirm || exit 1
}

install_yay() {
    echo "$(clear)"
    sudo pacman -S --needed git wget --noconfirm || exit 1
    if ! command -v yay &> /dev/null; then
        echo "$(clear)"
        echo "Instalando yay..."
        git clone https://aur.archlinux.org/yay.git || exit 1
        cd yay || exit 1
        makepkg -si || exit 1
        cd .. && rm -rf yay
    else
        echo "yay ya está instalado"
    fi
}

# Función para instalar gestores de ventanas
install_wm() {
    echo "$(clear)"
    echo "Instalando window manager..."
    wm_packages="alacritty dunst nitrogen rofi qtile picom"
    sudo pacman -S --needed $wm_packages --noconfirm || exit 1
    echo "$(clear)"
    yay -S --needed qtile-extras --noconfirm || exit 1
    # Agrega aquí más gestores de ventanas si es necesario
}

# Función para instalar administradores de archivos
install_file_managers() {
    echo "$(clear)"
    echo "Instalando file manager..."
    file_manager_packages="thunar thunar-volman gvfs gvfs-mtp xarchiver unzip unrar p7zip xfce4-goodies xdg-user-dirs"
    sudo pacman -S --needed $file_manager_packages --noconfirm || exit 1
    echo $(clear) &&
    echo ""
    echo "instalado directorios de home"
    xdg-user-dirs-update && ls ~
    # Agrega aquí más administradores de archivos si es necesario
}

install_login() {
    echo "$(clear)"
    echo "Instalando display manager..."
    echo ""
    sudo pacman -S --needed lightdm-gtk-greeter lightdm-gyk-greeter-settings --noconfirm || exit 1
    echo "$(clear)"
    echo "Habilitando LightDM..."
    echo ""
    sudo systemctl enable lightdm.service || exit 1
}

install_office_tools() {
    echo "$(clear)"
    echo "Instalando herramientas de oficina..."
    office_tools="evince lxappearance grub-customizer viewnior"
    sudo pacman -S --needed $office_tools --noconfirm || exit 1#!/bin/bash

# Función para instalar paquetes de Wayland
install_wayland() {
    echo "$(clear)"
    sudo pacman -S --needed wayland wayland-protocols libxkbcommon --noconfirm || exit 1
    # sudo pacman -S --needed xorg-server xorg-xinit xorg-twm xterm mesa-demos xf86-video-intel --noconfirm || exit 1
    # Agrega aquí más paquetes de Wayland si es necesario
}

# Función para instalar fuentes
install_fonts() {
    echo "$(clear)"
    font_packages="noto-fonts noto-fonts-emoji ttf-bitstream-vera ttf-dejavu ttf-droid ttf-roboto ttf-liberation ttf-ubuntu-font-family ttf-anonymous-pro gnu-free-fonts ttf-inconsolata ttf-hack ttf-font-awesome cantarell-fonts terminus-font ttf-opensans ttf-nerd-fonts-symbols-mono ttf-terminus-nerd"
    sudo pacman -S --needed $font_packages --noconfirm || exit 1
    # Agrega aquí más paquetes de fuentes si es necesario
}

install_audio() {
    echo "$(clear)"
    echo "Instalando audio..."
    echo ""
    sudo pacman -S --needed pipewire-alsa pipewire-audio pipewire-jack pipewire-pulse --noconfirm || exit 1
}

install_yay() {
    echo "$(clear)"
    sudo pacman -S --needed git wget --noconfirm || exit 1
    if ! command -v yay &> /dev/null; then
        echo "$(clear)"
        echo "Instalando yay..."
        git clone https://aur.archlinux.org/yay.git || exit 1
        cd yay || exit 1
        makepkg -si || exit 1
        cd .. && rm -rf yay
    else
        echo "yay ya está instalado"
    fi
}

# Función para instalar gestores de ventanas
install_wm() {
    echo "$(clear)"
    echo "Instalando window manager..."
    wm_packages="alacritty dunst nitrogen rofi qtile picom"
    sudo pacman -S --needed $wm_packages --noconfirm || exit 1
    echo "$(clear)"
    yay -S --needed qtile-extras --noconfirm || exit 1
    # Agrega aquí más gestores de ventanas si es necesario
}

# Función para instalar administradores de archivos
install_file_managers() {
    echo "$(clear)"
    echo "Instalando file manager..."
    file_manager_packages="thunar thunar-volman gvfs gvfs-mtp xarchiver unzip unrar p7zip xfce4-goodies xdg-user-dirs"
    sudo pacman -S --needed $file_manager_packages --noconfirm || exit 1
    echo $(clear) &&
    echo ""
    echo "instalado directorios de home"
    xdg-user-dirs-update && ls ~
    # Agrega aquí más administradores de archivos si es necesario
}

install_login() {
    echo "$(clear)"
    echo "Instalando display manager..."
    echo ""
    sudo pacman -S --needed lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm || exit 1
    echo "$(clear)"
    echo "Habilitando LightDM..."
    echo ""
    sudo systemctl enable lightdm.service || exit 1
}

install_office_tools() {
    echo "$(clear)"
    echo "Instalando herramientas de oficina..."
    office_tools="evince lxappearance grub-customizer viewnior"
    sudo pacman -S --needed $office_tools --noconfirm || exit 1
    yay -S --needed onlyoffice-bin --noconfirm || exit 1
}

install_disk_tools() {
    echo "$(clear)"
    echo "Instalando herramientas de disco..."
    disk_tools="gparted dosfstools jfsutils f2fs-tools btrfs-progs exfatprogs ntfs-3g reiserfsprogs udftools xfsprogs nilfs-utils mtools"
    sudo pacman -S --needed $disk_tools --noconfirm || exit 1
}

# Menú principal
show_menu() {
    echo "$(clear)"
    echo "Selecciona una opción:"
    echo "1. Instalar Wayland"
    echo "2. Instalar fuentes"
    echo "3. Instalar audio"
    echo "4. Instalar yay"
    echo "5. Instalar gestores de ventanas"
    echo "6. Instalar administradores de archivos"
    echo "7. Instalar ges#!/bin/bash

# Función para instalar paquetes de Wayland
install_wayland() {
    echo "$(clear)"
    sudo pacman -S --needed wayland wayland-protocols libxkbcommon --noconfirm || exit 1 &&
    # sudo pacman -S --needed xorg-server xorg-xinit xorg-twm xterm mesa-demos xf86-video-intel --noconfirm || exit 1
    # Agrega aquí más paquetes de Wayland si es necesario
}

# Función para instalar fuentes
install_fonts() {
    echo "$(clear)"
    font_packages="noto-fonts noto-fonts-emoji ttf-bitstream-vera ttf-dejavu ttf-droid ttf-roboto ttf-liberation ttf-ubuntu-font-family ttf-anonymous-pro gnu-free-fonts ttf-inconsolata ttf-hack ttf-font-awesome cantarell-fonts terminus-font ttf-opensans ttf-nerd-fonts-symbols-mono ttf-terminus-nerd"
    sudo pacman -S --needed $font_packages --noconfirm || exit 1
    # Agrega aquí más paquetes de fuentes si es necesario
}

install_audio() {
    echo "$(clear)"
    echo "Instalando audio..."
    echo ""
    sudo pacman -S --needed pipewire-alsa pipewire-audio pipewire-jack pipewire-pulse --noconfirm || exit 1
}

install_yay() {
    echo "$(clear)"
    sudo pacman -S --needed git wget --noconfirm || exit 1
    if ! command -v yay &> /dev/null; then
        echo "$(clear)"
        echo "Instalando yay..."
        git clone https://aur.archlinux.org/yay.git || exit 1
        cd yay || exit 1
        makepkg -si || exit 1
        cd .. && rm -rf yay
    else
        echo "yay ya está instalado"
    fi
}

# Función para instalar gestores de ventanas
install_wm() {
    echo "$(clear)"
    echo "Instalando window manager..."
    wm_packages="alacritty dunst nitrogen rofi qtile picom"
    sudo pacman -S --needed $wm_packages --noconfirm || exit 1
    echo "$(clear)"
    yay -S --needed qtile-extras --noconfirm || exit 1
    # Agrega aquí más gestores de ventanas si es necesario
}

# Función para instalar administradores de archivos
install_file_managers() {
    echo "$(clear)"
    echo "Instalando file manager..."
    file_manager_packages="thunar thunar-volman gvfs gvfs-mtp xarchiver unzip unrar p7zip xfce4-goodies xdg-user-dirs"
    sudo pacman -S --needed $file_manager_packages --noconfirm || exit 1
    echo $(clear) &&
    echo ""
    echo "instalado directorios de home"
    xdg-user-dirs-update && ls ~
    # Agrega aquí más administradores de archivos si es necesario
}

install_login() {
    echo "$(clear)"
    echo "Instalando display manager..."
    echo ""
    sudo pacman -S --needed lightdm-gtk-greeter lightdm-gyk-greeter-settings --noconfirm || exit 1
    echo "$(clear)"
    echo "Habilitando LightDM..."
    echo ""
    sudo systemctl enable lightdm.service || exit 1
}

install_office_tools() {
    echo "$(clear)"
    echo "Instalando herramientas de oficina..."
    office_tools="evince firefox fire-i18n-es-mx lxappearance grub-customizer viewnior"
    sudo pacman -S --needed $office_tools --noconfirm || exit 1#!/bin/bash

# Función para instalar paquetes de Wayland
install_wayland() {
    echo "$(clear)"
    sudo pacman -S --needed wayland wayland-protocols libxkbcommon --noconfirm || exit 1 &&
    # sudo pacman -S --needed xorg-server xorg-xinit xorg-twm xterm mesa-demos xf86-video-intel --noconfirm || exit 1
    # Agrega aquí más paquetes de Wayland si es necesario
}

# Función para instalar fuentes
install_fonts() {
    echo "$(clear)"
    font_packages="noto-fonts noto-fonts-emoji ttf-bitstream-vera ttf-dejavu ttf-droid ttf-roboto ttf-liberation ttf-ubuntu-font-family ttf-anonymous-pro gnu-free-fonts ttf-inconsolata ttf-hack ttf-font-awesome cantarell-fonts terminus-font ttf-opensans ttf-nerd-fonts-symbols-mono ttf-terminus-nerd"
    sudo pacman -S --needed $font_packages --noconfirm || exit 1
    # Agrega aquí más paquetes de fuentes si es necesario
}

install_audio() {
    echo "$(clear)"
    echo "Instalando audio..."
    echo ""
    sudo pacman -S --needed pipewire-alsa pipewire-audio pipewire-jack pipewire-pulse --noconfirm || exit 1
}

install_yay() {
    echo "$(clear)"
    sudo pacman -S --needed git wget --noconfirm || exit 1
    if ! command -v yay &> /dev/null; then
        echo "$(clear)"
        echo "Instalando yay..."
        git clone https://aur.archlinux.org/yay.git || exit 1
        cd yay || exit 1
        makepkg -si || exit 1
        cd .. && rm -rf yay
    else
        echo "yay ya está instalado"
    fi
}

# Función para instalar gestores de ventanas
install_wm() {
    echo "$(clear)"
    echo "Instalando window manager..."
    wm_packages="alacritty dunst nitrogen rofi qtile picom"
    sudo pacman -S --needed $wm_packages --noconfirm || exit 1
    echo "$(clear)"
    yay -S --needed qtile-extras --noconfirm || exit 1
    # Agrega aquí más gestores de ventanas si es necesario
}

# Función para instalar administradores de archivos
install_file_managers() {
    echo "$(clear)"
    echo "Instalando file manager..."
    file_manager_packages="thunar thunar-volman gvfs gvfs-mtp xarchiver unzip unrar p7zip xfce4-goodies xdg-user-dirs"
    sudo pacman -S --needed $file_manager_packages --noconfirm || exit 1
    echo $(clear) &&
    echo ""
    echo "instalado directorios de home"
    xdg-user-dirs-update && ls ~
    # Agrega aquí más administradores de archivos si es necesario
}

install_login() {
    echo "$(clear)"
    echo "Instalando display manager..."
    echo ""
    sudo pacman -S --needed lightdm-gtk-greeter lightdm-gyk-greeter-settings --noconfirm || exit 1
    echo "$(clear)"
    echo "Habilitando LightDM..."
    echo ""
    sudo systemctl enable lightdm.service || exit 1
}

install_office_tools() {
    echo "$(clear)"
    echo "Instalando herramientas de oficina..."
    office_tools="evince lxappearance grub-customizer viewnior"
    sudo pacman -S --needed $office_tools --noconfirm || exit 1
    yay -S --needed onlyoffice-bin --noconfirm || exit 1
}

install_disk_tools() {
    echo "$(clear)"
    echo "Instalando herramientas de disco..."
    disk_tools="gparted dosfstools jfsutils f2fs-tools btrfs-progs exfatprogs ntfs-3g reiserfsprogs udftools xfsprogs nilfs-utils mtools"
    sudo pacman -S --needed $disk_tools --noconfirm || exit 1
}

# Menú principal
show_menu() {
    echo "$(clear)"
    echo "Selecciona una opción:"
    echo "1. Instalar Wayland"
    echo "2. Instalar fuentes"
    echo "3. Instalar audio"
    echo "4. Instalar yay"
    echo "5. Instalar gestores de ventanas"
    echo "6. Instalar administradores de archivos"
    echo "7. Instalar gestor de login"
    echo "8. Instalar herramientas de oficina"
    echo "9. Instalar herramientas de disco"
    echo "10. Instalar todo"
    echo "11. Salir"

    read -p "Ingresa tu opción: " option

    # Validar la entrada del usuario
    if ! [[ "$option" =~ ^[0-9]+$ ]]; then
        echo "Opción inválida"
        exit 1
    fi

    case $option in
        1) install_wayland ;;
        2) install_fonts ;;
        3) install_audio ;;
        4) install_yay ;;
        5) install_wm ;;
        6) install_file_managers ;;
        7) install_login ;;
        8) install_office_tools ;;
        9) install_disk_tools ;;
        10) install_wayland; install_fonts; install_audio; install_yay; install_wm; install_file_managers; install_login; install_office_tools; install_disk_tools ;;
        11) exit ;;
        *) echo "Opción inválida" ;;
    esac
}

# Mostrar el menú principal
while true; do
    show_menu
    read -p "Presiona Enter para continuar..."
done

    yay -S --needed onlyoffice-bin --noconfirm || exit 1
}

install_disk_tools() {
    echo "$(clear)"
    echo "Instalando herramientas de disco..."
    disk_tools="gparted dosfstools jfsutils f2fs-tools btrfs-progs exfatprogs ntfs-3g reiserfsprogs udftools xfsprogs nilfs-utils mtools"
    sudo pacman -S --needed $disk_tools --noconfirm || exit 1
}

# Menú principal
show_menu() {
    echo "$(clear)"
    echo "Selecciona una opción:"
    echo "1. Instalar Wayland"
    echo "2. Instalar fuentes"
    echo "3. Instalar audio"
    echo "4. Instalar yay"
    echo "5. Instalar gestores de ventanas"
    echo "6. Instalar administradores de archivos"
    echo "7. Instalar gestor de login"
    echo "8. Instalar herramientas de oficina"
    echo "9. Instalar herramientas de disco"
    echo "10. Instalar todo"
    echo "11. Salir"

    read -p "Ingresa tu opción: " option

    # Validar la entrada del usuario
    if ! [[ "$option" =~ ^[0-9]+$ ]]; then
        echo "Opción inválida"
        exit 1
    fi

    case $option in
        1) install_wayland ;;
        2) install_fonts ;;
        3) install_audio ;;
        4) install_yay ;;
        5) install_wm ;;
        6) install_file_managers ;;
        7) install_login ;;
        8) install_office_tools ;;
        9) install_disk_tools ;;
        10) install_wayland; install_fonts; install_audio; install_yay; install_wm; install_file_managers; install_login; install_office_tools; install_disk_tools ;;
        11) exit ;;
        *) echo "Opción inválida" ;;
    esac
}

# Mostrar el menú principal
while true; do
    show_menu
    read -p "Presiona Enter para continuar..."
done
tor de login"
    echo "8. Instalar herramientas de oficina"
    echo "9. Instalar herramientas de disco"
    echo "10. Instalar todo"
    echo "11. Salir"

    read -p "Ingresa tu opción: " option

    # Validar la entrada del usuario
    if ! [[ "$option" =~ ^[0-9]+$ ]]; then
        echo "Opción inválida"
        exit 1
    fi

    case $option in
        1) install_wayland ;;
        2) install_fonts ;;
        3) install_audio ;;
        4) install_yay ;;
        5) install_wm ;;
        6) install_file_managers ;;
        7) install_login ;;
        8) install_office_tools ;;
        9) install_disk_tools ;;
        10) install_wayland; install_fonts; install_audio; install_yay; install_wm; install_file_managers; install_login; install_office_tools; install_disk_tools ;;
        11) exit ;;
        *) echo "Opción inválida" ;;
    esac
}

# Mostrar el menú principal
while true; do
    show_menu
    read -p "Presiona Enter para continuar..."
done

    yay -S --needed onlyoffice-bin --noconfirm || exit 1
}

install_disk_tools() {
    echo "$(clear)"
    echo "Instalando herramientas de disco..."
    disk_tools="gparted dosfstools jfsutils f2fs-tools btrfs-progs exfatprogs ntfs-3g reiserfsprogs udftools xfsprogs nilfs-utils mtools"
    sudo pacman -S --needed $disk_tools --noconfirm || exit 1
}

# Menú principal
show_menu() {
    echo "$(clear)"
    echo "Selecciona una opción:"
    echo "1. Instalar Wayland"
    echo "2. Instalar fuentes"
    echo "3. Instalar audio"
    echo "4. Instalar yay"
    echo "5. Instalar gestores de ventanas"
    echo "6. Instalar administradores de archivos"
    echo "7. Instalar gestor de login"
    echo "8. Instalar herramientas de oficina"
    echo "9. Instalar herramientas de disco"
    echo "10. Instalar todo"
    echo "11. Salir"

    read -p "Ingresa tu opción: " option

    # Validar la entrada del usuario
    if ! [[ "$option" =~ ^[0-9]+$ ]]; then
        echo "Opción inválida"
        exit 1
    fi

    case $option in
        1) install_wayland ;;
        2) install_fonts ;;
        3) install_audio ;;
        4) install_yay ;;
        5) install_wm ;;
        6) install_file_managers ;;
        7) install_login ;;
        8) install_office_tools ;;
        9) install_disk_tools ;;
        10) install_wayland; install_fonts; install_audio; install_yay; install_wm; install_file_managers; install_login; install_office_tools; install_disk_tools ;;
        11) exit ;;
        *) echo "Opción inválida" ;;
    esac
}

# Mostrar el menú principal
while true; do
    show_menu
    read -p "Presiona Enter para continuar..."
done
