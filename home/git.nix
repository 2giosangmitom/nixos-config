{pkgs-unstable, ...}: {
  programs.git = {
    enable = true;
    package = pkgs-unstable.git;
    userName = "Vo Quang Chien";
    userEmail = "yeuxacucodon.dev@proton.me";
    delta = {
      enable = true;
      package = pkgs-unstable.delta;
    };
  };
}
