#!/bin/bash

echo "Starting Fira Code font installation..."

# Detect the operating system
OS=$(uname)

if [[ "$OS" == "Darwin" ]]; then
  # macOS installation using Homebrew
  echo "Detected macOS. Installing Fira Code via Homebrew..."

  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew not found. Installing Homebrew first..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  brew tap homebrew/cask-fonts
  brew install --cask font-fira-code
  echo "Fira Code installed successfully on macOS."

elif [[ "$OS" == "Linux" ]]; then
  # Linux installation
  echo "Detected Linux. Installing Fira Code manually..."

  # Check if wget is installed
  if ! command -v wget >/dev/null 2>&1; then
    echo "wget not found. Installing wget..."
    sudo apt-get update && sudo apt-get install -y wget
  fi

  # Download Fira Code
  wget https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip -O /tmp/Fira_Code.zip

  # Unzip the downloaded file
  unzip /tmp/Fira_Code.zip -d /tmp/FiraCode

  # Create fonts directory if not exists
  mkdir -p ~/.local/share/fonts

  # Move the font files to the fonts directory
  mv /tmp/FiraCode/ttf/*.ttf ~/.local/share/fonts/

  # Refresh font cache
  fc-cache -f -v

  echo "Fira Code installed successfully on Linux."

else
  echo "Unsupported operating system: $OS"
  exit 1
fi
