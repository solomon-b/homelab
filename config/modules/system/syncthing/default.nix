{ ... }:
let
  homePath = primary-user.home-manager.home.homeDirectory;
{
  services.syncthing = {
    enable = true;
    user = "solomon";
    dataDir = "${homePath}/Public";
    configDir = "${homePath}/.config/syncthing";
  };
}
