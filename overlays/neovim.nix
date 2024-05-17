(final: prev: {
  neovim = prev.neovim.overrideAttrs (old: rec {
    version = "v0.10.0";
    src = prev.fetchurl {
      url = "https://github.com/neovim/neovim/releases/download/${version}/nvim-linux64.tar.gz";
      sha256 = "be1f0988d0de71c375982b87b86cd28d2bab35ece8285abe3b0aac57604dfc5a";
    };
  });
})
