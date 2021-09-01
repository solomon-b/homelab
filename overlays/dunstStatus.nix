let
  sources = import ../nix/sources.nix;
in
self: super:
{
  dunstStatus =
    self.haskellPackages.callCabal2nix "dunstStatus" sources.dunstStatus { };
}
