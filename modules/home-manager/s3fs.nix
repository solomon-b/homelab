
{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.programs.s3fs;
in
{
  options.programs.s3fs = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable termonad";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.s3fs ];
    #xdg.configFile."termonad/termonad.hs".source = cfg.config;
  };
}
