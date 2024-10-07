#!/bin/bash

echo "Starting tool installations via Homebrew..."

# Check if Homebrew is installed
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed."
fi

echo "Updating Homebrew..."
brew update

echo "Installing Lazygit..."
brew install lazygit

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

echo "Installing Iterm2..."
brew install iterm2

echo "Installing NeoVim..."
brew install neovim

echo "Installing Ripgrep..."
brew install ripgrep

echo "Installing TeamsTM..."
brew install --cask microsoft-teams

echo "Installing Docker..."
brew install --cask docker

echo "Installing Node.js 22 via NVM..."
nvm install 22
nvm use 22
nvm alias default 22

echo "Installing git-checkout-interactive via npm..."
npm install -g git-checkout-interactive

echo "Install zsh and oh-my-zsh dependencies..."
brew install zsh zsh-syntax-highlighting zsh-autosuggestions

echo "All tools installed successfully!"
