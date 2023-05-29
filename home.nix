{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> {};
in
{
  imports =
  [
    ./nvim.nix
    ./vscode.nix
    ./zsh.nix
    ./files.nix
  ];

  home.username = "mirza";
  home.homeDirectory = "/home/mirza";
  nixpkgs.config.allowUnfree = true;
  
  home.packages = with pkgs; [ 
    # Browsers
    brave
    google-chrome

    # Development
    git
    konsole
    python3
    emacs
    (ripgrep.override { withPCRE2 = true; }) # Doom Emacs dependency
    fd                                       # Doom Emacs dependency

    # Desktop
    ulauncher
    feh
    slack
    gimp
    inkscape
    libreoffice
    ranger
    dropbox

    # System
    xclip
    networkmanagerapplet
    arandr

    # Fonts
    noto-fonts-emoji
  ];

  services.picom = {
    enable = true;
    package = unstable.picom-next;
    settings = builtins.import ./configs/picomConfig;
  };

  services.polybar = {
    enable = true;
    script = "polybar example &";
    config = ./configs/polybarConfig;
    package = unstable.polybar.override {
      alsaSupport = true;
      githubSupport = true;
      mpdSupport = true;
      pulseSupport = true;
      i3Support = true;
    };
  };

  home.stateVersion = "22.11";
  
  programs.home-manager.enable = true;
}
