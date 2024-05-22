{lib,...}:{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
  };
  home.file.".config/nvim".source = ./config;
}
