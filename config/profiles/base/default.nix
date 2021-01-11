{ pkgs, ... }:
let
  sources = import ../../../sources.nix;
in
{
  imports = [
    "${sources.home-manager}/nixos"
    # ../../../modules

    # ../../modules/data/session-vars  # Home Manager
    # ../../modules/data/xdg-user-dirs # Home Manager

    ../../modules/security/process-information-hiding
    # ../../modules/security/sshd  # Ask Connor
    # ../../modules/security/sudo  # Ask Connor
    # ../../modules/security/umask # Home Manager

    ../../modules/system/nix-binary-caches
    ../../modules/system/nixpkgs
    # ../../modules/system/users   # Ask Connor

    # ../../modules/ui/bash       # Home Manager
    # ../../modules/ui/fzf        # Home Manager
    # ../../modules/ui/greeting   # Mingetty
    # ../../modules/ui/htop       # Home Manager
    # ../../modules/ui/less       # Home Manager
    # ../../modules/ui/readline   # Home Manager
    # ../../modules/ui/terminfo   # Home Manager
    # ../../modules/ui/theme      # Home Manager
    # ../../modules/ui/zsh        # Is This Home Manager?

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
}
