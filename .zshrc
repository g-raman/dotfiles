# Zap setup
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"


# Load and initialise completion system
autoload -Uz compinit
compinit


# Alias for ls
alias ls="eza -1 -a -l --sort extension --group-directories-first"


# Set shell prompt
eval "$(starship init zsh)"


# Move location of zcompdump files
export ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/.zcompdump"


# Change location of history files
mkdir -p ~/.cache/history
export NODE_REPL_HISTORY=~/.cache/history/node_history
export LESSHISTFILE=-
