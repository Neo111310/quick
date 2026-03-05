KeePassXC kann als SSH-Agent-Client konfiguriert werden, um SSH-Schlüssel aus Ihrer Datenbank automatisch zu laden, wenn der System-ssh-agent läuft. Dies erfordert einen laufenden ssh-agent in Ubuntu und die richtige Integration in KeePassXC.

## SSH-Agent in Ubuntu starten
Fügen Sie dies zu Ihrer `~/.bashrc` oder `~/.profile` hinzu, damit der Agent bei jedem Login startet:
```
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)"
fi
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
```
Oder systemd nutzen (empfohlen): `systemctl --user enable --now ssh-agent` und `echo 'export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket' >> ~/.bashrc`. [jeremyness](https://jeremyness.com/posts/ssh-agent-with-keepassxc/)

## KeePassXC SSH-Agent aktivieren
1. Öffnen Sie KeePassXC → **Extras** → **Einstellungen** → **SSH-Agent**.
2. Aktivieren Sie **SSH-Agent aktivieren**.
3. Prüfen Sie, ob `SSH_AUTH_SOCK` angezeigt wird (z. B. `/run/user/1000/ssh-agent.socket`). Falls leer, geben Sie den Pfad manuell ein. [fossies](https://fossies.org/linux/keepassxc/docs/topics/SSHAgent.adoc)

## SSH-Schlüssel in KeePassXC-Eintrag speichern
1. Erstellen Sie einen neuen Eintrag.
2. **Passwort**: Passphrase Ihres SSH-Keys.
3. **Erweitert** → SSH-Key als **Anhang** hinzufügen (`.pem` oder OpenSSH-Format).
4. **SSH-Agent**-Tab: Wählen Sie den Anhang als **Privater Schlüssel**, aktivieren Sie **Beim Öffnen der DB zum Agent hinzufügen**. [github](https://github.com/keepassxreboot/keepassxc/blob/develop/docs/topics/SSHAgent.adoc)

## Testen
- DB entsperren → Schlüssel wird automatisch zu `ssh-agent` geladen (`ssh-add -l` prüfen).
- SSH-Verbindung testen: `ssh benutzer@server`. Key wird genutzt.
- DB schließen → Key wird entfernt (je nach Einstellung). [reddit](https://www.reddit.com/r/KeePass/comments/ys2neu/keepassxc_ssh_agent_ubuntu_2204/)

Stellen Sie sicher, dass KeePassXC Flatpak/Snap-frei läuft (native AppImage/Paket), da Container Umgebungsvariablen blocken können. Bei GNOME: GNOME Keyring aktiviert ssh-agent automatisch. [fossies](https://fossies.org/linux/keepassxc/docs/topics/SSHAgent.adoc)


# Zusatz

https://www.youtube.com/watch?v=5upiduo1ZwU

Noch was sdgds

https://www.youtube.com/watch?v=Scm6pvVuzrk

https://www.youtube.com/watch?v=gQcIOsiOadY
