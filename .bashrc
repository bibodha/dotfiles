alias vim='/usr/local/bin/vim'
alias t='echo this is a test'

#export MONGOHQ_URL="mongodb://localhost:27017/signin"


#Git branch in prompt
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]$ "

