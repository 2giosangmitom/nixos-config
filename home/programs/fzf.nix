{
  programs.fzf = {
    enable = true;
    bashIntegration = true;
    catppuccin.enable = true;
    defaultCommand = "fd --type f";
    defaultOptions = ["--border"];
    fileWidgetCommand = "fd --type f";
    fileWidgetOptions = "--preview 'bat {}'";
    changeDirWidgetCommand = "fd --type d";
  };
}
