#!/usr/bin/env bash
set -e

# Debugging: Aktuelles Verzeichnis anzeigen
echo "Aktuelles Verzeichnis: $(pwd)"
ls -l

# Stelle sicher, dass Go installiert ist
if ! command -v go &> /dev/null
then
    echo "Go ist nicht installiert. Bitte installiere Go, bevor du das Skript ausführst."
    exit 1
fi

# Überprüfen, ob ein Zielpfad vom CLI übergeben wurde
if [ -z "$1" ]; then
    echo "Fehler: Kein Zielpfad für die VM-Binary angegeben!"
    exit 1
fi

# Baue die VM
echo "Baue die PKI Blockchain VM..."
echo "Building VM binary at: $1"
go build -o "$1"

# Bestätigen, dass die Datei am richtigen Ort existiert
if [ -f "$1" ]; then
    echo "Build erfolgreich: VM-Binary gespeichert unter $1!"
else
    echo "Fehler: Build fehlgeschlagen. Datei wurde nicht erstellt."
    exit 1
fi

