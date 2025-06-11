#!/bin/bash

SCRIPT_PATH="$(realpath $(dirname "$0"))/src/polaroid.js"
COMMAND_NAME="polaroid"

if ! command -v convert >/dev/null 2>&1; then
    echo "ImageMagick não encontrado. Instalando..."

    if command -v apt >/dev/null 2>&1; then
        sudo apt update
        sudo apt install -y imagemagick
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -Sy --noconfirm imagemagick
    else
        echo "Gerenciador de pacotes não suportado. Instale o ImageMagick manualmente."
        exit 1
    fi
else
    echo "ImageMagick já está instalado."
fi

echo "Instalando $COMMAND_NAME em /usr/local/bin..."

sudo ln -sf "$SCRIPT_PATH" "/usr/local/bin/$COMMAND_NAME"
chmod +x "$SCRIPT_PATH"

echo "Instalação concluída. Agora você pode usar '$COMMAND_NAME' no terminal, digite 'polaroid -h' para saber mais."