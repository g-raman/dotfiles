# Zap setup
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"


# Load and initialise completion system
mkdir -p ~/.cache/zsh
autoload -Uz compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION


# Move location of .zsh_history
export HISTFILE=~/.cache/zsh/zsh_history


# Alias for ls
alias ls="eza -1 -a -l --sort extension --group-directories-first --no-user"
alias lt="ls --tree --no-user --no-permissions --no-filesize --no-time -I .git --level=3"


# Set shell prompt
eval "$(starship init zsh)"

# Fzf options
eval "$(fzf --zsh)"

export FZF_DEFAULT_OPTS="\
--height 40% --layout=reverse --info='right' \
--scrollbar="" --separator="" --prompt='❯ ' \
--pointer="" \
--color=bg+:#313244,bg:#1e1e2e,border:#cdd6f4,gutter:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#a6e3a1 \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

export FZF_CTRL_T_COMMAND=""

find_files() {              
  fd --type f --hidden -E .git -E .DS_Store -E node_modules | fzf-tmux \
    -p 85%,65% --preview 'bat --color=always \
    --style="snip,changes,header,header-filename,rule" {}' --preview-window right,50% \
    --bind 'ctrl-p:change-preview-window(50%|hidden|)' | xargs nvim
}

bindkey -s "^f" 'find_files\n'


# Change location of history files
mkdir -p ~/.cache/history
export NODE_REPL_HISTORY=~/.cache/history/node_history
export LESSHISTFILE=-
