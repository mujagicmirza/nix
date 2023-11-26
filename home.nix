{ config, pkgs, ... }:
let
  unstable = import <unstable> {};
  previous = import <previous> {};
in
{
  imports =
  [
    ./nvim.nix
    ./vscode.nix
    ./zsh.nix
    ./files.nix
  ];

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

  home.username = "mirza";
  home.homeDirectory = "/home/mirza";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ "openssl-1.1.1v" "electron-12.2.3" "openssl-1.1.1w" ];

  home.file.".icons/default".source = "${pkgs.apple-cursor}/share/icons/Apple-Cursor";

  xresources.properties = {
    "XTerm.vt100.reverseVideo" = true;
    "XTerm.vt100.faceName" = "JetBrainsMono Nerd Font Mono:size=9";
  };

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
    (python311.withPackages (p: with p; [
      requests
    ]))
    emacs
    nodejs
    yarn
    (ripgrep.override { withPCRE2 = true; }) # Doom Emacs dependency
    fd                                       # Doom Emacs dependency
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages."@tailwindcss/language-server"
    openvpn
    #texlive.combined.scheme-full
    dbeaver
    android-studio

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
    wtf

    unstable.waybar
    hyprpaper
    tofi
    swaynotificationcenter
    pamixer

    # System
    xclip
    wl-clipboard
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

  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g default-terminal screen-256color
      set -g mouse on
      
      set -g base-index 1
      setw -g pane-base-index 1

      bind | split-window -hc "#{pane_current_path}"
      bind - split-window -vc "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
    '';

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      gruvbox
      yank
    ];

    shell = "${pkgs.zsh}/bin/zsh";
  };

  home.stateVersion = "22.11";
  
  programs.home-manager.enable = true;
}
