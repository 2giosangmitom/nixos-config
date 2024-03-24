#!/usr/bin/env bash

e() {
	nvim $(fzf --preview 'bat --style=numbers --color=always {}' --border -m)
}

checkout_recent_branch() {
	git branch --sort=-committerdate | fzf --preview "git diff --color=always {1}" --border | xargs git checkout
}

delete_branch() {
	git branch --sort=-committerdate | fzf --preview "git diff --color=always {1}" --border -m | xargs git branch -D
}

case $1 in
e) e ;;
checkout_recent_branch) checkout_recent_branch ;;
delete_branch) delete_branch ;;
esac
