{ config, pkgs, unstablePkgs, ... }:
{
  services.xserver = {
    enable = true;

    layout = "ba";
    xkbVariant = "";

    desktopManager = {
      xterm.enable = false;
      #gnome.enable = true;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };

   
    displayManager = {
      defaultSession = "xfce+i3";
      lightdm.enable = true;
      lightdm.greeters.slick.enable = true;
      lightdm.greeters.slick.extraConfig = ''
        background=/etc/nixos/greeterBackground.jpg
        show-hostname=false
      '';
    };

    windowManager.i3 = {
      package = unstablePkgs.i3;
      enable = true;
    };
  };
}
