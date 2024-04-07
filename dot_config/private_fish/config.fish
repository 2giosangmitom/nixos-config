export GPG_TTY=$(tty)
export EDITOR="nvim"
starship init fish | source
set -U fish_greeting
builtin history clear
