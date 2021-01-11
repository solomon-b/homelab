{ ... }:

{
  imports = [
    ./hardware.nix
    ../../profiles/laptop
  ];

  networking = {
    hostName = "nixos";
    hostId = "960855f8";
  };
}
