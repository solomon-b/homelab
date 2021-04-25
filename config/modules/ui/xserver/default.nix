{ ... }:

{
  services.xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "ctrl:nocaps";
      desktopManager.xfce.enable = true;
      windowManager.xmonad.enable = true;
      windowManager.xmonad.enableContribAndExtras = true;
      displayManager = {
        defaultSession = "xfce";
        lightdm.enable = true;
        #lightdm.background = "/usr/share/backgrounds/Vaporwave.jpg";
      };
      libinput.enable = true;
      libinput.clickMethod = "clickfinger";
      libinput.tapping = false;
      libinput.disableWhileTyping = true;
  };

  primary-user.home-manager.xsession = {
    enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };
  };
}
