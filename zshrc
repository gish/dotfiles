# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
PATH=$PATH:/usr/local/sbin
#
# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
source ~/.zplug/init.zsh

zplug 'dracula/zsh', as:theme
zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"
zplug "unixorn/fzf-zsh-plugin",                 defer:0
zplug load
if ! zplug check --verbose; then
  zplug install
fi

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"


# Plugins
plugins=(git vi-mode zsh-syntax-highlighting zsh-autosuggestions tmux bgnotify fzf-zsh-plugin)

# Tmux
#export ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

# User configuration
# VI mode
bindkey -v

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## Alias
alias grhom="git reset --hard origin/master"
alias gfpb="git rev-parse --abbrev-ref HEAD | xargs git push --force origin"
alias trwgrn="git rev-parse --show-toplevel | xargs basename | xargs tmux rename-window"
alias gack="git ls-files --others --cached --exclude-standard | ack -x"
alias tf=terraform

# Watson
alias wr="watson restart"
alias ws="watson stop"
alias wl="watson log"
alias wst="watson status"

# Vim
alias v="nvim"

export TERM="xterm-256color"

export PATH="$HOME/.yarn/bin:$PATH:/usr/local/go/bin:/home/ehedberg/.local/bin"

# pnpm
export PNPM_HOME="/home/ehedberg/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs --ignore=~/.ignore'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
