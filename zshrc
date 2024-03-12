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
zplug "bigH/git-fuzzy",                         defer:0, as:command, use:"bin/git-fuzzy"

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
alias grb="git rev-parse --abbrev-ref HEAD | xargs -I {} git reset --hard origin/{}"
alias gfpb="git rev-parse --abbrev-ref HEAD | xargs git push --force origin"
alias gack="git ls-files --others --cached --exclude-standard | ack -x"
alias gcamn="git commit -a --no-verify -m"
alias gch='git checkout `git fuzzy branch`'
alias gwip="git add . && git commit -m "WIP" --no-verify"
alias tf=terraform
alias tn='tmux new -s'

# Watson
alias wr="watson restart"
alias ws="watson stop"
alias wl="watson log"
alias wst="watson status"
alias wrm="watson report --from {$(date +%Y-%m-01)}"

# AWS
alias ass="aws sso login --profile"

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

# Krew (kubectl plugin manager)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export TV4_WAF_BYPASS='testsuite-UFZEaXVSZWFJZV91ZXlxeTh2dHFTRzJSalQ4Cg=='

# Hooks
precmd () {
    # Rename window to git repo name
    git rev-parse --is-inside-work-tree 2> /dev/null > /dev/null
    if [[ $? -eq 0 ]]; then
        git rev-parse --show-toplevel | xargs basename | xargs tmux rename-window
    fi
}

# Zoxide
# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

