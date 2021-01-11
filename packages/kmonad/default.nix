let
  kmonad = import ./overlay.nix;
  pkgs = import <nixpkgs> { overlays = [ kmonad ]; };
in
pkgs.kmonad
