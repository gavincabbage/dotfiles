# tassadar .bashrc

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' -e 's/^[ \t]*//'
}

# setaf 1-red 2-green 3-yellow 4-blue 5-purple 6-liteblue
MAIN_PROMPT="En taro adun!"
export PS1="\[$(tput setaf 5)\][ \u@\h | \w ] \[$(tput setaf 3)\]\$(parse_git_branch)\n\[$(tput setaf 6)\]$MAIN_PROMPT\[$(tput sgr0)\] "

unset SSH_ASKPASS
