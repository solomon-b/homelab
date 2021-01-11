{ pkgs, ... }:

pkgs.haskell.packages.ghc8102.callCabal2nix "acpiPower"
    (pkgs.fetchFromGitHub {
      owner = "ssbothwell";
      repo = "acpiPower";
      rev = "772b7b607ef880f9d119d4c23b67aedfc6a79a27";
      sha256 = "0iilf1qlm93ms06488fhhrbqbhqllrx31fgz35ld75rr4zy1yl6a";
    }) { }
