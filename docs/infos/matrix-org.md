# MATRIX.ORG

Matrix.org ist ein offenes, föderiertes Chat‑Netzwerk, bei dem alles auf dem gleichen Protokoll läuft – ähnlich wie E‑Mail, aber für Chats, Gruppenräume und Videocalls.  Du brauchst dafür keinen einzelnen zentralen Dienst wie WhatsApp, sondern kannst fast wie beim E‑Mail‑Account zwischen vielen Anbietern wählen und trotzdem mit allen anderen Nutzerinnen und Nutzern kommunizieren. https://gnulinux.ch/messenger-wechsel-matrix

## Was ist Matrix im Alltag?

- Matrix ist ein „Messenger‑Protokoll“, keine einzelne App; es gibt viele verschiedene Clients, die alle miteinander sprechen können. https://matrix.org/ecosystem/clients/
- Du kannst 1:1‑Chats, Gruppenräume, Dateianhänge, Ende‑zu‑Ende‑Verschlüsselung und Videocalls nutzen. https://fachschaften.org/guides/wie-benutzt-man-matrix/  

## Wie funktionieren die Adressen?

- Jede Matrix‑Adresse („User ID“) hat die Form `@benutzername:homeserver`, zum Beispiel `@max:matrix.org` oder `@max:chat.example.com`. https://www.privacy-handbuch.de/handbuch_74g.htm

## Viele Clients – was bedeutet das?

- Matrix ist wie ein Standard: Es gibt viele verschiedene Apps/Clients, die alle auf das gleiche Protokoll zugreifen.  
- Typische Optionen sind z.B. Element (Web, Desktop, Android, iOS), SchildiChat (Android), Quadrix, Fractal oder andere – alle können auf das gleiche Konto zugreifen und sind teilweise eher schlicht, teilweise „feature‑reich“. https://docs.chat.academiccloud.de/clients/index.html

## Hinweis für Mobiltelefone

- Für Android und iOS gibt es mehrere fertige Matrix‑Clients, darunter Element bzw. Element X, SchildiChat und einige weitere aus dem App‑/Play‑Store. 
   - Für Android https://play.google.com/store/apps/details?id=io.element.android.x&pcampaignid=web_share  
   - für Iphone https://apps.apple.com/de/app/element-x-secure-chat-call/id1631335820
- Ein einfacher Einstieg für unbedarfte Nutzer: Einfach „Element“ oder „Matrix“ im App‑Store suchen, installieren und dann mit der eigenen Matrix‑Adresse (z.B. `@benutzer:matrix.org`) anmelden; danach funktioniert das Chat‑Erlebnis ähnlich wie bei anderen Messenger‑Apps. 

# KeepasXC

KeePassXC ist ein **kostenloser Passwort‑Manager**, mit dem du alle deine Passwörter an einem Ort sicher speichern kannst – statt sie auf Zetteln, in Notizen oder in Block‑Apps zu sammeln.  Für unbedarfte Nutzer funktioniert es wie eine kleine „Tresor‑App“: Du gibst nur ein einziges gutes Passwort ein und bekommst dafür Zugriff auf alle gespeicherten Logins.  
https://www.heimnetz.de/anleitungen/sonstiges/erste-schritte-mit-dem-passwortmanager-keepassxc/  
https://youtu.be/LFgkyeBpX2g?si=LHHH0tHKtZXeXC9L  

### Was macht KeePassXC?

- KeePassXC speichert deine Passwörter, Benutzernamen und weitere sensible Daten in einer **verschlüsselten Datei** (z.B. auf deinem Rechner oder in der Cloud). https://keepassxc.org/docs/KeePassXC_UserGuide
- Du brauchst nur ein sogenanntes **Haupt‑/Master‑Passwort** (oder optional eine Schlüsseldatei), um diese Datei zu öffnen und zu schützen. https://uol.de/fileadmin/itdienste/download/infomaterial/Einrichten_von_KeepassXC.pdf

### Wie ist es für Anfänger gedacht?

- Du legst eine „Passwort‑Datenbank“ an, gibst ihr einen Namen und schützt sie mit einem starken Master‑Passwort. https://www.uni-giessen.de/de/fbz/svc/hrz/svc/sicherheit/user/anleitung-passwort-manager-keepassxc-1
- Innerhalb der Datenbank kannst du Gruppen (z.B. „E‑Mail“, „Bank“, „Online‑Shopping“) und Einträge anlegen; zu jedem Eintrag gehören Titel, Benutzername und Passwort. https://www.heimnetz.de/anleitungen/sonstiges/erste-schritte-mit-dem-passwortmanager-keepassxc/

### Nützliche Funktionen

- KeePassXC kann **zufällige, sichere Passwörter** generieren, die du nicht mehr merken musst – du speicherst sie einfach in der Datenbank. https://www.youtube.com/watch?v=7e43w0f2fS8
- Über Kopieren/Einfügen oder Zusatz‑Addons (z.B. für Browser) kannst du Anmeldedaten mit wenigen Klicks in Webseiten einfügen, ohne das Passwort sehen zu müssen. https://www.youtube.com/watch?v=kQzOQoIo9q8

### Kurz gesagt für Anfänger

- KeePassXC ist ein lernfähiger, aber sehr sicherer Helfer: Du lernst ein einziges gutes Passwort, und alle anderen Passwörter werden für dich sicher verwaltet. https://uol.de/fileadmin/itdienste/download/infomaterial/Einrichten_von_KeepassXC.pdf
- Es gibt **keine Cloud‑Zwangs‑Abhängigkeit**, du kannst die Datenbank auf deinem eigenen Rechner oder einem sicheren Speicherort halten und so die Kontrolle behalten. https://www.uni-marburg.de/de/hrz/az/passwortverwaltung/keepassxc

# PGP

PGP („Pretty Good Privacy“) ist ein Verschlüsselungs‑System, mit dem du **E‑Mails und Dateien so schützen kannst, dass sie nur vom richtigen Empfänger gelesen werden**.  Dazu brauchst du ein sogenanntes **Schlüsselpaar**: einen öffentlichen Schlüssel (den du anderen geben kannst) und einen privaten Schlüssel (den du streng geheim hältst). https://netwrix.com/de/resources/blog/what-is-pgp-encryption/

### Wofür braucht man PGP?

- **Geschützte E‑Mails**: Der Inhalt deiner E‑Mails wird verschlüsselt; nur wer den passenden privaten Schlüssel hat, kann sie lesen. https://www.varonis.com/de/blog/pgp-encryption
- **Signierte E‑Mails**: Du kannst dich „mit einem digitalen Siegel“ ausweisen, damit der Empfänger sicher weiß, dass die Mail wirklich von dir und nicht verändert wurde. https://de.wikipedia.org/wiki/Pretty_Good_Privacy
- **Verschlüsselte Dateien**: Du kannst auch normale Dateien mit PGP verschlüsseln, z.B. Dokumente oder Backups, die du per E‑Mail verschickst oder in der Cloud speicherst. https://www.datenschutz.org/pgp-verschluesselung/

### Kleopatra: Was ist das?

Kleopatra ist das **passende Programm, das unter Windows mit PGP arbeitet**. https://wiki.selfhtml.org/wiki/E-Mail/PGP-Verschl%C3%BCsselung
- Es hilft dir, deine **PGP‑Schlüssel zu erstellen, zu verwalten und zu tauschen**. 
- Du kannst damit z.B. Dateien verschlüsseln bzw. entschlüsseln und deinen öffentlichen Schlüssel für E‑Mails exportieren, damit andere dir PGP‑Mails senden können. https://www.datenschutz.org/pgp-verschluesselung/

### Wo Kleopatra für Windows herunterladen?

Kleopatra gehört zum Paket **Gpg4win**; du lädst es für Windows hier herunter:  
→ **https://www.gpg4win.org** 

Dort findest du alle erforderlichen Programme, darunter **Kleopatra als Schlüsselverwaltungswerkzeug** – einfach Setup ausführen, Kleopatra starten und dir einen eigenen PGP‑Schlüssel anlegen, dann kannst du mit PGP beginnen. https://www.ionos.de/digitalguide/e-mail/e-mail-sicherheit/e-mails-verschluesseln-mit-pgp/