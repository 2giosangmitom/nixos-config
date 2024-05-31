{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium.fhs;
    userSettings = {
      terminal.integrated.defaultProfile.linux = "fish";
      editor.fontFamily = "JetBrainsMono Nerd Font";
      git.openRepositoryInParentFolders = "always";
      workbench.iconTheme = "material-icon-theme";
      typescript = {
        editor.defaultFormatter = "esbenp.prettier-vscode";
      };
      vue = {
        editor.defaultFormatter = "esbenp.prettier-vscode";
      };
      javascript = {
        editor.defaultFormatter = "esbenp.prettier-vscode";
      };
      workbench.startupEditor = "none";
      git.confirmSync = false;
      vue.server.hybridMode = true;
      files.watcherExclude = {
        "**/.git/objects/**" = true;
        "**/node_modules/**" = true;
        "**/dist/**" = true;
      };
      editor.minimap.enabled = false;
      editor.tabSize = 2;
      workbench.colorTheme = "Tokyo Night Dark";
      workbench.editor.enablePreview = false;
      editor.accessibilitySupport = "off";
      editor.bracketPairColorization.independentColorPoolPerBracketType = true;
      workbench.tips.enabled = false;
      breadcrumbs.filePath = "off";
      jsonc = {
        editor.defaultFormatter = "esbenp.prettier-vscode";
      };
    };
  };
}
