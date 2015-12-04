# tassadar .bashrc

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' -e 's/^[ \t]*//'
}

# setaf 1-red 2-green 3-yellow 4-blue 5-purple 6-liteblue
MAIN_PROMPT=$'shalashashka? '
FIRST_LINE=7
GIT_BRANCH=7
PROMT=7
OUTPUT=2
export PS1="\[$(tput setaf $FIRST_LINE)\][ \u@\h | \w ] \[$(tput setaf $GIT_BRANCH)\]\$(parse_git_branch)\n\[$(tput setaf $PROMT)\]$MAIN_PROMPT\[$(tput setaf $OUTPUT)\]"

unset SSH_ASKPASS

export GOROOT=$HOME/Development/go
export GOPATH=$HOME
export PATH=$PATH:$GOROOT/bin
