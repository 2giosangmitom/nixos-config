{ pkgs, ... }:
{
  programs.zsh.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;

  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "cp" ];
  };
  programs.zsh.shellAliases = {
    cat = "bat";

    ls = "eza";
    ll = "eza -l";
    la = "eza -a";
    lt = "eza -T";
    lla = "eza -la";
    llt = "eza -lT";

    cp = "cp -i";
    mv = "mv -i";
    rm = "rm -i";
  };
  users.defaultUserShell = pkgs.zsh;
}
