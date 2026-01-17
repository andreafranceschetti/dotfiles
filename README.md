# 🛠️ dotfiles

My minimalist, high-performance terminal-based IDE setup for 2026. 
Optimized for **C++** and **Python** development with support for **Devcontainers**.

## 📦 Core Stack

| Component | Choice | Description |
| :--- | :--- | :--- |
| **Terminal** | [Alacritty](https://alacritty.org) | GPU-accelerated & minimalist. |
| **Multiplexer** | [Tmux](https://github.com) | With [TPM](https://github.com) for plugin management. |
| **Editor** | [Neovim](https://neovim.io) | Built on the [Kickstart](https://github.com) foundation. |
| **Shell** | [Zsh](https://www.zsh.org) | Faster than light with custom aliases. |
| **Manager** | [GNU Stow](https://www.gnu.org) | Symlink-based portable configuration. |

## 🎨 Aesthetic: Catppuccin

Unified colorscheme across the entire stack using the **Macchiato** palette.

*   **Terminal:** [Alacritty Catppuccin](https://github.com/alacritty/alacritty-theme) (Managed via submodules)
*   **Multiplexer:** [Tmux Catppuccin](https://github.com/catppuccin/tmux)
*   **Editor:** [Catppuccin for Neovim](https://github.com/catppuccin/nvim)

## 🚀 Quick Start

This repo is designed to be portable. It includes a bootstrap script that installs dependencies (Stow, Tmux, Nvim) and symlinks the configs.

```bash
git clone --recursive https://github.com/andreafranceschetti/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh

