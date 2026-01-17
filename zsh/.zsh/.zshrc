# --- 1. THEME ---
# Load the Catppuccin theme file
source ~/.zsh/themes/catppuccin_macchiato.zsh-theme

# --- 2. PLUGINS (Ubuntu Apt Paths) ---
# Syntax Highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# Autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# --- 3. COMPLETION & HISTORY ---
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

