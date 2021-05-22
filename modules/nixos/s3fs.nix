{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.programs.s3fs;
  passwords = pkgs.callPackage ../../lib/passwords.nix { };
in
{
  options.programs.s3fs = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable s3fs-fuse";
    };
  };

  config = mkIf cfg.enable {
    deployment.keys = {
      s3fs-api-token = {
        keyCommand = passwords.getPassword "system/absolution-gap/api-token";
        destDir = "/secrets";
        user = config.primary-user.name;
        group = "users";
      };
    };

    environment.systemPackages = [ pkgs.s3fs ];
    environment.variables.AWS_CREDENTIAL_FILE = config.deployment.keys.s3fs-api-token.path;
  };
}
