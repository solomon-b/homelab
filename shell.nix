let
  sources = import ./nix/sources.nix;
  nixops = import sources.nixops;

  nixops-overlay = _: _: {
    nixops = nixops.default;
  };

  pkgs = import sources.nixpkgs {
    overlays = [ nixops-overlay ];
  };

in
pkgs.mkShell {
  buildInputs = [
    pkgs.nixops
  ];
}
