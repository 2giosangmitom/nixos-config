starship init fish | source
set -U fish_greeting
set -gx TERM xterm-256color

function on_exit --on-process %self
    builtin history clear
end
on_exit

export GPG_TTY=$(tty)
