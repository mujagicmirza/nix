{ config, pkgs, unstablePkgs, ... }:
{
  services.picom = {
    enable = true;
    package = unstablePkgs.picom-next;
    settings = builtins.import ./config/picomConfig;
  };
}
