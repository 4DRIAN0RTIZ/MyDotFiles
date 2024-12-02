@echo off

REM Ejecuta el script tab_color.py en WSL con Python
wsl.exe --exec python3 /home/neandertech/qutescripts/tab_color.py

REM Mantiene la ventana abierta
pause >nul
