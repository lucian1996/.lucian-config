#!/bin/bash

# Function to exit in case of an error
exit_on_error() {
    echo "Error: $1"
    exit 1
}

echo "========================================"
echo " Starting Script Execution"
echo "========================================"

# Update System
echo "Updating System..."
sudo pacman -Syu --noconfirm || exit_on_error "System update failed"
echo "System Updated."

# Install and Backup with Timeshift
echo "Installing and Backing Up with Timeshift..."
sudo pacman -S timeshift --noconfirm || exit_on_error "Failed to install timeshift"
sudo timeshift --create --tags S --comments "System Init" || exit_on_error "Failed to create a timeshift snapshot (System Init)"
echo "Timeshift Installation and Backup Complete."

# Install Prasanthrangan Hyprdots
echo "Installing Prasanthrangan Hyprdots..."
cd ~/Desktop || exit_on_error "Failed to change directory to Desktop"
sudo pacman -S git || exit_on_error "Failed to install Git"
git clone https://github.com/prasanthrangan/hyprdots || exit_on_error "Failed to clone hyprdots"
cd ~/Hyprdots/Scripts || exit_on_error "Failed to change directory to Hyprdots/Scripts"
chmod u+x ./install.sh || exit_on_error "Failed to make install.sh executable"
./install.sh || exit_on_error "Hyprdots installation script failed"
echo "Prasanthrangan Hyprdots Installed."


echo "========================================"
echo " Script Execution Finished Successfully"
echo "========================================"