{lib,...}:{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
    xdg.configFile."nvim".source = import ./config;
  };
}
