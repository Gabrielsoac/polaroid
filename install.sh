#!/bin/bash

SCRIPT_PATH="$(realpath $(dirname $0))/src/polaroid.js"

COMMAND_NAME="polaroid"

echo "Instalando $COMMAND_NAME em /usr/local/bin..."

sudo ln -sf "$SCRIPT_PATH" "/usr/local/bin/$COMMAND_NAME"

chmod +x "$SCRIPT_PATH"

echo "Instalação concluída. Agora você pode usar '$COMMAND_NAME' no terminal, digite 'polaroid -h' para saber mais."