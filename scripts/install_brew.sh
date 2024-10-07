#!/bin/bash

echo "Starting Homebrew installation..."

# Detect if Homebrew is already installed
if command -v brew >/dev/null 2>&1; then
  echo "Homebrew is already installed."
  brew --version
  exit 0
fi

# Install Homebrew for macOS and Linux
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to the PATH for Linux
if [[ "$(uname)" == "Linux" ]]; then
  echo "Adding Homebrew to PATH for Linux..."
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>~/.bashrc
  source ~/.bashrc
elif [[ "$(uname)" == "Darwin" ]]; then
  echo "Homebrew installation complete for macOS."
else
  echo "Unknown operating system. Exiting."
  exit 1
fi

# Verify installation
if command -v brew >/dev/null 2>&1; then
  echo "Homebrew successfully installed."
  brew --version
else
  echo "Homebrew installation failed."
  exit 1
fi
