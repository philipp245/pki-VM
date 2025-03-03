#!/usr/bin/env bash

# Debugging: Aktuelles Verzeichnis und Dateien anzeigen
echo "Aktuelles Verzeichnis: $(pwd)"
ls -l

set -e  # Falls ein Fehler auftritt, bricht das Skript ab

# Stelle sicher, dass Go installiert ist
if ! command -v go &> /dev/null
then
    echo "Go ist nicht installiert. Bitte installiere Go, bevor du das Skript ausführst."
    exit 1
fi

# Baue die VM
echo "Baue die PKI Blockchain VM..."
go build -o pki-blockchain-vm

# Bestätige, dass die Datei existiert
if [ -f "pki-blockchain-vm" ]; then
    echo "Build erfolgreich: pki-blockchain-vm erstellt!"
else
    echo "Fehler: Build fehlgeschlagen."
    exit 1
fi

