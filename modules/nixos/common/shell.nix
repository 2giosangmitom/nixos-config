{ pkgs-unstable, ... }:
{
  # Needed for vendor fish-completions
  programs.fish.enable = true;

  users.defaultUserShell = pkgs-unstable.zsh;
}
