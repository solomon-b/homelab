{ config, lib, pkgs, ... }:
let
  cfg = config.primary-user;
  passwords = pkgs.callPackage ../../lib/passwords.nix { };
in
{
  options.primary-user.name = lib.mkOption {
    type = lib.types.nullOr lib.types.str;
    default = null;
    description = "The name of the primary user account.";
  };

  imports = [
    (lib.mkAliasOptionModule [ "primary-user" "home-manager" ] [ "home-manager" "users" cfg.name ])
    (lib.mkAliasOptionModule [ "primary-user" "home" ] [ "users" "users" cfg.name "home" ])
    (lib.mkAliasOptionModule [ "primary-user" "shell" ] [ "users" "users" cfg.name "shell" ])
    (lib.mkAliasOptionModule [ "primary-user" "extraGroups" ] [ "users" "users" cfg.name "extraGroups" ])
    (lib.mkAliasOptionModule [ "primary-user" "uid" ] [ "users" "users" cfg.name "uid" ])
    (lib.mkAliasOptionModule [ "primary-user" "openssh" ] [ "users" "users" cfg.name "openssh" ])
    (lib.mkAliasOptionModule [ "primary-user" "isNormalUser" ] [ "users" "users" cfg.name "isNormalUser" ])
    (lib.mkAliasOptionModule [ "primary-user" "passwordFile" ] [ "users" "users" cfg.name "passwordFile" ])
  ];

  config = lib.mkIf (cfg.name != null) {
    deployment.keys.primary-user-password = {
      keyCommand = passwords.getHashedUserPassword "System/solomon";
      destDir = "/secrets";
    };

    primary-user = {
      extraGroups = [ "wheel" ];
      home-manager = {
        home.username = cfg.name;
        home.homeDirectory = "/home/${cfg.name}";
        home.stateVersion = "21.03";
      };
      isNormalUser = true;
      passwordFile = config.deployment.keys.primary-user-password.path;
      uid = lib.mkDefault 1000;
    };

    nix.trustedUsers = [ cfg.name ];
  };
}
