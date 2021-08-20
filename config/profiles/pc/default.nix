{ pkgs, ... }:

{
  imports = [
    ../physical-machine

    ../../modules/security/gpg

    ../../modules/system/docker
    # ../../modules/system/virtualbox
    ../../modules/system/postgresql
    ../../modules/system/redis
    ../../modules/system/syncthing

    ../../modules/ui/audio
    ../../modules/ui/direnv
    ../../modules/ui/dunst
    ../../modules/ui/fonts
    ../../modules/ui/git
    ../../modules/ui/kmonad
    ../../modules/ui/lorri
    ../../modules/ui/opengl
    ../../modules/ui/termonad
    ../../modules/ui/xmobar
    ../../modules/ui/xserver

    # TODO: Write Modules:
    # ../../modules/ui/emacs
    # ../../../modules/nixos/lightlocker.nix
    # ../../modules/ui/zathura # Home Manager
  ];

  environment.systemPackages = with pkgs; [
    # CLI Tools
    inetutils
    niv
    pass
    rclone
    udiskie
    sqlite # for org-roam, should I move to postgres? How would I sync between machines in that case?
    xclip


    # Editors
    emacs

    # Haskell Dev Tools
    cabal2nix

    # Desktop Environment
    dunstStatus
    dmenu
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
  primary-user.home-manager.home.file.".wallpaper.jpg".source = ./wallpaper.jpg;

  system.stateVersion = "20.09";
}
