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

# Verifica se o ImageMagick está instalado
if ! command -v convert >/dev/null 2>&1; then
  echo "ImageMagick não encontrado. Instalando com Homebrew..."

  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew não encontrado. Por favor, instale o Homebrew primeiro: https://brew.sh"
    exit 1
  fi

  brew install imagemagick || {
    echo "Erro ao instalar o ImageMagick. Verifique o Homebrew."
    exit 1
  }
else
  echo "ImageMagick já está instalado."
fi

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
