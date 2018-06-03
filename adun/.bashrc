# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# ===================================

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

# Golang install
export PATH=${PATH}:/usr/local/go/bin:${HOME}/Development/bin
export GOPATH=${HOME}/Development

alias github="cd ${HOME}/Development/src/github.com"
alias projects="cd ${HOME}/Development/src/github.com/gavincabbage"

# added by travis gem
[ -f /home/gavin/.travis/travis.sh ] && source /home/gavin/.travis/travis.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
