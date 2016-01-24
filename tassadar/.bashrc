# tassadar .bashrc

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' -e 's/^[ \t]*//'
}

# setaf 1-red 2-green 3-yellow 4-blue 5-purple 6-liteblue
MAIN_PROMPT=$'\u03bb '
export PS1="\[$(tput setaf 6)\][ \u@\h | \w ] \[$(tput setaf 3)\]\$(parse_git_branch)\n\[$(tput setaf 5)\]${MAIN_PROMPT}\[$(tput sgr0)\]"

unset SSH_ASKPASS

export DEVDIR="${HOME}/Documents/Development"

# Golang
export GOPATH="${DEVDIR}/go"

# Dank Aliases
alias ls="ls --color"
alias dev="cd ${DEVDIR}"

# Copy and push bashrc updtes
function push_bashrc {
	cd ${DEVDIR}/dotfiles
	cp ~/.bashrc ./tassadar/.bashrc
	git add . -A
	git status
	git commit -m "updated tassadar bashrc on `date +%D`"
	git push
}

