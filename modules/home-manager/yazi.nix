{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    catppuccin.enable = true;
    settings = {
      log = {
        enabled = false;
      };
      manager = {
        show_hidden = true;
        sort_dir_first = true;
      };
    };
  };
}
