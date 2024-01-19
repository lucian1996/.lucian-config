
## Setup
##### configuration
- arch
- hyperland

##### aditional packages
- git
- vscode
- firefox
- thunar

## aftrer instalation

**_install yay_**
```
git clone https://aur.archlinux.org/yay-git.git
cd yay
makepkg -si
```

**_configure hyperland_**
```
cat ./hypr/hyprland.conf > ~/.config/hypr/hyprland.conf
cp ./hypr/hyprpaper.conf ~/.config/hypr/
```
**_install hyprpaper_**
```
yay -S hyprpaper
cp ./kitty ~/.config/
```

**_install waybar_**
```
yay pacman -S waybar
cp ./waybar ~/.config/
```

**_firefox-gnome-theme_**
```
awdcurl -s -o- https://raw.githubusercontent.com/rafaelmardojai/firefox-gnome-theme/master/scripts/install-by-curl.sh | bash
```

**_configure vscode_**
```
cat ./vscode/settings.json > ~/.config/Code - OSS/User/settings.json
cat ./vscode/keybindings.json > ~/.config/Code - OSS/User/keybindings.json
```

**_apply GTK dark theme_**
```
yay -S nwg-look
```

**_install discord-screenaudio_**
```
yay -S discord-screenaudio
```