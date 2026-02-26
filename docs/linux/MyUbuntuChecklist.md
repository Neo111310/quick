# Ubuntu Checkliste

## Software 

- Updates ausführen
    ``` sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y ```
- Software Installation 
    - Bitwarden
    - KeepassXC
    - Thunderbird
    - Kleopatra
    - Visual Studio Code
    - Local Send
    - Telegram
    - Elemnt Desktop
    - Git
    - Nextcloud Sync (Appimage)
    - Appimage Pool (Appimage)
    - Cryptomator (Appimage)

### Das Script

``` bash
#!/bin/bash

# Update System zuerst
sudo apt update && sudo apt upgrade -y

# Apt-Pakete
sudo apt install -y thunderbird keepassxc kleopatra code localsend-desktop telegram-desktop

# Element (Matrix-Client) via Snap (falls nicht im Repo)
sudo snap install element-desktop code bitwarden

echo "Installation abgeschlossen! Starte den Rechner neu, falls nötig."

```

## System Einstellungen

### Login ohne Vorschlag

Für GDM (neuere Ubuntu-Versionen wie 22.04+)

Bearbeiten Sie /etc/gdm3/custom.conf (oder /usr/share/lightdm/lightdm.conf.d/ falls vorhanden) mit sudo und aktivieren Sie unter [daemon] die Option DisableUserList=true. Beispiel:

``` text
[daemon]
DisableUserList=true
```

Führen Sie danach ```sudo systemctl restart gdm ``` aus. Dadurch erscheint nur noch ein manuelles Eingabefeld ohne Benutzer-Vorschläge.