{ config, pkgs, ... }:
let
  unstable = import <unstable> {};
in
{
  services.xserver = {
    enable = true;
    layout = "ba";
    xkbVariant = "";

    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
      defaultSession = "none+i3";
      lightdm.enable = true;
    };

    windowManager.i3 = {
      package = unstable.i3;
      enable = true;
    };
  };
}

