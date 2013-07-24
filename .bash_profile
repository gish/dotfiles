# Command line appearance
export PS1="\A:\W:\[\033[1;31m\[\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$\[\033[0;30m "

# Path vars
## Python 2.6
PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/opt/local/bin
PATH=/Library/Frameworks/GTK+.framework/Resources/bin:$PATH
## Git hooks
PATH="/usr/local/sbin/git-hooks/:${PATH}"
export PATH

# Standard editor
export EDITOR='subl -w'

# Aliases
## Git
alias gs='git status -sb'
alias ga='git add . && git add -u'
alias gc='git commit'
alias gd='git diff'
alias gl='git lg'
alias gp='git push'

# Miscellaneous
export MANPATH=$MANPATH:/opt/local/share/man
export INFOPATH=$INFOPATH:/opt/local/share/info
test -r /sw/bin/init.sh && . /sw/bin/init.sh