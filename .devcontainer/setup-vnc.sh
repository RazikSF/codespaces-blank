#!/bin/bash
# Installation des dépendances
sudo apt-get update
sudo apt-get install -y tigervnc-standalone-server tigervnc-common novnc

# Configuration de VNC
mkdir -p ~/.vnc
echo "password" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

# Démarrage du serveur VNC
vncserver :1 -geometry 1280x720 -depth 24 &

# Démarrage de noVNC
/usr/share/novnc/utils/launch.sh --vnc localhost:5901 --listen 6080 &
