{ ... }:

{
  imports = [
    ./hardware.nix
    ../../profiles/laptop
  ];

  primary-user.name = "solomon";

  networking = {
    hostName = "nixos";
    hostId = "960855f8";
  };
}
