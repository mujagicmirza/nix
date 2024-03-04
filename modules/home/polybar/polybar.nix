{ config, pkgs, unstablePkgs, nodePkgs, ... }:
{
  services.polybar = {
    enable = true;
    script = ''
      monitors=$(polybar --list-monitors | ${pkgs.coreutils}/bin/cut -d":" -f1)
      help=$(polybar --list-monitors)

      echo $help
      echo $monitors

      if [[ $monitors == *"HDMI-1"* ]]; then
          PB_MODULES_RIGHT="tray" MONITOR="HDMI-1" polybar -c ~/.config/polybar/config.ini example -r &
          if [[ $monitors == *"eDP-1"* ]]; then
              MONITOR="eDP-1" polybar -c ~/.config/polybar/config.ini example -r &
          fi
      else
          PB_MODULES_RIGHT="tray" MONITOR="eDP-1" polybar -c ~/.config/polybar/config.ini example -r &
      fi
    '';

    config = ./config/polybarConfig;
    package = unstablePkgs.polybar.override {
      alsaSupport = true;
      githubSupport = true;
      mpdSupport = true;
      pulseSupport = true;
      i3Support = true;
    };
  };
}
