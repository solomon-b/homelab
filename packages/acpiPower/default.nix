let
  sources = import ../../nix/sources.nix;
  acpiPower = import ./overlay.nix;
  pkgs = import sources.nixpkgs { overlays = [ acpiPower ]; };
in
pkgs.acpiPower
