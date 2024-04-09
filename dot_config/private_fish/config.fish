export GPG_TTY=$(tty)
export EDITOR="nvim"
starship init fish | source
set -U fish_greeting
builtin history clear

alias e="~/.config/fish/fzf.sh edit"
alias crb="~/.config/fish/fzf.sh checkout_recent_branch"
alias db="~/.config/fish/fzf.sh delete_branch"
alias ls="eza"
alias cat="bat"
