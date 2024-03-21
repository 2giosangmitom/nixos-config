{
  programs.fish = {
    enable = true;
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
