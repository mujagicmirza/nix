{ config, pkgs, ... }:
{
  #home.file.".doom.d/config.el".source = ./configs/doom.d/config.el;
  #home.file.".doom.d/init.el".source = ./configs/doom.d/init.el;
  #home.file.".doom.d/packages.el".source = ./configs/doom.d/packages.el;
  
  home.file.".local/share/fonts/MonacoNerd.ttf".source = ./files/fonts/MonacoNerd.ttf;
  home.file.".local/share/fonts/BlexMonoNerd.ttf".source = ./files/fonts/BlexMonoNerd.ttf;
  home.file.".local/share/fonts/JetBrainsMonoNerd.ttf".source = ./files/fonts/JetBrainsMonoNerd.ttf;
  home.file.".local/share/fonts/Iosevka.ttf".source = ./files/fonts/iosevka-term-extended.ttf;
  
  home.file."Pictures/glass.jpg".source = ./files/pictures/glass.jpg;
  home.file."Pictures/flowers.jpg".source = ./files/pictures/flowers.jpg;
  home.file."Pictures/space.png".source = ./files/pictures/space.png;
  home.file."Pictures/mountain.jpg".source = ./files/pictures/mountain.jpg;

  home.file."Scripts/lock.sh" = {
    executable = true;
    source = ./scripts/lock.sh; 
  };

  home.file."Scripts/monitors.sh" = {
    executable = true;
    source = ./scripts/monitors.sh; 
  };

  # home.file."Scripts/i3-workspace-names-daemon.py".source = ./scripts/i3-workspace-names-daemon.py;
}
