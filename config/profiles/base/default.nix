{ pkgs, ... }:

let
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "22f6736e628958f05222ddaadd7df7818fe8f59d";
    ref = "release-20.09";
  };
in{
  imports = [
    (imports ${home-manager}/nixos)
    ../../../modules

    ../../modules/data/session-vars

    ../../modules/security/gpg
    ../../modules/security/process-information-hiding
    ../../modules/security/sshd
    # ../../modules/security/sudo  # Ask Connor

    ../../modules/system/nix-binary-caches
    ../../modules/system/nixpkgs
    ../../modules/system/users

    # ../../modules/ui/bash       # Home Manager
    ../../modules/ui/direnv
    ../../modules/ui/git
    ../../modules/ui/lorri
    ../../modules/ui/starship
    ../../modules/ui/zsh

    # TODO: Write modules:
    # ../../../modules/nixos/termonad.nix
  ];

  nix.trustedUsers = [ "@wheel" ];
  environment.shells = [pkgs.zsh pkgs.bashInteractive];

  environment.systemPackages = with pkgs; [
    # General CLI Tools
    direnv
    exa
    fzf
    git
    gnugrep
    gnumake
    htop
    jq
    nixops
    ripgrep
    tree
    unzip
    wget
    zlib
    zsh
    zsh-syntax-highlighting

    # Editors
    vimHugeX
  ];

  programs.home-manager.enable = true;

  home.username = "solomon";
  home.homeDirectory = "/home/solomon";
  home.stateVersion = "21.03";
}
