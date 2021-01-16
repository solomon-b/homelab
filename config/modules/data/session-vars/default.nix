{ config, ... }:

{
  home.sessionPath = [
    "${config.home.homeDirectory}/.local/scripts"
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.homeDirectory}/.cabal/bin"
  ];

  home.sessionVariables = {
    VISUAL = "vim";
    EDITOR = "vim";
    SCRIPTS = "${config.home.homeDirectory}/.local/scripts";
  };

}
