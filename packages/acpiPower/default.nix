let
  acpiPower = import ./overlay.nix;
  pkgs = import <nixpkgs> { overlays = [ acpiPower ]; };
in
pkgs.acpiPower
