# Ubuntu Checkliste

## Software 

- Updates ausführen
    ``` sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y ```
- Software Installation 
    - Bitwarden
    - KeepassXC
    - LibrteWolf (Private Browser)
    - Thunderbird
    - Kleopatra
    - Visual Studio Code
    - Local Send
    - Telegram
    - Elemnt Desktop
    - Git
    - GUFW & UFW
    - Nextcloud Sync (Appimage)
    - Appimage Pool (Appimage) - Braucht Fuse
    - Cryptomator (Appimage)
    - Twingate
    - HexChat
    - OnionShare
    - TorBrowser
  - Optionele Software
     - Python
     - Reaper
     - GIMP
     - INKSCAPE
     - VLC
     - AudaCity
     - Kdenlive
     - FreeFileSync

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

Bearbeiten Sie 
```
sudo nano /etc/gdm3/greeter.dconf-defaults 
```
**[org/gnome/login-screen]**

``` text
disable-user-list=true
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

WIKI LINK https://github.com/AppImage/AppImageKit/wiki/FUSE

For example, on Ubuntu (>= 22.04):
```
sudo add-apt-repository universe
sudo apt install libfuse2
```
Warning: While libfuse2 is OK, do not install the fuse package as of 22.04 or you may break your system. If the fuse package did break your system, you can recover as described [here](https://github.com/orgs/AppImage/discussions/1339).

# Twingate

Supported distributions

The Twingate Linux Client currently supports the following Linux distributions for x86/AMD64 and ARM64-based devices:

    Ubuntu (22.04 LTS and 24.04 LTS)
    Debian (9 or later)
    Fedora (40 or later)
    CentOS (Stream 9 or later)
    Oracle Linux (8 or later)

Additionally, the following are supported for x64/AMD64-based devices:

    Arch Linux
    ThinPro
    NixOS
    Gentoo

Twingate may work with other Linux distributions; however, we are only actively testing distributions listed here. The Twingate Client relies on systemd and glibc, so distributions that include these packages are more likely to be compatible. Additionally, Twingate should work on upstreams of supported distributions (e.g. RHEL 10 is an upstream of Fedora 40 and the Client is known to work on it, but we do not test it).

A non-interative, headless mode is available for server, services, or container instances.
System Prerequisites

    The Linux Client requires either systemd-resolved service to be enabled/running or NetworkManager service to be configured and enabled/running as the client DNS service.
    A notification service is required for interactive user authentication. If a notification service is not available, the Client will provide instructions for receiving a console-based notification feed.

Installation and Setup
Installation

The following command will download and install the Linux Client on any supported Linux distribution.
```
curl -s https://binaries.twingate.com/client/linux/install.sh | sudo bash
```
GPG signing

Packages for systems that use apt, like Ubuntu and Debian, are signed with Twingate’s GPG key. The above script will automatically install and trust this key.

To install Twingate manually, read the manual installation instructions below.
Setup

Once installation completes, you need to configure the Linux Client by running the following command:
```
sudo twingate setup
```
Usage notes

We recommend that you start the Linux Client from a terminal window within a desktop environment so that you can respond to authentication notifications. The Linux Client does not have a graphical interface, and is operated with the basic CLI commands below.
Command	Description
sudo twingate setup	Interactively configure the Twingate Client.
- twingate start - Start the Twingate Client.
- twingate status - Output Twingate Client status.
- twingate stop - Stop the Twingate Client.
- twingate resources - Show available Resources for the authenticated user.
- twingate help - Show usage information.
User permissions when starting Twingate

It’s important that you start the Linux Client without elevated permissions—ie. twingate start—in order to receive desktop notifications required for authentication. Desktop notifications are using to alert the user when authentication is required to access protected Resources. Running sudo twingate start will result in these notifications being hidden from the logged in user.

Advanced CLI commands are also available depending on the configuration or usage needs.
Command	Description
```
sudo twingate config
```
To manually change a Client configuration setting, use twingate config [setting] [value] . Example settings that can be configured: network, autostart, save-auth-data, log-level
twingate desktop-start	Start desktop notifications for Twingate authentication requests.
/usr/bin/twingate-notifier console	Authenticate Twingate Client without desktop notifications. Note: Copy the URL returned and paste into a browser to authenticate the Twingate Client.

# Libre Wolf

https://librewolf.net/installation/debian/

We have a repository for Debian-based distributions (Debian, Ubuntu, Mint, etc.), with which you can easily install and update LibreWolf. To add it to your system and install LibreWolf, run the following commands one by one:

```
sudo apt update && sudo apt install extrepo -y
```
```
sudo extrepo enable librewolf && sudo extrepo update librewolf
```
```
sudo apt update && sudo apt install librewolf -y
```

# Tor Browser
Include in Repository  

``` sudo add-apt-repository ppa:micahflee/ppa```  
``` sudo apt update ```  
``` sudo apt install torbrowser-launcher ```  