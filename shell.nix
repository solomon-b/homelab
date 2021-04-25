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
#{
#  nixpkgs ? builtins.fetchTarball {
#    url = "https://github.com/NixOS/nixpkgs/tarball/cd63096d6d887d689543a0b97743d28995bc9bc3";
#    sha256 = "1wg61h4gndm3vcprdcg7rc4s1v3jkm5xd7lw8r2f67w502y94gcy";
#  },
#  nixops ? builtins.fetchTarball {
#    url = "https://github.com/NixOS/nixops/tarball/23db83fc91952d2dbcc64b8aa1ac16f8c8f45bed";
#    sha256 = "0dpw82hs5kqrrvv7gcrdpjms1dq93431fzg9hrxqs0b9spl2rl6r";
#  }
#}:
#let
#  nixops-overlay = _: _: {
#    nixops = (import nixops).default;
#  };
#  pkgs = import nixpkgs {
#    overlays = [ nixops-overlay ];
#  };
#in
#pkgs.mkShell {
#  buildInputs = [
#    pkgs.nixops
#  ];
#}
