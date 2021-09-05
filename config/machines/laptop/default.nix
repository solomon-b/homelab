{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../../profiles/pc

    ../../modules/system/devices/bluetooth
    ../../modules/system/devices/touchpad
    ../../modules/system/powertop

    # TODO: Setup Wifi Networks???
    # ../../modules/system/devices/wifi
  ];

  environment.systemPackages = [
    pkgs.acpi
  ];

  primary-user.name = "solomon";

  networking = {
    hostName = "nixos";
    hostId = "960855f8";
    networkmanager.enable = true;

    useDHCP = false;
    interfaces.enp0s31f6.useDHCP = true;
    interfaces.wlp4s0.useDHCP = true;
    hosts = {
      "192.168.0.3" = [ "sower" ];
    };
  };
}
