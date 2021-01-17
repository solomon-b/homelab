{ config, lib, pkgs, ... }:
let
  cfg = config.primary-user;
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
  ];

  config = lib.mkIf (cfg.name != null) {
    primary-user = {
      extraGroups = [ "wheel" ];
      uid = lib.mkDefault 1000;
      isNormalUser = true;
      home-manager = {
        home.username = cfg.name;
        home.homeDirectory = "/home/${cfg.name}";
        home.stateVersion = "21.03";
      };
    };

    nix.trustedUsers = [ cfg.name ];
  };
}
