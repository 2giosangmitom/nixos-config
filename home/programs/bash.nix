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
      cat = "bat";
    };
    bashrcExtra = ''
      PATH=$PATH:~/.local/share/bob/nvim-bin
    '';
  };
}
