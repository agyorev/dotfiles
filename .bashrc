# go up $1 number of directories
up() {
  if [[ -z $1 ]]; then
    cd ..
  else
    local path i
    for (( i=0; i < $1; i++ )); do
      path+=../
    done
    cd "$path"
  fi
}

# easily extract all compresed file formats
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# git branch in prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# alight the current time to the right
right_align_time() {
  printf "%*s\r" $(( COLUMNS-1 )) "$(date +%H:%M:%S)"
}

# (user @ host): <pwd>
#  (<git branch>) ↳$
export PS1="\$(right_align_time)\[\033[01;32m\](\u @ $(scutil --get ComputerName))\[\033[00m\]: \[\033[01;33m\]\w \n\[\033[01;35m\]\$(parse_git_branch) \[\033[01;32m\]↳ \[\033[00m\]$ "

# enabling OS X terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# setting the default editor
export EDITOR=/usr/bin/vim

# setting history size
export HISTSIZE=100000000
export HISTFILESIZE=10000000000

alias ll="ls -l"
alias la="ls -lA"

# quick file search
alias qfind="find . -name "

# javascript run engine alias
alias jsc="/System/Library/Frameworks/JavaScriptCore.framework/Resources/jsc"

# bash completion 
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# enables i-search
stty -ixon

