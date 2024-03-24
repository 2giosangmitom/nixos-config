{pkgs-unstable, ...}: {
  programs.fish = {
    enable = true;
    package = pkgs-unstable.fish;
    interactiveShellInit = ''
      starship init fish | source
      set -U fish_greeting
      builtin history clear
    '';
    shellAliases = let
      fzf_script = ./scripts/fzf.sh;
    in {
      ls = "eza";
      cat = "bat";
      e = "${fzf_script} e";
      crb = "${fzf_script} checkout_recent_branch";
      db = "${fzf_script} delete_branch";
    };
  };
}
