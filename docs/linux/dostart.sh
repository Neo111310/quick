#!/bin/bash

# Update System zuerst
sudo apt update && sudo apt upgrade -y

# Apt-Pakete
sudo apt install -y thunderbird keepassxc kleopatra code localsend-desktop telegram-desktop

# Element (Matrix-Client) via Snap (falls nicht im Repo)
sudo snap install element-desktop code bitwarden

echo "Installation abgeschlossen! Starte den Rechner neu, falls nötig."
