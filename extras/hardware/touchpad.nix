{
  services.libinput = {
    enable = true;

    # Disable mouse acceleration
    mouse = {
      accelProfile = "flat";
      accelSpeed = "0";
      middleEmulation = false;
    };

    # Touchpad settings
    touchpad = {
      naturalScrolling = true;
      tapping = true;
      clickMethod = "clickfinger";
      horizontalScrolling = false;
      disableWhileTyping = true;
    };
  };
}
