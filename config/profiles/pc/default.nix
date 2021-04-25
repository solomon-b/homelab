{ pkgs, ... }:

{
  imports = [
    ../physical-machine

    ../../modules/security/gpg

    # ../../modules/system/docker
    # ../../modules/system/virtualbox
    ../../modules/system/postgresql

    ../../modules/ui/audio
     ../../modules/ui/direnv
    # ../../modules/ui/emacs
    ../../modules/ui/fonts
    ../../modules/ui/git
    ../../modules/ui/kmonad
    ../../modules/ui/lorri
    ../../modules/ui/opengl
    ../../modules/ui/xserver

    # TODO: Write Modules:
    # ../../../modules/nixos/lightlocker.nix
    # ../../../modules/nixos/kmonad.nix

    # ../../modules/ui/zathura # Home Manager
  ];

  #enableSshdAtBoot = false;

  primary-user.extraGroups = [ "networkmanager" ];

  system.stateVersion = "20.09";

  environment.systemPackages = with pkgs; [
    # CLI Tools
    inetutils
    #kmonad
    udiskie
    rclone
    starship
    yadm # to be removed when i setup home-manager

    # Editors
    emacs

    # Haskell Dev Tools
    cabal-install
    cabal2nix

    # Desktop Environment
    dunst
    dmenu
    haskellPackages.xmobar
    libnotify
    networkmanagerapplet
    termonad-with-packages
    trayer
    xbanish
    xlayoutdisplay

    # Media
    vlc
    scrot
    zathura
    feh
    obs-studio

    # Web Browsers
    firefox-beta-bin
    google-chrome

    # Chat/Communication
    slack
    zoom-us

    # Pandoc Related
    pandoc
    texlive.combined.scheme-full
    python37Packages.pygments
    poppler_utils
  ];
}
