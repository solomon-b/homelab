{ pkgs, ... }:

{
  primary-user.extraGroups = [ "audio" ];

  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };
}
