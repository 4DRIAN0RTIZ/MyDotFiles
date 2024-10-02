#!/bin/bash

# Obtener el hostname
HOSTNAME=$(hostname)

# Definir un array asociativo con los nombres de los entornos y sus hostnames
declare -A HOSTNAMES
HOSTNAMES=(
    ["LAP-321"]="oficina"
    ["buzort"]="casa"
    ["ubuntu"]="escuela"  # Ajusta esto según el hostname de tu live USB
)

# Directorio del repositorio de dotfiles
DOTFILES_DIR="$HOME/MyDotFiles"

# Configuración por defecto
ZSHRC="$DOTFILES_DIR/zsh/.zshrc"
ZSHENV="$DOTFILES_DIR/zsh/.zsh_env"
ZSHFUNCTIONS="$DOTFILES_DIR/zsh/.zsh_functions"
NVIM_CONFIG="$DOTFILES_DIR/.config/nvim"
STARSHIP_CONFIG="$DOTFILES_DIR/.config/starship.toml"

# Detectar el entorno basado en el hostname
ENV=${HOSTNAMES[$HOSTNAME]}

# Configuración específica por entorno
case $ENV in
    oficina)
        ZSHRC="$DOTFILES_DIR/zsh/.zshrc_oficina"
        ZSHENV="$DOTFILES_DIR/zsh/.zsh_env_oficina"
        ZSHFUNCTIONS="$DOTFILES_DIR/zsh/.zsh_functions_oficina"
        NVIM_CONFIG="$DOTFILES_DIR/.config/nvim_oficina"
        STARSHIP_CONFIG="$DOTFILES_DIR/.config/starship_oficina.toml"
        ;;
    casa)
        ZSHRC="$DOTFILES_DIR/.zshrc_casa"
        ZSHENV="$DOTFILES_DIR/.zsh_env_casa"
        ZSHFUNCTIONS="$DOTFILES_DIR/.zsh_functions_casa"
        NVIM_CONFIG="$DOTFILES_DIR/.config/nvim_casa"
        STARSHIP_CONFIG="$DOTFILES_DIR/.config/starship_casa.toml"
        ;;
    escuela)
        ZSHRC="$DOTFILES_DIR/.zshrc_escuela"
        ZSHENV="$DOTFILES_DIR/.zsh_env_escuela"
        ZSHFUNCTIONS="$DOTFILES_DIR/.zsh_functions_escuela"
        NVIM_CONFIG="$DOTFILES_DIR/.config/nvim_escuela"
        STARSHIP_CONFIG="$DOTFILES_DIR/.config/starship_escuela.toml"
        ;;
esac

# Crear directorios si no existen
mkdir -p $HOME/.config

# Desencripta el archivo .zsh_env si existe
if [ -f "$ZSHENV" ]; then
    gpg --decrypt "$ZSHENV" > "$HOME/.zsh_env"
fi

# Crear enlaces simbólicos
ln -sf $ZSHRC $HOME/.zshrc
ln -sf $ZSHFUNCTIONS $HOME/.zsh_functions
ln -sf $NVIM_CONFIG $HOME/.config/nvim
ln -sf $STARSHIP_CONFIG $HOME/.config/starship.toml

# Mensajes de log
echo "Configuración aplicada para el entorno: $ENV"
echo "Enlace simbólico creado para .zshrc -> $ZSHRC"
echo "Enlace simbólico creado para nvim -> $NVIM_CONFIG"
echo "Enlace simbólico creado para starship.toml -> $STARSHIP_CONFIG"

