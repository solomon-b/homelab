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
      libinput.touchpad = {
        clickMethod = "clickfinger";
        tapping = false;
        disableWhileTyping = true;
      };
  };

  primary-user.home-manager.xsession = {
    enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = ./xmonad.hs;
    };
  };
}
