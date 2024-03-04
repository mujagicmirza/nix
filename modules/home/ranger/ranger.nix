{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ 
    ranger
    ueberzug
  ];

  xdg.configFile.ranger = {
    source = ./config;
    recursive = true;
  };

  xdg.configFile."ranger/scope.sh" = {
    source = ./config/scope.sh;
    executable = true;
  };
}
