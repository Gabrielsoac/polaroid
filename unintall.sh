#!/bin/bash

COMMAND_NAME="polaroid"
TARGET_PATH="/usr/local/bin/$COMMAND_NAME"

if [ -L "$TARGET_PATH" ]; then
  echo "Removendo $COMMAND_NAME de $TARGET_PATH..."
  sudo rm "$TARGET_PATH"
  echo "Remoção concluída. O comando '$COMMAND_NAME' não está mais disponível no terminal."
else
  echo "Nenhum link simbólico encontrado em $TARGET_PATH. Nada foi removido."
fi
