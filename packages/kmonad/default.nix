let
  sources = import ../../nix/sources.nix;
  kmonad = import ./overlay.nix;
  pkgs = import sources.nixpkgs { overlays = [ kmonad ]; };
in
pkgs.kmonad
