# --- 1. COMPLETION SYSTEM ---
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # Case-insensitive
zstyle ':completion:*' menu select                 # Visual menu
setopt AUTO_CD                                     # Type dir name to 'cd'

# --- 2. HISTORY ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt PROMPT_SUBST

# --- 3. PROMPT STYLING (Macchiato) ---
# Colors
CLR_BLUE="%F{blue}"
CLR_GREEN="%F{green}"
CLR_GIT="%F{red}"
CLR_HOST="%F{cyan}"
CLR_PURPLE="%F{magenta}"
CLR_RESET="%f"

# Git branch info
function git_info() {
  local branch=$(git branch --show-current 2>/dev/null)
  if [ -n "$branch" ]; then
    echo " ${CLR_GIT} $branch${CLR_RESET}"
  fi
}

# Prompt: [user] at [host] in [CWD] [git]
# %~ shows the CWD relative to home
PROMPT="${CLR_BLUE}%n${CLR_HOST}@%m ${CLR_GREEN}%B%~%b${CLR_RESET}"
PROMPT+='$(git_info)'
PROMPT+="${CLR_PURPLE} ❯ ${CLR_RESET}"

# --- 1. THEME ---
if [ -f ~/.zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh
fi

# --- 2. APT PLUGINS  ---
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

