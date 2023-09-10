starship init fish | source
set -U fish_greeting
set -gx TERM xterm-256color
builtin history clear
export GPG_TTY=$(tty)
export EDITOR=nvim