{ ... }:

{
  services.xserver.libinput = {
      enable = true;
      clickMethod = "clickfinger";
      tapping = false;
      disableWhileTyping = true;
  };
}
