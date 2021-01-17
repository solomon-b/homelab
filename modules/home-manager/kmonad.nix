{ config, pkgs, lib, ... }:

with lib;
let
  homeDir = config.home.homeDirectory;
  kmonad = pkgs.callPackage ../../packages/kmonad/derivation.nix { };
in
let
  cfg = config.programs.kmonad;
  relToDotDir = file: (optionalString (homeDir != null) (homeDir + "/.config/")) + file;
in
{
  options.programs.kmonad = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable kmonad";
    };

    defcfg = mkOption {
      default = "";
      type = types.lines;
      description = "A minimal definition must include at least an 'input' field and an 'output' field. These describe how KMonad captures its inputs and how it emits its outputs.";
    };

    defsrc = mkOption {
      default = "";
      type = types.lines;
      description =  "The defsrc block explains the layout on which we specify our deflayers down the line.";
    };

    defaliases = mkOption {
      default = "";
      type = types.lines;
      description =  "Aliases allow you to bind key sequences.";
    };

    deflayers = mkOption {
      default = "";
      type = types.lines;
      description = "A deflayer will define a button for each corresponding entry in the defsrc definition.";
    };
  };

  config = mkIf cfg.enable {
    home.file."${relToDotDir "kmonad.kbd"}".text = ''
      ${cfg.defcfg}
      ${cfg.defsrc}
      ${cfg.defaliases}
      ${cfg.deflayers}
    '';

    home.packages = [ kmonad ];
  };
}
