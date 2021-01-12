{ pkgs, ... }:

let
  acpiPower = pkgs.callPackage ../../../packages/acpiPower.nix { };
in
{
  imports = [
    ../pc

    ../../modules/system/devices/bluetooth
    ../../modules/system/devices/touchpad
    ../../modules/system/powertop
    # TODO: Setup Wifi Networks
    # ../../modules/system/devices/wifi
  ];

  environment.systemPackages = [
    pkgs.acpi
    pkgs.acpiPower
  ];
}
