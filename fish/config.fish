starship init fish | source
set -U fish_greeting
set -gx TERM xterm-256color

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx /usr/bin/i3 -- -keeptty
    end
end

function on_exit --on-process %self
    builtin history clear
end
on_exit
