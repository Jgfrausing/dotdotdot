#!/bin/bash

echo "Starting Rust toolchain installation..."

# Detect the operating system
OS=$(uname)

# Function to install Rust
install_rust() {
  echo "Installing Rust via rustup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

  # Source Rust environment
  source $HOME/.cargo/env

  echo "Rust installation complete. Installed Rust version:"
  rustc --version
}

# Install Rust based on operating system
if [[ "$OS" == "Darwin" ]]; then
  echo "Detected macOS."
  install_rust
elif [[ "$OS" == "Linux" ]]; then
  echo "Detected Linux."
  install_rust
else
  echo "Unsupported operating system: $OS"
  exit 1
fi

# Verify Rust installation
if command -v rustc >/dev/null 2>&1; then
  echo "Rust installed successfully."
  echo "Rustc version: $(rustc --version)"
  echo "Cargo version: $(cargo --version)"
else
  echo "Rust installation failed."
  exit 1
fi
