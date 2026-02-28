# Server Neu Aufsetzen

## Deckel Schliesen

Um zu verhindern, dass Ihr Notebook mit Ubuntu Server 25.10 (oder neuer) beim Schließen des Deckels ausschaltet oder in den Ruhezustand geht, bearbeiten Sie die systemd-Konfigurationsdatei. Das ist besonders bei Server-Nutzung wichtig, da der Laptop sonst unzugänglich wird. [de.linux-terminal](https://de.linux-terminal.com/?p=6750)

## Konfigurationsdatei bearbeiten
Öffnen Sie die Datei als Root:
```
sudo nano /etc/systemd/logind.conf
```
Entkommentieren Sie (entfernen Sie das `#`) und setzen Sie folgende Zeilen auf `ignore`:
```
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
```
Optional: `LidSwitchIgnoreInhibited=yes` auf `no` setzen. [youtube](https://www.youtube.com/watch?v=px5-4iaTKgQ)

## Änderungen aktivieren
Speichern Sie die Datei (Strg+O, Enter, Strg+X in nano) und starten Sie den Dienst neu:
```
sudo systemctl restart systemd-logind.service
```
Oder rebooten Sie das System:
```
sudo reboot
```
Danach ignoriert der Deckel das Schließen – ideal für Serverbetrieb, aber achten Sie auf Überhitzung. [forum.linuxguides](https://forum.linuxguides.de/index.php?thread%2F4551-laptop-als-server-mit-geschlossenem-deckel-immer-wach%2F)

## Überprüfen
Testen Sie durch Schließen des Deckels und Überwachen via SSH oder Ping. Falls Probleme: Zurücksetzen mit `#` vor den Zeilen und Neustart. [youtube](https://www.youtube.com/watch?v=px5-4iaTKgQ)

## Mount device 

Um einen USB-Stick in Ubuntu Server 25.10 zu mounten, folgen Sie diesen Schritten im Terminal. Der Prozess ist standardmäßig und funktioniert gleich in aktuellen Ubuntu-Versionen. [linuxconfig](https://linuxconfig.org/howto-mount-usb-drive-in-linux)

## USB-Stick identifizieren
Stecken Sie den USB-Stick ein und führen Sie aus:
```
lsblk
```
oder
```
sudo fdisk -l
```
Suchen Sie nach dem Gerät (z. B. `/dev/sdb1` oder `/dev/sdc1`). Notieren Sie den genauen Namen – achten Sie darauf, nicht die falsche Festplatte zu wählen. [geek-university](https://geek-university.com/usb-gerat-mounten/)

## Mount-Punkt erstellen
Erstellen Sie ein Verzeichnis als Ziel:
```
sudo mkdir /mnt/usb
```
Sie können `/media/usb` oder einen anderen Pfad wählen. [youtube](https://www.youtube.com/watch?v=t1MCbL95Xcg)

## USB-Stick mounten
Mounten Sie das Gerät (ersetzen Sie `/dev/sdb1` durch Ihren Gerätenamen):
```
sudo mount /dev/sdb1 /mnt/usb
```
Für FAT32/exFAT (häufig bei USB-Sticks):
```
sudo mount -t vfat /dev/sdb1 /mnt/usb
```
Überprüfen Sie mit `ls /mnt/usb` oder `mount | grep usb`. [linuxconfig](https://linuxconfig.org/howto-mount-usb-drive-in-linux)

## Aushängen
Zum Sichern:
```
sudo umount /mnt/usb
```
Dann können Sie den Stick entfernen. [linuxconfig](https://linuxconfig.org/howto-mount-usb-drive-in-linux)

# SMB Server

Um Ubuntu Server zu einem SMB-Server (Samba) zu machen und einen User anzulegen, installieren Sie Samba und konfigurieren es für Freigaben mit Authentifizierung. Das funktioniert standardmäßig in Ubuntu Server 25.10. [documentation.ubuntu](https://documentation.ubuntu.com/server/how-to/samba/file-server/)

## Samba installieren
Führen Sie aus:
```
sudo apt update
sudo apt install samba
```
Das Paket enthält smbd für Dateifreigaben. [wiki.ubuntuusers](https://wiki.ubuntuusers.de/Samba_Server/)

## SMB-User anlegen
Erstellen Sie zuerst einen System-User (falls nicht vorhanden):
```
sudo adduser smbuser
```
Legen Sie dann das Samba-Passwort fest:
```
sudo smbpasswd -a smbuser
```
Aktivieren Sie den User:
```
sudo smbpasswd -e smbuser
```
Dieser User kann sich authentifizieren. [thomas-krenn](https://www.thomas-krenn.com/de/wiki/Samba_Freigabe_mit_Authentifizierung)

## Freigabe konfigurieren
Bearbeiten Sie `/etc/samba/smb.conf`:
```
sudo nano /etc/samba/smb.conf
```
Fügen Sie am Ende hinzu (ersetzen Sie `share` durch Ihren Ordnernamen):
```
[share]
path = /srv/samba/share
valid users = smbuser
read only = no
browsable = yes
```
Passen Sie `workgroup` im [global]-Abschnitt an (z. B. `workgroup = WORKGROUP`). [wiki.ubuntuusers](https://wiki.ubuntuusers.de/Samba_Server/smb.conf/)

## Verzeichnis vorbereiten und starten
```
sudo mkdir -p /srv/samba/share
sudo chown smbuser:smbuser /srv/samba/share
sudo chmod 755 /srv/samba/share
sudo systemctl restart smbd nmbd
sudo systemctl enable smbd nmbd
```
Testen Sie mit `testparm` und `smbclient -L localhost -U smbuser`. [documentation.ubuntu](https://documentation.ubuntu.com/server/how-to/samba/file-server/)

## Zugriff testen
Von Windows: `\\IP-ADRESSE\share` mit smbuser/Passwort. Von Linux: `smb://IP-ADRESSE/share`. [decatec](https://decatec.de/linux/samba-auf-ubuntu-server/)

# SMB Share USB Device

Ja, Sie können einen USB-Stick problemlos über Samba freigeben, indem Sie ihn mounten und in der smb.conf als Freigabe definieren. Das baut direkt auf der vorherigen Samba-Konfiguration auf. [tutonaut](https://www.tutonaut.de/linux-usb-festplatte-im-netzwerk-freigeben/)

## USB-Stick mounten
Identifizieren Sie den Stick mit `lsblk` oder `sudo fdisk -l` (z. B. `/dev/sdb1`). Erstellen Sie einen Mount-Punkt und mounten Sie:
```
sudo mkdir /mnt/usbshare
sudo mount /dev/sdb1 /mnt/usbshare
```
Rechte setzen (für Ihren smbuser):
```
sudo chown -R smbuser:smbuser /mnt/usbshare
sudo chmod -R 755 /mnt/usbshare
```


## Samba-Freigabe hinzufügen
Bearbeiten Sie `/etc/samba/smb.conf`:
```
sudo nano /etc/samba/smb.conf
```
Fügen Sie am Ende hinzu:
```
[usbshare]
path = /mnt/usbshare
valid users = smbuser
read only = no
browsable = yes
```
Speichern und Samba neu starten:
```
sudo systemctl restart smbd
testparm
```


## Automatisch beim Boot mounten
Für Dauerhaftigkeit: UUID ermitteln mit `blkid`, dann `/etc/fstab` editieren:
```
sudo nano /etc/fstab
```
Hinzufügen (ersetzen Sie UUID und Typ):
```
UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx /mnt/usbshare vfat defaults,uid=1000,gid=1000 0 2
```
Testen: `sudo mount -a`. Nun ist der USB-Stick netzwerkweit als `\\IP\usbshare` erreichbar. [tutonaut](https://www.tutonaut.de/linux-usb-festplatte-im-netzwerk-freigeben/)

# ssh von github Importieren

> Evtl curl vorher Installieren

Ja, Sie können Ihre öffentlichen SSH-Schlüssel von GitHub automatisch auf einem Debian-Server laden und installieren. Das funktioniert, wenn Ihr GitHub-Konto die SSH-Schlüssel unter `https://github.com/benutzername.keys` veröffentlicht hat (standardmäßig für Authentifizierungsschlüssel).

## Automatisches Herunterladen
Loggen Sie sich als der Zielbenutzer auf dem Debian-Server ein (per SSH oder Konsole) und führen Sie aus:

```
mkdir -p ~/.ssh && cd ~/.ssh
curl -s https://github.com/IHR_GITHUB_BENUTZERNAME.keys >> authorized_keys
chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys
```

- Ersetzen Sie `IHR_GITHUB_BENUTZERNAME` durch Ihren GitHub-Username (z. B. `curl -s https://github.com/octocat.keys`).
- `curl` lädt alle öffentlichen Schlüssel aus Ihrem GitHub-Profil und fügt sie zu `authorized_keys` hinzu. [heise](https://www.heise.de/tipps-tricks/SSH-Key-fuer-GitHub-Repositories-einrichten-4627459.html)

## Testen
Versuchen Sie nun einen passwortlosen Login von Ihrem lokalen System:
```
ssh benutzername@server-ip
```
Falls es klappt, sind die Schlüssel aktiv.

## Wichtige Hinweise
- Stellen Sie sicher, dass in `/etc/ssh/sshd_config` auf dem Server `PubkeyAuthentication yes` steht, dann `systemctl restart ssh`.
- Nur Schlüssel aus Ihrem GitHub-Profil werden geladen – Deploy-Keys oder private Repos nicht.
- Bei mehreren Schlüsseln werden alle importiert; prüfen Sie `authorized_keys` mit `cat ~/.ssh/authorized_keys`.