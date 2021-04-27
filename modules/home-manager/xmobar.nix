{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.programs.xmobar;
in
{
  options.programs.xmobar = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable xmobar";
    };

    config = mkOption {
      type = types.nullOr types.path;
      default = null;
      description = "Filepath for xmobar config file.";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.xmobar ];

    home.file.".xmobarrc".source = cfg.config;
  };
}
