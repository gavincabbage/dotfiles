# .bash_profile for shipper

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Dank prompt
_is_git_repo() {
	git status 2> /dev/null
	if [ $? -eq 0 ]
	then
		return 0
	else
		return 1
	fi
}
parse_git_branch() {
	if [ _is_git_repo ]
	then
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' -e 's/^[ \t]*//'
  fi
}
main_prompt="λ"
export PS1="\[$(tput setaf 6)\][ \u@\h | \w ] \[$(tput setaf 3)\]\$(parse_git_branch)\n\[$(tput setaf 5)\]${main_prompt}\[$(tput sgr0)\] "

# CLI colors (e.g. ls)
export CLICOLORS=1

# Golang install
export PATH=${PATH}:/usr/local/go/bin:${HOME}/Development/bin
export GOPATH=${HOME}/Development

# Directory aliases
alias cdgithub="cd ${HOME}/Development/src/github.com"
alias cdme="cd ${HOME}/Development/src/github.com/gavincabbage"
alias cdcodeship="cd ${HOME}/Development/src/github.com/codeship"
alias projects="cd ${HOME}/Development/src/github.com/gavincabbage"

