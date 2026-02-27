# Change Grub Easy

Wenn GRUB (der Bootloader unter Linux) auf 0 Sekunden Timeout gestellt ist, startet er normalerweise direkt ohne Menüanzeige. Du kannst das Menü trotzdem erzwingen, indem du während des Bootvorgangs die **Esc-Taste** (oder manchmal **Shift**) drückst, sobald GRUB lädt. [wiki.ubuntuusers](https://wiki.ubuntuusers.de/GRUB_2/Konfiguration/)

## Konfiguration prüfen
Bearbeite die GRUB-Datei `/etc/default/grub` mit `sudo nano /etc/default/grub` und stelle sicher:
- `GRUB_TIMEOUT_STYLE=menu` (für sichtbares Menü).
- `GRUB_TIMEOUT=0` behalten, aber nach Änderungen `sudo update-grub` ausführen und neu starten. [forum.linuxguides](https://forum.linuxguides.de/index.php?thread%2F1610-erledigt-linux-mint-booten-grub-menue-30-sek-ab%C3%A4ndern%2F)

## Menü manuell aufrufen
- Beim Booten **Esc** kurz drücken, um das Zählen zu unterbrechen und das Menü anzuzeigen.
- Bei `hidden`-Modus: Esc innerhalb der (unsichtbaren) Timeout-Zeit drücken. [discussion.fedoraproject](https://discussion.fedoraproject.org/t/grub-timeout-0-and-grub-timeout-style-hidden-not-working-along-with-outdated-menu-options/157057)

Falls es trotz Timeout=0 immer erscheint (z. B. mit 10 Sekunden), überprüfe auf Überschreibungen in der Konfig oder führe `sudo update-grub` erneut aus. [forum.manjaro](https://forum.manjaro.org/t/grub-wird-trotz-grub-timeout-0-bei-jedem-bootvorgang-angezeigt/178053)  

