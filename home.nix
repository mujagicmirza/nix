{ config, pkgs, ... }:
let
  unstable = import <unstable> {};
  previous = import <previous> {};

  buildNodejs = pkgs.callPackage <nixpkgs/pkgs/development/web/nodejs/nodejs.nix> {
    python = pkgs.python3;
  };
  nodara = buildNodejs {
    version = "16.19.0";
    sha256 = "4f1fec1aea2392f6eb6d1d040b01e7ee3e51e762a9791dfea590920bc1156706";
  };

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
  nixpkgs.config.permittedInsecurePackages = [ "nodejs-16.19.0" "openssl-1.1.1u" "electron-12.2.3" ];

  home.file.".icons/default".source = "${pkgs.apple-cursor}/share/icons/Apple-Cursor";

  xdg.configFile."mimeapps.list".force = true;
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "zathura.desktop";
      "x-scheme-handler/viber" = ["viber.desktop"];
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
    nodara
    (yarn.override { nodejs = nodara; })
    (ripgrep.override { withPCRE2 = true; }) # Doom Emacs dependency
    fd                                       # Doom Emacs dependency
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages."@tailwindcss/language-server"
    openvpn
    texlive.combined.scheme-full

    # Desktop
    ulauncher
    feh
    slack
    gimp
    inkscape
    libreoffice
    ranger
      ueberzug
    dropbox
    keepassxc
    lutris
    viber
    zathura
    gnome.nautilus

    # System
    xclip
    networkmanagerapplet
    arandr
    deadd-notification-center
    libnotify
    etcher

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
      help=$(polybar --list-monitors)

      echo $help
      echo $monitors

      if [[ $monitors == *"HDMI-1"* ]]; then
          TRAY_POSITION="right" MONITOR="HDMI-1" polybar -c ~/.config/polybar/config.ini example -r &
          if [[ $monitors == *"eDP-1"* ]]; then
              MONITOR="eDP-1" polybar -c ~/.config/polybar/config.ini example -r &
          fi
      else
          TRAY_POSITION="right" MONITOR="eDP-1" polybar -c ~/.config/polybar/config.ini example -r &
      fi
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
