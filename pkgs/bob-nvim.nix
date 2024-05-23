{pkgs, ...}:
pkgs.stdenv.mkDerivation rec {
  pname = "bob-nvim";
  version = "v2.9.1";

  src = pkgs.fetchurl {
    url = "https://github.com/MordechaiHadad/bob/releases/download/v2.9.1/bob-linux-x86_64.zip";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };
}
