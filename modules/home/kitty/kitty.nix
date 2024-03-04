{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ 
    kitty
  ];

  xdg.configFile.kitty = {
    source = ./config;
    recursive = true;
  };
}
