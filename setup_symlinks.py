import os
import shutil
import subprocess

# Directorio del repositorio de dotfiles
dotfiles_dir = os.path.expanduser("~/MyDotFiles")

# Directorio home del usuario
home_dir = os.path.expanduser("~")

# Directorio para las copias de seguridad
backup_dir = os.path.join(home_dir, ".bk_dotfiles")

# Crear el directorio de copias de seguridad si no existe
os.makedirs(backup_dir, exist_ok=True)

# Lista de archivos/directorios a enlazar
files_to_link = [
    {"zsh/.zshrc": "file"},
    {"zsh/.zsh_functions": "file"},
    {"zsh/.zsh_env": "file"},
    {".config/nvim": "dir"},
    {".config/kitty": "dir"},
    {".config/ranger": "dir"},
    {"starship/starship.toml": "file"},
]

def create_symlink(src, dest, is_dir):
    try:
        if os.path.exists(dest) or os.path.islink(dest):
            # Crear una copia de seguridad
            backup_path = os.path.join(backup_dir, os.path.relpath(dest, home_dir))
            os.makedirs(os.path.dirname(backup_path), exist_ok=True)
            shutil.move(dest, backup_path)
            print(f"Archivo/directorio {dest} movido a {backup_path}")
        
        # Eliminar el destino si existe (esto debería ser seguro después de mover el archivo)
        if os.path.exists(dest) or os.path.islink(dest):
            if is_dir:
                shutil.rmtree(dest)
            else:
                os.remove(dest)
        
        # Crear el enlace simbólico
        os.symlink(src, dest)
        print(f"Enlace simbólico creado: {dest} -> {src}")
    except Exception as e:
        print(f"Error al crear el enlace simbólico para {dest}: {e}")

for item in files_to_link:
    for file, type in item.items():
        src = os.path.join(dotfiles_dir, file)
        # Ajustar la ruta de destino para los archivos de zsh
        if file.startswith("zsh/"):
            dest = os.path.join(home_dir, file.replace("zsh/", ""))
        elif file.startswith("starship/"):
            dest = os.path.join(home_dir, file.replace("starship/", ".config/"))
        else:
            dest = os.path.join(home_dir, file)
        create_symlink(src, dest, type == "dir")

# Ejecutar git pull para mantener actualizado
try:
    result = subprocess.run(["git", "-C", dotfiles_dir, "pull"], check=True, capture_output=True, text=True)
    print(result.stdout)
except subprocess.CalledProcessError as e:
    print(f"Error al ejecutar git pull: {e.stderr}")
