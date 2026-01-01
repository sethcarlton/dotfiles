#!/usr/bin/env bash

echo "Installing dependencies..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Error: Homebrew not found."
    echo ""
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Install Homebrew: https://brew.sh"
    else
        echo "Install Homebrew for Linux: https://docs.brew.sh/Homebrew-on-Linux"
    fi
    exit 1
fi

echo "Using Homebrew..."

# Tap Beads repository
brew tap steveyegge/beads

# Install all dependencies
brew install fzf tmux bd

echo ""
echo "Installing oh-my-zsh plugins..."

# Install zsh-autosuggestions
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    echo "✓ Installed zsh-autosuggestions"
else
    echo "✓ zsh-autosuggestions already installed"
fi

# Install zsh-syntax-highlighting
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    echo "✓ Installed zsh-syntax-highlighting"
else
    echo "✓ zsh-syntax-highlighting already installed"
fi

echo ""
echo "✓ Dependencies installed successfully!"
