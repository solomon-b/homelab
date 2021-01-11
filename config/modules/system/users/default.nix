{ ... }:

{
  users.extraUsers.solomon = {
    home = "/home/solomon";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "input" ];
    isNormalUser = true;
    uid = 1000;
  };
}
