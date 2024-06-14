{pkgs}:
pkgs.stdenv.mkDerivation rec {
  pname = "bob-nvim";
  version = "v2.9.1";

  src = pkgs.fetchurl {
    url = "https://github.com/MordechaiHadad/bob/releases/download/${version}/bob-linux-x86_64.zip";
    hash = "sha256-iH/YbnSLEPIB9jhb6m/4aTnGHLpqHc9jv77wfLrN9gI=";
  };

  dontConfigure = true;
  dontBuild = true;
  buildInputs = with pkgs; [unzip];

  installPhase = ''
    runHook preInstall

    install -Dm 755 ./bob $out/bin/bob

    runHook postInstall
  '';
}
