#!/bin/bash

# Function to exit in case of an error
exit_on_error() {
    echo "Error: $1"
    exit 1
}

echo "========================================"
echo " Starting Script Execution"
echo "========================================"

# Configure Userfiles 
echo "Configuring User Files..."
cp -rf ./hypr/* ~/.config/hypr/ || exit_on_error "Failed to copy hypr configuration"
# cp -rf ./Code/* ~/.config/Code/User || exit_on_error "Failed to copy Code configuration"
echo "User Files Configured."

# Remove unused themes
echo "Removing Unused Themes..."
find ~/.config -type f \( \
    -name '*Catppuccin-Latte*' -o \
    -name '*Material-Sakura*' -o \
    -name '*Graphite-Mono*' -o \
    -name '*Cyberpunk-Edge*' -o \
    -name '*Frosted-Glass*' -o \
    -name '*Gruvbox-Retro*' \) \
    -exec rm -rf {} + || exit_on_error "Failed to remove unused themes"
# Remove unused themes from theme.ctl
sed -i '/Catppuccin-Latte/d;/Material-Sakura/d;/Graphite-Mono/d;/Cyberpunk-Edge/d;/Frosted-Glass/d;/Gruvbox-Retro/d' ~/.config/hypr/theme.ctl || exit_on_error "Failed to edit theme.ctl"
echo "Unused Themes Removed."

# Install Custom Wallpapers
echo "Downloading Custom Wallpapers..."
cd ~/Pictures || exit_on_error "Failed to change directory to Pictures"
git clone https://github.com/lucian1996/lucian.wallpapers.git || exit_on_error "Failed to clone lucian.wallpapers"
echo "Custom Wallpapers Downloaded."

# Install Dev Dependencies
echo "Installing Development Dependencies..."
yay -S npm --noconfirm || exit_on_error "Failed to install npm"
yay -S python --noconfirm || exit_on_error "Failed to install python"
yay -S rust --noconfirm || exit_on_error "Failed to install rust"
yay -S cargo --noconfirm || exit_on_error "Failed to install cargo"
echo "Development Dependencies Installed."

# install and configure OBS Virtual Camera
echo "Configuring OBS Virtual Camera..."
yay -S v4l2loopback-dkms-git --noconfirm || exit_on_error "Failed to install v412loopback"
yay -S obs-git --noconfirm || exit_on_error "Failed to install obs-git"
yay -S obs-backgroundremoval --noconfirm || exit_on_error "Failed to install obs-backgroundremoval"
echo "OBS Virtual Camera Configured."

# Install NeoVim
echo "Installing NeoVim..."
yay -S neovim --noconfirm || exit_on_error "Failed to install neovim"
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 || exit_on_error "Failed to clone NvChad"
echo "NeoVim Installed."

# Install Default Applications
echo "Installing Default Applications..."
yay -S htop-git --noconfirm || exit_on_error "Failed to install htop-git"
yay -S vlc --noconfirm || exit_on_error "Failed to install vlc-git"
yay -S obsidian --noconfirm || exit_on_error "Failed to install obsidian"
yay -S discord --noconfirm || exit_on_error "Failed to install discord"
yay -S discord-screenaudio --noconfirm || exit_on_error "Failed to install discord-screenaudio"
yay -S libreoffice-still --noconfirm || exit_on_error "Failed to install libreoffice-still"
yay -S vulkan-radeon --noconfirm || exit_on_error "Failed to install vulkan-radeon"
yay -S lib32-vulkan-radeon --noconfirm || exit_on_error "Failed to install lib32-vulkan-radeon"
yay -S steam || exit_on_error --noconfirm "Failed to install steam" || exit_on_error "Failed to install Steam"
yay -S deluge || exit_on_error --noconfirm "Failed to install deluge" || exit_on_error "Failed to install Steam"
yay -S deluge-gtk || exit_on_error --noconfirm "Failed to install deluge-gtk" || exit_on_error "Failed to install Steam"
echo "Default Applications Installed."

# Install Xbox Controller Support
echo "Installing Xbox Controller Support..."
yay -S xpadneo-dkms || exit_on_error "Failed to install xpadneo"
echo "Xbox Controller Support Installed."

# Configure Security
echo "Configuring Security..."
sudo pacman -S ufw --noconfirm || exit_on_error "Failed to install ufw"
sudo ufw enable || exit_on_error "Failed to enable ufw"
sudo pacman -S clamav --noconfirm || exit_on_error "Failed to install ClamAV"
sudo freshclam || exit_on_error "Failed to update ClamAV database"
echo "Security Configured."

# Install and Configure Qemu Virtual Machine
echo "Installing and Configuring QEMU Virtual Machine..."
yay -S qemu-full qemu-arch-extra virt-manager dnsmasq bridge-utils ebtables iptables --noconfirm || exit_on_error "Failed to install QEMU and additional packages"
# Enable and start libvirtd service
sudo systemctl enable libvirtd.service || exit_on_error "Failed to enable libvirtd service"
sudo systemctl start libvirtd.service || exit_on_error "Failed to start libvirtd service"
# Add current user to libvirt and kvm groups
sudo usermod -aG libvirt,kvm $(whoami) || exit_on_error "Failed to add user to groups"
echo "QEMU Virtual Machine Installed and Configured."

# Install VSCode Extentions
echo "Installing VSCode Extensions..."
code --install-extension albert.TabOut || exit_on_error "Failed to install TabOut extension"
code --install-extension WallabyJs.console-ninja || exit_on_error "Failed to install console-ninja extension"
code --install-extension tamasfe.even-better-toml || exit_on_error "Failed to install even-better-toml extension"
code --install-extension usernamehw.errorlens || exit_on_error "Failed to install errorlens extension"
code --install-extension yay.lntoggle || exit_on_error "Failed to install lntoggle extension"
code --install-extension bradlc.vscode-tailwindcss || exit_on_error "Failed to install vscode-tailwindcss extension"
code --install-extension mhutchie.git-graph || exit_on_error "Failed to install git-graph extension"
code --install-extension bradlc.vscode-tailwindcss || exit_on_error "Failed to install vscode-tailwindcss extension"
echo "VSCode Extensions Installed."

# Finilize Setup
echo "Finalizing Setup..."
sudo timeshift --create --comments "Setup Complete" || exit_on_error "Failed to create a timeshift snapshot (Setup Complete)"
echo "Setup Complete. Timeshift Snapshot Created."

echo "========================================"
echo " Script Execution Finished Successfully"
echo "========================================"