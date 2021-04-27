{ ... }:

let
  sources = import ../../../../nix/sources.nix;
in
{
  nix.nixPath = [ "nixpkgs=${sources.nixpkgs}" ];

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (import ../../../../overlays/acpiPower.nix)
      (import ../../../../overlays/dunstStatus.nix)
    ];
  };

  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 14d";
  nix.gc.dates = "03:15";
  nix.autoOptimiseStore = true;
}
