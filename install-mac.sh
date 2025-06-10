#!/bin/sh

resolve_path() {
  if command -v realpath >/dev/null 2>&1; then
    realpath "$1"
  else
    DIRNAME=$(dirname "$1")
    BASENAME=$(basename "$1")
    (cd "$DIRNAME" && echo "$(pwd)/$BASENAME")
  fi
}

SCRIPT_PATH="$(resolve_path "$(dirname "$0")")/src/polaroid.js"
COMMAND_NAME="polaroid"
TARGET="/usr/local/bin/$COMMAND_NAME"

echo "Instalando $COMMAND_NAME em $TARGET..."

sudo ln -sf "$SCRIPT_PATH" "$TARGET" || {
  echo "Erro ao criar link simbólico. Verifique permissões."
  exit 1
}

chmod +x "$SCRIPT_PATH" || {
  echo "Erro ao definir permissão de execução."
  exit 1
}

echo "Instalação concluída. Agora você pode usar '$COMMAND_NAME' no terminal."
echo "Digite '$COMMAND_NAME -h' para saber mais."