#!/bin/bash

# Exit on error
set -e

DOTFILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# --- TOOL FUNCTIONS ---
setup_alacritty() {
    echo "🖥️  Setting up Alacritty..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt install -y alacritty
    fi
    rm -rf ~/.config/alacritty
    stow alacritty
}

setup_zsh() {
    echo "🐚 Setting up Zsh & Catppuccin theme..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt install -y zsh zsh-syntax-highlighting zsh-autosuggestions
    fi

    # Clean and stow
    rm -f ~/.zshrc
    rm -rf ~/.zsh
    mkdir -p "$HOME/.zsh"
    stow zsh

    # Theme logic
    if [ ! -d "/tmp/catppuccin-zsh" ]; then
        git clone --depth 1 https://github.com /tmp/catppuccin-zsh
    fi
    cp /tmp/catppuccin-zsh/themes/catppuccin_macchiato-zsh-syntax-highlighting.zsh "$HOME/.zsh/"

    # Shell switch
    if [ "$SHELL" != "$(which zsh)" ]; then
        echo "Changing default shell to Zsh..."
        chsh -s "$(which zsh)"
    fi
}

setup_tmux() {
    echo "🪟 Setting up Tmux & TPM..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt install -y tmux procps
    fi

    rm -f ~/.tmux.conf
    stow tmux

    TPM_DIR="$HOME/.config/tmux/plugins/tpm"
    if [ ! -d "$TPM_DIR" ]; then
        git clone https://github.com "$TPM_DIR"
        "$TPM_DIR/bin/install_plugins"
    fi
}

setup_neovim() {
    echo "🌙 Setting up Neovim..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if ! command -v nvim &> /dev/null; then
            sudo snap install nvim --classic
        fi
    fi
    rm -rf ~/.config/nvim
    stow nvim
}


# --- MAIN EXECUTION ---

echo "🚀 Starting Dotfiles Bootstrap..."

# 1. Essential System Tools
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt update && sudo apt install -y stow curl git
fi

# 2. Execute Tool Setups
cd "$DOTFILES_DIR"
setup_alacritty
setup_zsh
setup_tmux
setup_neovim

echo "✅ Setup Complete!"

