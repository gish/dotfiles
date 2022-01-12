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
zplug load
if ! zplug check --verbose; then
  zplug install
fi

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"


# Plugins
plugins=(git vi-mode zsh-syntax-highlighting zsh-autosuggestions tmux bgnotify)


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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias grhom="git reset --hard origin/master"
alias gfpb="git rev-parse --abbrev-ref HEAD | xargs git push --force origin"
alias trwgrn="git rev-parse --show-toplevel | xargs basename | xargs tmux rename-window"
alias gack="git ls-files --others --cached --exclude-standard | ack -x"

export TERM="xterm-256color"

export PATH="$HOME/.yarn/bin:$PATH"
