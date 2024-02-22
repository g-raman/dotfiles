# Zap setup
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"


# Load and initialise completion system
mkdir -p ~/.cache/zsh
autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION


# Alias for ls
alias ls="eza -1 -a -l --sort extension --group-directories-first --no-user"
alias lt="ls --tree --no-user --no-permissions --no-filesize --no-time -I .git --level=3"


# Set shell prompt
eval "$(starship init zsh)"


# Change location of history files
mkdir -p ~/.cache/history
export NODE_REPL_HISTORY=~/.cache/history/node_history
export LESSHISTFILE=-
