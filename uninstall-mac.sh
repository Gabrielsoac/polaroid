#!/bin/sh

COMMAND_NAME="polaroid"
TARGET="/usr/local/bin/$COMMAND_NAME"

echo "Removendo link simbólico $TARGET..."

sudo rm -f "$TARGET" || {
  echo "Erro ao remover link simbólico. Verifique permissões."
  exit 1
}

echo "Desinstalação concluída!"