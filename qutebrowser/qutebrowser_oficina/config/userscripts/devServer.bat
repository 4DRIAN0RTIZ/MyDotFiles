@echo off
title Ejecutando initApi.sh en WSL

REM Ejecuta el script initApi.sh en WSL
wsl.exe --exec bash -c "/home/neandertech/qutescripts/initApi.sh"

REM Mantiene la ventana abierta
pause >nul