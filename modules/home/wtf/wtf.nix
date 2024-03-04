{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ 
    wtf
  ];

  xdg.configFile.wtf = {
    source = ./config;
    recursive = true;
  };
}
