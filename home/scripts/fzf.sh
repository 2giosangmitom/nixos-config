#!/usr/bin/env bash

e() {
	nvim $(fzf --preview 'bat --style=numbers --color=always {}' --border -m)
}

case $1 in
e) e ;;
esac
