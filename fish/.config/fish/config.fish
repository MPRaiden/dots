if status is-interactive
    # Commands to run in interactive sessions can go here
end

# FZF Integration
# Initialize fzf and optimize with fd
if type -q fzf
    # 1. Use fd to find ONLY directories for a cleaner navigation experience
    # --hidden: find hidden dirs, --exclude .git: stay out of the rabbit hole
    set -gx FZF_ALT_C_COMMAND 'fd --type d --strip-cwd-prefix --hidden --exclude .git'
    
    # This ensures that even the default search prefers directories if you prefer
    set -gx FZF_DEFAULT_COMMAND 'fd --type d --strip-cwd-prefix --hidden --exclude .git'

    # 2. Initialize
    fzf --fish | source

    # 3. Custom Ctrl+F to JUMP to a directory
    # We use fzf-cd-widget so that pressing Enter actually 'cd's you there
    bind \cf fzf-cd-widget
    bind -M insert \cf fzf-cd-widget
end

# PATH Setup
set -Ux PATH $PATH /home/mpr/.cargo/bin
set -Ux PATH $PATH /usr/local/go/bin
set -Ux PATH $PATH $HOME/go/bin
set -Ux PATH $HOME/scripts $PATH

# Aliases
alias ls "ls -a --color"
alias v "nvim"

# Editor Settings
set -Ux EDITOR nvim
set -Ux GIT_EDITOR nvim
set -Ux VISUAL nvim

bind -M insert \cp up-or-search
bind -M insert \cn down-or-search
bind -M insert \cc forward-char

# History
set -Ux fish_history fish

fish_add_path $HOME/go/bin

# TMUX
set -Ux TMUX_PLUGIN_MANAGER_PATH ~/.tmux/plugins

# Enable vi & blinking block cursor (both insert & normal mode)
fish_vi_key_bindings
set fish_cursor_insert block blink
set fish_cursor_normal block blink

# Remove everything from right prompt
# set --universal tide_right_prompt_items

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mpr/Downloads/google-cloud-cli-linux-x86_64/google-cloud-sdk/path.fish.inc' ]; . '/home/mpr/Downloads/google-cloud-cli-linux-x86_64/google-cloud-sdk/path.fish.inc'; end
