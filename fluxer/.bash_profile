# .bash_profile for fluxer

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source bash completion
source $(brew --prefix)/etc/bash_completion

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
export PATH=/usr/local/go/bin:${HOME}/Development/bin:${PATH}
export GOPATH=${HOME}/Development
export GOBIN=${GOPATH}/bin

# GPG installed with brew
export GPG_TTY=$(tty)

# Directory aliases
alias src="cd ${HOME}/Development/src"
alias influxsrc="cd ${HOME}/Development/src/github.com/influxdata"

# Misc. aliases
alias sourceit="source ~/.bash_profile"

# Functions
function kport() {
	local port=${1}
	lsof -i :${port} | awk 'NR>1{system("kill -9 " $2)}'
}
export PATH="$HOME/.cargo/bin:$PATH"

# gcloud
if [ -f '/Users/gcabbage/google-cloud-sdk/path.bash.inc' ]; then . '/Users/gcabbage/google-cloud-sdk/path.bash.inc'; fi
if [ -f '/Users/gcabbage/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/gcabbage/google-cloud-sdk/completion.bash.inc'; fi

# kubectl completion
source <(kubectl completion bash)

# IDPE
export USE_SIMPLE_STREAM_SERVICE=true
export GATEWAY_INFLUX_SETUP=true
function iup() {
	echo "Starting IDPE..."
	kubectx twodotoh
	kubectl config set-context twodotoh --cluster=docker-desktop --user=docker-desktop --namespace twodotoh
	kubectl config use-context twodotoh
	kubone run ./apps/gateway
}
function idown() {
	echo "Stopping IDPE..."
	kubectx twodotoh
	kubectl delete namespace twodotoh monitoring ingress-nginx tracing
}
function irestart() {
	idown
	echo "Waiting for namespace to terminate before recreating..."
	sleep 30
	iup
}