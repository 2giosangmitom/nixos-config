{
    programs.neovim = {
        enable = true;
        extraConfig = lib.fileContents ./init.lua;
      };
  }
