{ pkgs, ... }:

{
  users.users.solomon = {
    home = "/home/solomon";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "input" ];
    isNormalUser = true;
    uid = 1000;

    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEYye0R6efbTryJbYyZWdecbzxzlEUJmku7IlVA5zPhhk4yjkDcyrXwBJK1/QmT2ZUNMTGKgk4rcsIi/1nVaHyRKy7vNKMsHbVKziFyMrOAi2ovGnlfAfOmEK0TfUISXei6UoBCWnGsTxrbsv9ukOoTmaDp5oRRoXGf2Q7OI/oO4bsZSpS0JHbRVEKqaZzSSVrCn4FJ9vE2HFM1URRiChsBzM9JCSwjW0HgtJgYy4yLtw5L9PJSFNQJpw9X3yo4/VU96UFccmXS/IWBD+9704FfSWWcfdMK0bDZll0JXSTlUFvpHoZWO57Bm6T/Towx8JVCSo82tgHLW0vPvbHPEFT solomon@solomons-MBP.att.net"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDnQP3PK7d7y8k05h+zVqXVxSnvs3R5d+PUujqSPXnwZxqNLi4rJ7sWNbT91jQRkZIQ55i9gRMdlv5TcyyP6aXqOtfeTX6Jh5/ysbuzkidszHl4oRDkahr6vMkEcyt91rSjLsjXgHnTAKQLRTaLSOLPddnAdO8cH7cIcxKFUr4y2XqkKPlQm1OPMGNWARReog1/uimZFQbiD4K98yTUNY2vHRxKlubO4gxuSNFMTi/uLeJUwjqRDrU3PEpV3tXebhehgROBzIL69aX9hWSBlzwYbP4kt+Z8duQ0o7+ci4do3dtZmmWn6lTmy+VmVU04xEqg8qzJ1Vm4WjkHjAAY7CjFyZoWpJIBUYCtQ+dnQygwKOAtldlKZMM8b8o/mweEZOMnFhiraXHGOXtJfh7XmVqwAxIAXe8PBq6IT5OMI0eR720NeIepV5Mn68lPTZy3PmTQ9rv5RFFNg7/6M3gJk7cFqNLe/8sBhZ6jxkSVikpHSw/FEMMz3x1qLRhekr7mBL0= solomon@sower"
    ];
  };
}
