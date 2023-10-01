{ config, pkgs, ... }:
{
  home.file.".doom.d/config.el".source = ./configs/doom.d/config.el;
  home.file.".doom.d/init.el".source = ./configs/doom.d/init.el;
  home.file.".doom.d/packages.el".source = ./configs/doom.d/packages.el;
  
  home.file.".local/share/fonts/MonacoNerd.ttf".source = ./files/fonts/MonacoNerd.ttf;
  home.file.".local/share/fonts/BlexMonoNerd.ttf".source = ./files/fonts/BlexMonoNerd.ttf;
  home.file.".local/share/fonts/JetBrainsMonoNerd.ttf".source = ./files/fonts/JetBrainsMonoNerd.ttf;
  
  home.file."Pictures/glass.jpg".source = ./files/pictures/glass.jpg;
  home.file."Pictures/flowers.jpg".source = ./files/pictures/flowers.jpg;
  home.file."Pictures/space.png".source = ./files/pictures/space.png;

  home.file."Scripts/lock.sh" = {
    executable = true;
    source = ./scripts/lock.sh; 
  };

  # home.file."Scripts/i3-workspace-names-daemon.py".source = ./scripts/i3-workspace-names-daemon.py;

  xdg.configFile.ranger = {
    source = ./configs/ranger;
    recursive = true;
  };

  xdg.configFile.i3 = {
    source = ./configs/i3;
    recursive = true;
  };

  xdg.configFile.nvim = {
    source = ./configs/nvim;
    recursive = true;
  };

  xdg.configFile.kitty = {
    source = ./configs/kitty;
    recursive = true;
  };

  xdg.configFile.deadd = {
    source = ./configs/deadd;
    recursive = true;
  };

  xdg.configFile.tofi = {
    source = ./configs/tofi;
    recursive = true;
  };

  xdg.configFile.hypr = {
    source = ./configs/hypr;
    recursive = true;
  };

  xdg.configFile.waybar = {
    source = ./configs/waybar;
    recursive = true;
  };

  xdg.configFile.wtf = {
    source = ./configs/wtf;
    recursive = true;
  };
}
