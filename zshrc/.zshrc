# Remove Starship (you had this before)
# eval "$(starship init zsh)"

# Load Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Plugins via Oh My Zsh (instead of zinit)
plugins=(
  git
  sudo
  command-not-found
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
)

source $ZSH/oh-my-zsh.sh

# Set Homebrew if it exists
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Manually source fzf-tab if needed (not in Oh My Zsh by default)
# Clone fzf-tab if not present
FZF_TAB_DIR="${HOME}/.oh-my-zsh/custom/plugins/fzf-tab"
if [ ! -d "$FZF_TAB_DIR" ]; then
  git clone https://github.com/Aloxaf/fzf-tab "$FZF_TAB_DIR"
fi

# Source fzf-tab manually
source "${FZF_TAB_DIR}/fzf-tab.plugin.zsh"

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=1000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls -a --color'
alias v='neovide'
alias c='clear'

# Shell integrations
eval "$(fzf --zsh)"

# PATH additions
export PATH=$PATH:/home/mpr/.cargo/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH="$HOME/scripts:$PATH"

# Tmux plugin manager path
export TMUX_PLUGIN_MANAGER_PATH=~/.tmux/plugins

# Editor preferences
export EDITOR="nvim"
export GIT_EDITOR="nvim"
export VISUAL="nvim"

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

