{ config, pkgs, unstablePkgs, ... }:
{
  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

  home.packages = with pkgs; [ 
    unstablePkgs.waybar
  ];

  xdg.configFile.waybar = {
    source = ./config;
    recursive = true;
  };
}
