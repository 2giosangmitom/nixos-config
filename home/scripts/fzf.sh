#!/usr/bin/env bash

edit() {
	nvim "$(fzf --preview 'bat --style=numbers --color=always {}' --border -m)"
}

checkout_recent_branch() {
	git branch --sort=-committerdate --format=$'%(HEAD) %(refname:short) (%(committerdate:relative)) - %(subject)' | fzf --preview "git diff --color=always {1}" --border | sed 's/ (.*//' | xargs git checkout
}

delete_branch() {
	git branch --sort=-committerdate --format=$'%(HEAD) %(refname:short) (%(committerdate:relative)) - %(subject)' | fzf --preview "git diff --color=always {1}" --border -m | sed 's/ (.*//' | xargs git branch -D
}

case $1 in
edit) edit ;;
checkout_recent_branch) checkout_recent_branch ;;
delete_branch) delete_branch ;;
esac
