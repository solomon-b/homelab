{ pkgs, ... }:

{
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };

  users.extraUsers.solomon.extraGroups = [ "audio" ]
}
