#!/bin/bash

# Get SELFPATH
SELFPATH="$( realpath "${BASH_SOURCE[0]}" )"

# Get EXE
EXE="\"/usr/bin/bash\" \"${SELFPATH}\""

# NAME
NAME="XENIA"

# AppID.py
APPIDPY="/run/media/deck/SteamDeck/Emulation/tools/appID.py"

# Proton Launcher Script
PROTONLAUNCH="/run/media/deck/SteamDeck/Emulation/tools/proton-launch.sh"

# Cemu.exe location
xenia="/run/media/deck/SteamDeck/Emulation/tools/launchers/xeniasteamos/xenia_canary.exe"

# APPID
APPID=$( /usr/bin/python "${APPIDPY}" "${EXE}" "${NAME}" )

# Call the Proton launcher script and give the arguments
"${PROTONLAUNCH}" -p '- Experimental' -i "${APPID}" -- "${xenia}" "${@}"
