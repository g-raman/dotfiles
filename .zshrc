# Variables
export XDG_CONFIG_HOME="$HOME/.config"

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
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Alias for ls
alias ls="eza -1 -a -l --sort extension --group-directories-first --no-user"
alias gs="git status"
alias gl='git log --graph --all --pretty=format:"%C(bold blue)%h %C(bold green)(%ar) %C(white)- %an%C(reset)%C(auto)%d%n %C(white)%s %n"'
alias gb="git switch \$(git branch | fzf | sed 's/^..//')"
alias gsm="git switch main"
alias grm="git rebase main"
alias gd='git diff'
alias gds="gd --staged"
alias gpom="git pull origin main"
alias gfom="git fetch origin main:main"

alias lg="lazygit"


# Set shell prompt
eval "$(starship init zsh)"

# Fzf options
eval "$(fzf --zsh)"

export FZF_DEFAULT_OPTS="\
--height 40% --layout=reverse --info='right' \
--scrollbar="" --separator="" --prompt='❯ ' \
--pointer="" \
--color=bg+:#313244,bg:#1e1e2e,gutter:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#a6e3a1 \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

export FZF_CTRL_T_COMMAND=""

find_files() {              
  fd --type f --hidden -E .git -E .DS_Store -E node_modules | fzf-tmux \
    -p 85%,65% --preview 'bat --color=always \
    --style="snip,changes,header,header-filename,rule" {}' --preview-window right,50% \
    --bind 'ctrl-p:change-preview-window(50%|hidden|)' | xargs nvim
}

open_file() {
  fd --type f --hidden -E .git -E .DS_Store -E node_modules | fzf-tmux \
    -p 85%,65% --preview 'bat --color=always \
    --style="snip,changes,header,header-filename,rule" {}' --preview-window right,50% \
    --bind 'ctrl-p:change-preview-window(50%|hidden|)' | xargs -I % open %
}

bindkey -s "^f" 'find_files\n'
bindkey -s "^o" 'open_file\n'


# Change location of history files
mkdir -p ~/.cache/history
export NODE_REPL_HISTORY=~/.cache/history/node_history
export LESSHISTFILE=-

# Nvm
export NVM_DIR="$HOME/.nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PNPM_HOME="/Users/raman/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="/Users/raman/.cargo/bin/:$PATH"
