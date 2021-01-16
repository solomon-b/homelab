{ pkgs, ... }:

{
  imports = [
    ../physical-machine

    # ../../modules/data/email # Home Manager
    # ../../modules/data/git   # Home Manager

    # ../../modules/security/get-aws-access-key # Home Manager
    ../../modules/security/gpg
    # ../../modules/security/secure # What is this?
    # ../../modules/security/ssh                # Home Manager

    ../../modules/system/docker
    ../../modules/system/virtualbox
    ../../modules/system/postgresql

    ../../modules/ui/audio
    # ../../modules/ui/direnv # Home Manager
    # ../../modules/ui/emacs  # Home Manager
    # ../../modules/ui/gtk    # Home Manager
    ../../modules/ui/fonts
    ../../modules/ui/kmonad
    # ../../modules/ui/log    # Home Manager?
    ../../modules/ui/lorri
    ../../modules/ui/opengl
    ../../modules/ui/xserver

    # TODO: Write Modules:
    # ../../../modules/nixos/lightlocker.nix
    # ../../../modules/nixos/kmonad.nix

    # ../../modules/ui/zathura # Home Manager
  ];

  # promptColor = "cyan"; # Comes from zsh module
  #enableSshdAtBoot = false;

  programs.kmonad = {
    enable = true;
    
  };

  users.users.solomon.extraGroups = [ "networkmanager" ];

  #networking.networkmanager.enable = true;
  networking = {
    wireless = {
      enable = true;
      networks = {
        TP-LINK_0573_5G = {
          pskRaw = "43c10b524fcb5286ff0242495ad099a837ff5fe9836bbffa1ae1831303884b7d";
        };
      };
    };
    useDHCP = false;
  };

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
