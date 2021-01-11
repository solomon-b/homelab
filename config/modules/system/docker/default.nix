{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.docker-compose ]
  virtualisation.docker.enable = true;
  users.extraUsers.solomon.extraGroups = [ "docker" ];
}
