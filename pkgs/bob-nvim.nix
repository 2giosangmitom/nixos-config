{ pkgs, ... }:
pkgs.stdenv.mkDerivation rec {
  pname = "bob-nvim";
  version = "v3.0.1";

  src = pkgs.fetchurl {
    url = "https://github.com/MordechaiHadad/bob/releases/download/${version}/bob-linux-x86_64.zip";
    hash = "sha256-p95vFHr318ddWa4j1IpsBO0ebPS5HHkjtTeAfeES0gY=";
  };

  dontConfigure = true;
  dontBuild = true;
  buildInputs = with pkgs; [ unzip ];

  installPhase = ''
    runHook preInstall

    install -Dm 755 ./bob $out/bin/bob

    runHook postInstall
  '';
}
