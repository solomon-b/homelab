{ config, pkgs, lib, ... }:

let
  kmonad = pkgs.callPackage ../../../../packages/kmonad/derivation.nix { };
in
let
  cfg = config.programs.kmonad;
  relToDotDir = file: (optionalString (cfg.dotDir != null) (cfg.dotDir + "/.config")) + file;
in
{
  options.programs.kmonad = {
    enable = mkOption {
      type = types.bool
        default = false;
        description = "Enable kmonad";
    };

    defcfg = mkOption {
      default = "";
      type = type.lines;
      description = "A minimal definition must include at least an 'input' field and an 'output' field. These describe how KMonad captures its inputs and how it emits its outputs.";
    };

    defsrc = mkOption {
      default = "";
      type = type.lines;
      description =  "The defsrc block explains the layout on which we specify our deflayers down the line."
    };

    defaliases = mkOption {
      default = "";
      type = type.lines;
      description =  "Aliases allow you to bind key sequences.";
    };

    deflayers = mkOption {
      default = "";
      type = type.lines;
      description = "A deflayer will define a button for each corresponding entry in the defsrc definition.";
    };
  };

  config = mkIf cfg.enable {
    home.file."${relToDotDir "kmonad.kbd"}".text = ''
      ${cfg.defcfg}
      ${cfg.defsrc}
      ${cfg.defaliases}
      ${cfg.layers}
    '';

    home.packages = [ kmonad ]

    users.extraUsers.solomon.extraGroups = [ "uinput" ];
    users.groups = { uinput = {}; };
    boot.kernelModules = [ "uinput" ];
    services.udev.extraRules = ''
      # KMonad user access to /dev/uinput
      KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    '';
  };
}
