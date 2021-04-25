{ ... }:

{
  imports = [
    ./hardware.nix
    ../../profiles/pc
  ];


  primary-user.name = "solomon";

  networking = {
    hostName = "sower";
    hostId = "960855f8";
  };
}
