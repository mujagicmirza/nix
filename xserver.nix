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

  virtualisation.docker.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
      };
    };
  };
}
