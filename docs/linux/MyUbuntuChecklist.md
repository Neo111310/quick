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
    - Appimage Pool (Appimage) - Braucht Fuse
    - Cryptomator (Appimage)
  - Optionele Software
     - Python

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

Bearbeiten Sie /etc/gdm3/greeter-dconf-defaults 

``` text
[org/gnome/login-screen]
DisableUserList=true
banner-message-enable=true
banner-message-text='Welcome to the Matrix\nNeo Follow the white Rabbit'
```

Führen Sie danach ```sudo systemctl restart gdm ``` aus. Dadurch erscheint nur noch ein manuelles Eingabefeld ohne Benutzer-Vorschläge.


## Bitwarden SSh Agent Enable Ubuntu

ssh Agent Test
``` Plain Text
ssh-add -L
```
 ### Enable Agent

1 Enable the Bitwarden SSH Agent on Linux:  
    Configure the SSH_AUTH_SOCK variable to point to the Bitwarden SSH Agent socket. The following example demonstrates how to do this after replacing <user> with your username:
    ``` Plain Text
    export SSH_AUTH_SOCK=/home/<user>/.bitwarden-ssh-agent.sock
    ```

### Shell configuration
1 Access your .bashrc or .zshrc file:  
    ``` Plain Text
    nano ~/.bashrc
    nano ~/.zshrc
    ```
2 Set the environment variable in the .bashrc or .zshrc file:  
    ``` Plain Text
    export SSH_AUTH_SOCK=/home/<user>/.bitwarden-ssh-agent.sock
    ```
### Snap and Flatpak
Enable the Bitwarden SSH Agent on snap or Flatpak installations:

1 Configure the ```SSH_AUTH_SOCK``` variable to point to the Bitwarden SSH Agent socket. The following example demonstrates how to do this after replacing ```<user>``` with your username:

``` Plain Text
# Snap
export SSH_AUTH_SOCK=/home/<user>/snap/bitwarden/current/.bitwarden-ssh-agent.sock

# Flatpak
export SSH_AUTH_SOCK=/home/<user>/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock
```

# Fuse für Appimage 

FUSE (Filesystem in Userspace) lässt sich auf Ubuntu einfach über das Paketmanagement installieren. Es ermöglicht Benutzern, eigene Dateisysteme ohne Kernel-Änderungen zu mounten. [arisonglife.tistory](https://arisonglife.tistory.com/entry/Install-FUSEFilesystem-in-Userspace-on-Ubuntu)

## Installation
Führe im Terminal diese Befehle aus:
```bash
sudo apt update
sudo apt install fuse
```
Das installiert das Basis-FUSE-Paket inklusive libfuse und fusermount. [arisonglife.tistory](https://arisonglife.tistory.com/entry/Install-FUSEFilesystem-in-Userspace-on-Ubuntu)

## Benutzer zur Gruppe hinzufügen
Damit du als Normalnutzer mounten kannst:
```bash
sudo usermod -aG fuse $USER
```
Danach **ausloggen und neu einloggen** (oder `newgrp fuse`). [arisonglife.tistory](https://arisonglife.tistory.com/entry/Install-FUSEFilesystem-in-Userspace-on-Ubuntu)

## Nach der Installation
- Prüfe mit `fusermount -V`.
- Für spezielle FUSE-Tools (z. B. sshfs): `sudo apt install sshfs`.
- Konfiguriere optional `/etc/fuse.conf` (z. B. `user_allow_other` für andere User freigeben). [wiki.ubuntuusers](https://wiki.ubuntuusers.de/FUSE/)