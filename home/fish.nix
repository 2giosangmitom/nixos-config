{pkgs-unstable, ...}: {
  programs.fish = {
    enable = true;
    package = pkgs-unstable.fish;
    interactiveShellInit = ''
      starship init fish | source
      set -U fish_greeting
      builtin history clear
    '';
    shellAliases = {
      ls = "eza";
      cat = "bat";
    };
  };
}
