{ pkgs, lib, config, ... }:
let
  public-key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEYye0R6efbTryJbYyZWdecbzxzlEUJmku7IlVA5zPhhk4yjkDcyrXwBJK1/QmT2ZUNMTGKgk4rcsIi/1nVaHyRKy7vNKMsHbVKziFyMrOAi2ovGnlfAfOmEK0TfUISXei6UoBCWnGsTxrbsv9ukOoTmaDp5oRRoXGf2Q7OI/oO4bsZSpS0JHbRVEKqaZzSSVrCn4FJ9vE2HFM1URRiChsBzM9JCSwjW0HgtJgYy4yLtw5L9PJSFNQJpw9X3yo4/VU96UFccmXS/IWBD+9704FfSWWcfdMK0bDZll0JXSTlUFvpHoZWO57Bm6T/Towx8JVCSo82tgHLW0vPvbHPEFT solomon@solomons-MBP.att.net";
in
{
  services.openssh = {
    enable = true;
    passwordAuthentication = true;
    permitRootLogin = "yes";
    extraConfig = "PermitUserEnvironment yes";
  };

  services.sshd.enable = true;

  security.pam = {
    enableSSHAgentAuth = true;
    services.sudo.sshAgentAuth = true;
  };

  #systemd.services.sshd.wantedBy = lib.mkIf (!config.enableSshdAtBoot) (lib.mkForce [ ]);

  users.users.solomon.openssh.authorizedKeys.keys = [ public-key ];
}
