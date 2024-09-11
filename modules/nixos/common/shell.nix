{ pkgs, ... }:
{
  programs.fish.enable = true;
  programs.zsh.enable = true;

  users.defaultUserShell = pkgs.zsh;
}
