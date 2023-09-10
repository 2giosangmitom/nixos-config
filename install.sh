#!/usr/bin/bash

gsettings set org.gnome.desktop.interface cursor-theme Sweet-cursors
gsettings set org.gnome.desktop.interface icon-theme Tela-dark
gsettings set org.gnome.desktop.interface gtk-theme Sweet-Dark-v40
gsettings set org.gnome.desktop.interface font-name 'Roboto 10'
gsettings set org.gnome.desktop.interface enable-animations true

sudo pacman -Sy waybar pipewire pipewire-pulse pavucontrol swaybg wofi lf neofetch lazygit fish dunst starship slurp grim gnome-keyring ttf-roboto ttf-jetbrains-mono-nerd --noconfirm --needed

cp -r starship.toml alacritty/ fish/ gtk-3.0/ lazygit/ lf/ neofetch/ sway/ waybar/ wofi/ dunst/ ~/.config/
cp -r .icons/ ~/
