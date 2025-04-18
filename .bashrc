#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Function to get the current Git branch
function parse_git_branch {
	local branch=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
	if [ -n "$branch" ]; then
    	echo "($branch)"
  	fi
}
PS1='\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\[\e[31m\]$(parse_git_branch)\[\e[0m\]\$ '

