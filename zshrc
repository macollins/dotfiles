# Is there any other editor?
export EDITOR=vim

# Vi mode please
bindkey -v

# Reduce wait time between key sequences to 0.2 seconds from default 0.4
export KEYTIMEOUT=2

# Activate rbenv if installed
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Location of completion files
fpath=(~/dotfiles/zsh/completions $fpath)

# Initialize completion system
autoload -U compinit
compinit

# Load AWS CLI completion if installed (after compinit has run)
if which aws_zsh_completer.sh > /dev/null; then source `which aws_zsh_completer.sh`; fi

# Helpful prompt
source ~/dotfiles/zsh/git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
precmd () { __git_ps1 "[%n@%m] %~%s" " $ "}

# Configure pip for Python development
export PIP_REQUIRE_VIRTUALENV=true     # Only run pip when virtualenv activated
export PIP_DOWNLOAD_CACHE=~/.pip/cache # Cache pip installed packaged

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt append_history         # Append new history to existing history
setopt inc_append_history     # Don't wait for shell to exit before appending commands
setopt hist_ignore_dups       # Do not store command if same as previous
setopt hist_expire_dups_first # When history is full remove dups first
setopt hist_no_store          # Do not store history or fc commands

# Prevent annoying XON/XOFF behavior
# See: http://superuser.com/questions/124845/can-you-disable-the-ctrl-s-xoff-keystroke-in-putty
stty -ixon

# Aliases

alias utcdate='TZ=utc date'

# history
alias h='history 1'

# ls
alias ll='ls -hl'
alias lla='ls -hal'
alias llt='ls -hltr'
alias lsd='ls -l | grep "^d" ' # list directories only

# top
alias tc='top -o cpu'
alias tm='top -o vsize'

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Bundler
alias be='bundle exec '

# Silver Searcher
alias agr='ag --ruby'

# Colorize man pages
# See: http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
man() {
  env \
    LESS_TERMCAP_mb=$'\e[1;36m' \
    LESS_TERMCAP_md=$'\e[1;36m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[1;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[1;32m' \
    man "$@"
}

# Git

# See: https://github.com/thoughtbot/dotfiles/blob/6a034a7d659ef332345d17d55aaf47994aa9f96b/zsh/functions/g
# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}

# Complete g like git
compdef g=git

# Ruby development
alias bert='bundle exec rake test'

# Go development
export GOPATH=~/Development/go

export PATH=/usr/local/sbin:$PATH
