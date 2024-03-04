{ config, inputs, pkgs, unstablePkgs, nodePkgs, ... }:
{
  # Set your time zone.
  time.timeZone = "Europe/Sarajevo";

  # Select internationalisation properties.
  i18n.defaultLocale = "bs_BA.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "bs_BA.UTF-8";
    LC_IDENTIFICATION = "bs_BA.UTF-8";
    LC_MEASUREMENT = "bs_BA.UTF-8";
    LC_MONETARY = "bs_BA.UTF-8";
    LC_NAME = "bs_BA.UTF-8";
    LC_NUMERIC = "bs_BA.UTF-8";
    LC_PAPER = "bs_BA.UTF-8";
    LC_TELEPHONE = "bs_BA.UTF-8";
    LC_TIME = "bs_BA.UTF-8";
  };
}
