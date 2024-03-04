{ config, pkgs, unstablePkgs, nodePkgs, ... }:
{
  home.packages = with pkgs; [ 
    tofi
  ];

  xdg.configFile.tofi = {
    source = ./config;
    recursive = true;
  };
}
