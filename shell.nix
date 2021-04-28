let
  sources = import ./nix/sources.nix;
  nixops = import sources.nixops;

  nixops-overlay = _: _: {
    nixops = nixops.default;
  };

  password-utils-overlay = self: _: {
    passwordUtils = (self.callPackage ./lib/passwords.nix { }).passwordUtils;
  };

  pkgs = import sources.nixpkgs {
    overlays = [ nixops-overlay password-utils-overlay ];
  };

in
pkgs.mkShell {
  buildInputs = [
    pkgs.nixops
    pkgs.passwordUtils
  ];
}
