{ ... }:

{
  users.extraUsers.solomon.extraGroups = [ "uinput" ];
  users.groups = { uinput = {}; };
  boot.kernelModules = [ "uinput" ];
  services.udev.extraRules =
    ''
      # KMonad user access to /dev/uinput
      KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    '';
}
