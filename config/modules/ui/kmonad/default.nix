{ ... }:

{
  primary-user.home-manager.programs.kmonad = {
    enable = true;

    defcfg = ''
    '';

    defsrc = ''
    '';

    defaliases = ''
    '';

    deflayers = ''
    '';
  };

  primary-user.extraGroups = [ "uinput" "input" ];

  users.groups = { uinput = {}; };
  boot.kernelModules = [ "uinput" ];
  services.udev.extraRules = ''
    # KMonad user access to /dev/uinput
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';
}
