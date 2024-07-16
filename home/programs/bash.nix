{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historySize = 100;
    historyControl = [
      "erasedups"
      "ignoredups"
      "ignorespace"
    ];
    historyIgnore = [
      "sway"
      "Hyprland"
    ];
    shellAliases = {
      ls = "eza";
    };
    bashrcExtra = ''
      PATH=$PATH:~/.local/share/bob/nvim-bin
    '';
    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
}
