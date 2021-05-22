let
  sources = import ./nix/sources.nix;
  nixpkgs = sources.nixpkgs;
  nixops = sources.nixops;
  nixops-built = (import nixops).default;

  mkExtraBuiltinsCli = pkgs: opts: builtins.concatStringsSep " " (
    pkgs.lib.mapAttrsToList (option: value: "--option ${option} ${value}") opts
  );

  extraBuiltinsOptions = pkgs: mkExtraBuiltinsCli pkgs {
    plugin-files = "${pkgs.nix-plugins}/lib/nix/plugins/libnix-extra-builtins.so";
    extra-builtins-file = ./lib/extra-builtins.nix;
  };

  nixops-wrapped = pkgs: pkgs.writeShellScriptBin "nixops" ''
    cmd=$1
    shift
    export NIX_PATH="nixpkgs=${nixpkgs}"
    exec ${nixops-built}/bin/nixops $cmd ${extraBuiltinsOptions pkgs} "$@"
  '';

  nixops-overlay = self: _: {
    nixops = self.symlinkJoin {
      name = "nixops";
      paths = [
        (nixops-wrapped self)
        nixops-built
      ];
    };
  };

  password-utils-overlay = self: _: {
    passwordUtils = (self.callPackage ./lib/passwords.nix { }).passwordUtils;
  };

  pkgs = import nixpkgs {
    overlays = [ nixops-overlay password-utils-overlay ];
  };

in
pkgs.mkShell {
  buildInputs = [
    pkgs.nixops
    pkgs.passwordUtils
  ];
}
