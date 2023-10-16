#!/bin/bash

# Install yay
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
cd ..

# Configure hyprland
cat ./hypr/hyprland.conf >> ~/.config/hypr/hyprland.conf
# Install hyprpaper
yay -S hyprpaper
cp ./hypr/hyprpaper.conf ~/.config/hypr/

# Install waybar
yay -S waybar
cp -r ./waybar ~/.config/

# Install Firefox GNOME theme
curl -s -o- https://raw.githubusercontent.com/rafaelmardojai/firefox-gnome-theme/master/scripts/install-by-curl.sh | bash

# Configure VSCode
# mkdir -p ~/.config/Code\ -\ OSS/User
# cat ./vscode/settings.json >> ~/.config/Code\ -\ OSS/User/settings.json
# cat ./vscode/keybindings.json >> ~/.config/Code\ -\ OSS/User/keybindings.json

# code --install-extension usernamehw.errorlens
# code --install-extension vscodevim.vim
# code --install-extension PKief.material-icon-theme
# code --install-extension Catppuccin.catppuccin-vsc
# code --install-extension esbenp.prettier-vscode

# Install nwg-look for GTK dark theme
yay -S nwg-look

# Install discord-screenaudio
yay -S discord-screenaudio

echo "Installation complete!"
