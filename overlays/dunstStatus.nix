self: super:
{
  dunstStatus = self.haskellPackages.callCabal2nix "dunstStatus"
    (self.fetchFromGitHub {
      owner = "ssbothwell";
      repo = "dunstStatus";
      rev = "f8185ed70c61b9b819c80a367ccc5646ca6da129";
      sha256 = "0prjc64s44ggq431f3z9q943413pvg1p2ln4wwc4wgh3s6r5x7cd";
    }) { };
}
