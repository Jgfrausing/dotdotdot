#!/bin/bash

echo "Starting tool installations via Homebrew..."

# Check if Homebrew is installed
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed."
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install Lazygit
echo "Installing Lazygit..."
brew install lazygit

# Install NVM
echo "Installing NVM (Node Version Manager)..."
brew install nvm

# Create NVM directory if it doesn't exist
mkdir -p ~/.nvm

# Add NVM to .zshrc or .bashrc for auto-loading
if [[ -f "$HOME/.zshrc" ]]; then
  if ! grep -q 'export NVM_DIR' ~/.zshrc; then
    echo "Adding NVM configuration to .zshrc..."
    echo 'export NVM_DIR="$HOME/.nvm"' >>~/.zshrc
    echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"' >>~/.zshrc
    echo '[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"' >>~/.zshrc
  fi
elif [[ -f "$HOME/.bashrc" ]]; then
  if ! grep -q 'export NVM_DIR' ~/.bashrc; then
    echo "Adding NVM configuration to .bashrc..."
    echo 'export NVM_DIR="$HOME/.nvm"' >>~/.bashrc
    echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"' >>~/.bashrc
    echo '[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"' >>~/.bashrc
  fi
fi

# Install Python
echo "Installing Python..."
brew install python

# Install Ripgrep
echo "Installing Ripgrep..."
brew install ripgrep

# Install Docker
echo "Installing Docker..."
brew install --cask docker

# Install Node.js 22 using NVM
echo "Installing Node.js 22 via NVM..."
nvm install 22
nvm use 22
nvm alias default 22

# Install git-checkout-interactive (gci) globally via npm
echo "Installing git-checkout-interactive via npm..."
npm install -g git-checkout-interactive

# Completion message
echo "All tools installed successfully!"
