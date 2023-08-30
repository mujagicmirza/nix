{ config, pkgs, ... }:
let
  unstable = import <unstable> {};
  previous = import <previous> {};

  nodePkg = import (builtins.fetchTarball {
    # made using https://lazamar.co.uk/nix-versions/
    url = "https://github.com/NixOS/nixpkgs/archive/55070e598e0e03d1d116c49b9eff322ef07c6ac6.tar.gz";
  }) {};
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
  nixpkgs.config.permittedInsecurePackages = [ "nodejs-16.19.0" "openssl-1.1.1v" "electron-12.2.3" ];

  home.file.".icons/default".source = "${pkgs.apple-cursor}/share/icons/Apple-Cursor";

  xdg.configFile."mimeapps.list".force = true;
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "zathura.desktop";
      "x-scheme-handler/viber" = ["viber.desktop"];
      # Browser
      "text/html" = "brave.desktop";
      "x-scheme-handler/http" = "brave.desktop";
      "x-scheme-handler/https" = "brave.desktop";
    };

  };
  
  home.packages = with pkgs; [ 
    # Browsers
    brave
    google-chrome

    # Development
    git
    #konsole
    kitty
    gnome.gnome-terminal
    python3
    emacs
    nodePkg.nodejs-16_x
    (yarn.override { nodejs = nodePkg.nodejs-16_x; })
    (ripgrep.override { withPCRE2 = true; }) # Doom Emacs dependency
    fd                                       # Doom Emacs dependency
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages."@tailwindcss/language-server"
    openvpn
    #texlive.combined.scheme-full
    dbeaver

    # Desktop
    ulauncher
    feh
    slack
    #gimp
    #inkscape
    #libreoffice
    ranger
      ueberzug
    dropbox
    keepassxc
    #lutris
    viber
    #zathura
    gnome.nautilus
    simplescreenrecorder
    maim

    # System
    xclip
    networkmanagerapplet
    arandr
    deadd-notification-center
    libnotify
    qbittorrent
    #etcher

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
    script = ''
      monitors=$(polybar --list-monitors | ${pkgs.coreutils}/bin/cut -d":" -f1)

      TRAY_POSITION="right" MONITOR="DVI-D-0" polybar -c ~/.config/polybar/config.ini example -r &
      MONITOR="HDMI-0" polybar -c ~/.config/polybar/config.ini example -r &
    '';


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
