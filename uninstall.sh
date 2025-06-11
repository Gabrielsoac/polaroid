#!/bin/bash

COMMAND_NAME="polaroid"
TARGET_PATH="/usr/local/bin/$COMMAND_NAME"

if [ -L "$TARGET_PATH" ]; then
  echo "Removendo $COMMAND_NAME de $TARGET_PATH..."
  sudo rm "$TARGET_PATH"
  echo "Comando '$COMMAND_NAME' removido do terminal."
else
  echo "Nenhum link simbólico encontrado em $TARGET_PATH. Nada foi removido."
fi

remove_imagemagick() {
  if command -v apt >/dev/null 2>&1; then
    if dpkg -s imagemagick >/dev/null 2>&1; then
      echo "Removendo ImageMagick (apt)..."
      sudo apt remove -y imagemagick
      sudo apt autoremove -y
    else
      echo "ImageMagick não está instalado via apt."
    fi

  elif command -v pacman >/dev/null 2>&1; then
    if pacman -Q imagemagick >/dev/null 2>&1; then
      echo "Removendo ImageMagick (pacman)..."
      sudo pacman -Rns --noconfirm imagemagick
    else
      echo "ImageMagick não está instalado via pacman."
    fi

  elif command -v dnf >/dev/null 2>&1; then
    if dnf list installed imagemagick >/dev/null 2>&1; then
      echo "Removendo ImageMagick (dnf)..."
      sudo dnf remove -y imagemagick
    else
      echo "ImageMagick não está instalado via dnf."
    fi

  elif command -v zypper >/dev/null 2>&1; then
    if zypper se --installed-only imagemagick | grep imagemagick >/dev/null; then
      echo "Removendo ImageMagick (zypper)..."
      sudo zypper remove -y imagemagick
    else
      echo "ImageMagick não está instalado via zypper."
    fi

  else
    echo "Gerenciador de pacotes não suportado. Remova o ImageMagick manualmente se necessário."
  fi
}

remove_imagemagick

echo "Desinstalação concluída."
