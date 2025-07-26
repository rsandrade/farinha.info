#!/usr/bin/env bash
set -e

echo "📦 Clonando projeto..."
if [ ! -d farinha ]; then
  git clone https://gitlab.com/yndexa/farinha/farinha.git
fi
cd farinha

echo "🔍 Verificando Docker..."
if ! command -v docker &> /dev/null; then
  echo "❌ Docker não está instalado. Instale o Docker antes de continuar."
  exit 1
fi

# Detecta ambiente
OS_NAME="$(uname -s)"
IS_WINDOWS=false

if [[ "$OS_NAME" =~ MINGW|MSYS|CYGWIN ]]; then
  IS_WINDOWS=true
elif grep -qi microsoft /proc/version 2>/dev/null; then
  IS_WINDOWS=true  # WSL
fi

# Executa script apropriado
if $IS_WINDOWS; then
  echo "🪟 Detected Windows. Executando run.bat..."
  cmd.exe /c run.bat
else
  echo "🐧 Detected Unix-like system. Executando bash ./run.sh..."
  bash ./run.sh
fi
