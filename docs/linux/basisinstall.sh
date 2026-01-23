
#!/bin/bash
set -o pipefail

LOGFILE="install_$(date +%Y%m%d_%H%M%S).log"

echo "=== Start: $(date) ===" | tee -a "$LOGFILE"

# ---- Helper: Root-Erkennung ----
is_root() { [ "$(id -u)" -eq 0 ]; }

# ---- Helper: Command vorhanden? ----
has_cmd() { command -v "$1" >/dev/null 2>&1; }

# ---- APT vorbereiten ----
prepare_apt() {
  if has_cmd apt; then
    echo "[APT] Update der Paketlisten..." | tee -a "$LOGFILE"
    sudo apt update >>"$LOGFILE" 2>&1 || echo "[WARN] apt update hatte Warnungen/Fehler." | tee -a "$LOGFILE"
  else
    echo "[WARN] apt nicht gefunden – APT-Pakete werden übersprungen." | tee -a "$LOGFILE"
  fi
}

# ---- SNAP vorbereiten ----
prepare_snap() {
  if ! has_cmd snap; then
    echo "[INFO] snap ist nicht installiert. Versuche Installation via apt..." | tee -a "$LOGFILE"
    if has_cmd apt; then
      sudo apt update >>"$LOGFILE" 2>&1
      sudo apt install -y snapd >>"$LOGFILE" 2>&1 || {
        echo "[ERROR] snapd konnte nicht installiert werden." | tee -a "$LOGFILE"
        return 1
      }
      # Sicherstellen, dass snapd-Dienst läuft
      sudo systemctl enable --now snapd.socket >>"$LOGFILE" 2>&1
      sudo ln -sf /var/lib/snapd/snap /snap 2>/dev/null
      hash -r
    else
      echo "[WARN] Weder snap vorhanden noch apt verfügbar – Snap-Installationen werden übersprungen." | tee -a "$LOGFILE"
      return 1
    fi
  fi
  return 0
}

# ---- Prüfen, ob APT-Paket installiert ist ----
is_apt_installed() {
  dpkg -s "$1" >/dev/null 2>&1
}

# ---- Prüfen, ob SNAP-Paket installiert ist ----
is_snap_installed() {
  snap list "$1" >/dev/null 2>&1
}

# ---- Installationsfunktionen ----
install_apt_pkg() {
  local pkg="$1"
  if ! has_cmd apt; then
    echo "[SKIP][APT] $pkg – apt fehlt" | tee -a "$LOGFILE"
    return
  fi
  if is_apt_installed "$pkg"; then
    echo "[OK][APT] $pkg bereits installiert" | tee -a "$LOGFILE"
  else
    echo "[APT] Installiere $pkg ..." | tee -a "$LOGFILE"
    if sudo apt install -y "$pkg" >>"$LOGFILE" 2>&1; then
      echo "[DONE][APT] $pkg installiert" | tee -a "$LOGFILE"
    else
      echo "[ERROR][APT] $pkg konnte nicht installiert werden" | tee -a "$LOGFILE"
    fi
  fi
}

install_snap_pkg() {
  # erlaubt Flags wie '--classic' nach dem Paketnamen
  local pkg_line=("$@")
  local name="${pkg_line[0]}"

  if ! has_cmd snap; then
    echo "[SKIP][SNAP] ${pkg_line[*]} – snap fehlt" | tee -a "$LOGFILE"
    return
  fi
  if is_snap_installed "$name"; then
    echo "[OK][SNAP] $name bereits installiert" | tee -a "$LOGFILE"
  else
    echo "[SNAP] Installiere ${pkg_line[*]} ..." | tee -a "$LOGFILE"
    if sudo snap install "${pkg_line[@]}" >>"$LOGFILE" 2>&1; then
      echo "[DONE][SNAP] $name installiert" | tee -a "$LOGFILE"
    else
      echo "[ERROR][SNAP] $name konnte nicht installiert werden" | tee -a "$LOGFILE"
    fi
  fi
}

# ============================
#   Pakete definieren
# ============================

# APT-Pakete
APT_PACKAGES=(
  "keepassxc"          # KeePassXC
  "telegram-desktop"   # Telegram
  "kleopatra"          # Kleopatra (GnuPG-Frontend)
  "vlc"                # VLC Media Player
)

# SNAP-Pakete (Name + optionale Flags als getrennte Elemente)
# Bitwarden & VS Code per Snap:
SNAP_PACKAGES=(
  "bitwarden"          # Bitwarden
  "code --classic"     # Visual Studio Code (classic confinement)
)

# ============================
#   Installation
# ============================

prepare_apt
prepare_snap

echo "--- Installiere APT-Pakete ---" | tee -a "$LOGFILE"
for pkg in "${APT_PACKAGES[@]}"; do
  install_apt_pkg "$pkg"
done

echo "--- Installiere SNAP-Pakete ---" | tee -a "$LOGFILE"
# Snap-Liste Zeile für Zeile parsen, damit Flags funktionieren
while IFS= read -r line; do
  # Skip leere/Kommentarzeilen
  [[ -z "$line" || "$line" =~ ^# ]] && continue
  # In Array splitten (Name + Flags)
  read -r -a parts <<< "$line"
  install_snap_pkg "${parts[@]}"
done < <(printf "%s\n" "${SNAP_PACKAGES[@]}")

echo "=== Ende: $(date) ===" | tee -a "$LOGFILE"
echo "Log gespeichert in: $LOGFILE"
``
