# Windows open ssh

Ja, auf Windows 10 kannst du den integrierten OpenSSH-Server installieren. Das ist seit Build 1809 möglich und erfordert Administratorrechte. [ionos](https://www.ionos.de/digitalguide/server/konfiguration/windows-10-ssh/)

## Installation über Einstellungen
Gehe zu **Einstellungen > Apps > Optionale Features > Features hinzufügen**, suche "OpenSSH Server" und installiere es. Der Dienst startet danach automatisch. [gist.github](https://gist.github.com/lelegard/0e257510057bea59738422ae871213e8)

## PowerShell-Installation (empfohlen)
Öffne PowerShell als Administrator und führe aus:
```
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Set-Service -Name sshd -StartupType 'Automatic'
Start-Service sshd
```
Das installiert, aktiviert den automatischen Start und startet den Dienst. [gist.github](https://gist.github.com/lelegard/0e257510057bea59738422ae871213e8)

## Firewall und Test
Erstelle eine Firewall-Regel:
```
New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server' -Enabled True -Direction Inbound -Protocol TCP -LocalPort 22
```
Teste mit `ssh username@deine-ip` von einem anderen Gerät. [blog.sasworkshops](https://blog.sasworkshops.com/ssh-server-on-windows-10/)



