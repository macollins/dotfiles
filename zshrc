# Is there any other editor?
export EDITOR=vim

# Vi mode please
bindkey -v

# Reduce wait time between key sequences to 0.2 seconds from default 0.4
export KEYTIMEOUT=2

# Activate rbenv if installed
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export EDITOR=vim
