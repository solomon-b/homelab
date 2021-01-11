{ ... }:

{
  imports = [
    ./hardware.nix
    ../../profiles/pc
  ];

  networking = {
    hostName = "sower";
    hostId = "960855f8";
  };
}
