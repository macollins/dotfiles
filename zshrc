# Is there any other editor?
export EDITOR=vim

# Vi mode please
bindkey -v

# Reduce wait time between key sequences to 0.2 seconds from default 0.4
export KEYTIMEOUT=2

# Activate rbenv if installed
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Load AWS CLI completion if installed
if which aws_zsh_completer.sh > /dev/null; then source `which aws_zsh_completer.sh`; fi

# Location of completion files
fpath=(~/dotfiles/zsh/completions $fpath)

# Initialize completion system
autoload -U compinit
compinit

# Helpful prompt
source ~/dotfiles/zsh/git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
precmd () { __git_ps1 "[%n@%m] %~%s" " $ "}

# Configure pip for Python development
export PIP_REQUIRE_VIRTUALENV=true     # Only run pip when virtualenv activated
export PIP_DOWNLOAD_CACHE=~/.pip/cache # Cache pip installed packaged

# Aliases

# ls
alias ll='ls -hl'
alias lla='ls -hal'
alias llt='ls -hltr'
alias lsd='ls -l | grep "^d" ' # list directories only

# top
alias tc='top -o cpu'
alias tm='top -o vsize'

# Bundler
alias be='bundle exec '
alias bx='bundle exec '

# Development
alias bert='bundle exec rake test'

export PATH=/usr/local/sbin:$PATH
