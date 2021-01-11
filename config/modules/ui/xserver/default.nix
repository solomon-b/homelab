{ ... }:

{
  services.xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "ctrl:nocaps";
      windowManager.xmonad.enable = true;
      windowManager.xmonad.enableContribAndExtras = true;
      displayManager = {
        defaultSession = "none+xmonad";
        lightdm.enable = true;
        lightdm.background = "/usr/share/backgrounds/Vaporwave.jpg";
      };
      libinput.enable = true;
      libinput.clickMethod = "clickfinger";
      libinput.tapping = false;
      libinput.disableWhileTyping = true;
  };
}
