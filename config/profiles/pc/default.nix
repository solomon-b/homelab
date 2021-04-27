{ pkgs, ... }:

{
  imports = [
    ../physical-machine

    ../../modules/security/gpg

    # ../../modules/system/docker
    # ../../modules/system/virtualbox
    ../../modules/system/postgresql
    ../../modules/system/redis

    ../../modules/ui/audio
     ../../modules/ui/direnv
    ../../modules/ui/fonts
    ../../modules/ui/git
    ../../modules/ui/kmonad
    ../../modules/ui/lorri
    ../../modules/ui/opengl
    ../../modules/ui/termonad
    ../../modules/ui/xserver

    # TODO: Write Modules:
    # ../../modules/ui/emacs
    # ../../../modules/nixos/lightlocker.nix
    # ../../modules/ui/zathura # Home Manager
  ];

  #enableSshdAtBoot = false;

  environment.systemPackages = with pkgs; [
    # CLI Tools
    inetutils
    niv
    rclone
    udiskie
    yadm # to be removed when i setup home-manager

    # Editors
    emacs

    # Haskell Dev Tools
    cabal-install
    cabal2nix

    # Desktop Environment
    dunst
    dunstStatus
    dmenu
    haskellPackages.xmobar
    libnotify
    networkmanagerapplet
    trayer
    xbanish
    xlayoutdisplay

    # Media
    vlc
    scrot
    zathura
    feh
    obs-studio

    # Chat/Communication
    slack
    zoom-us

    # Pandoc Related
    pandoc
    texlive.combined.scheme-full
    python37Packages.pygments
    poppler_utils

    # Web Browsers
    firefox-beta-bin
    google-chrome
  ];

  primary-user.extraGroups = [ "networkmanager" ];

  system.stateVersion = "20.09";
}
