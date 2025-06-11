#!/bin/sh

COMMAND_NAME="polaroid"
TARGET="/usr/local/bin/$COMMAND_NAME"

echo "Removendo link simbólico $TARGET..."

sudo rm -f "$TARGET" || {
  echo "Erro ao remover link simbólico. Verifique permissões."
  exit 1
}

if command -v brew >/dev/null 2>&1; then
  if brew list imagemagick >/dev/null 2>&1; then
    echo "Removendo ImageMagick via Homebrew..."
    brew uninstall imagemagick || {
      echo "Erro ao remover o ImageMagick. Verifique o Homebrew."
      exit 1
    }
  else
    echo "ImageMagick não está instalado via Homebrew."
  fi
else
  echo "Homebrew não encontrado. Se desejar remover o ImageMagick, faça isso manualmente."
fi

echo "Desinstalação concluída!"
