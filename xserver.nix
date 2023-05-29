{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> {};
in
{
  services.xserver = {
    enable = true;
    layout = "ba";
    xkbVariant = "";

    desktopManager = {
      xterm.enable = false;
      gnome.enable = true;
    };
   
    displayManager = {
      defaultSession = "none+i3";
	  gdm.enable = true;
    };

    windowManager.i3 = {
      package = unstable.i3;
      enable = true;
    };
  };
}
