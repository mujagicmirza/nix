{ config, pkgs, unstablePkgs, nodePkgs, ... }:
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
    gh
    github-copilot-cli
    #konsole
    kitty
    gnome.gnome-terminal
    (python311.withPackages (p: with p; [
      requests
    ]))
    #emacs
    nodePkgs.elmPackages.nodejs
    (yarn.override {
      nodejs = nodePkgs.elmPackages.nodejs;
    })
    (ripgrep.override { withPCRE2 = true; }) # Doom Emacs dependency
    fd                                       # Doom Emacs dependency
    ispell
    fzf
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages."@tailwindcss/language-server"
    openvpn
    #texlive.combined.scheme-full
    dbeaver
    #android-studio
    gcc13
    unstablePkgs.awscli2
    kubectl
    eksctl
    minikube
    openlens
    unstablePkgs.atuin
    envsubst

    # Desktop
    slack
    ulauncher
    feh
    #gimp
    #inkscape
    #libreoffice
    ranger
      ueberzug
    dropbox
    keepassxc
    lutris
    wine
    viber
    #zathura
    gnome.nautilus
    simplescreenrecorder
    maim
    wtf
    libsForQt5.kdeconnect-kde

    unstablePkgs.waybar
    hyprpaper
    tofi
    swaynotificationcenter
    pamixer

    # System
    jq
    highlight
    file
    xclip
    wl-clipboard
    networkmanagerapplet
    arandr
    libnotify
    qbittorrent
    #etcher
    htop
    wirelesstools

    # Fonts
    noto-fonts-emoji
  ];

  services.picom = {
    enable = true;
    package = unstablePkgs.picom-next;
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
          PB_MODULES_RIGHT="tray" MONITOR="HDMI-1" polybar -c ~/.config/polybar/config.ini example -r &
          if [[ $monitors == *"eDP-1"* ]]; then
              MONITOR="eDP-1" polybar -c ~/.config/polybar/config.ini example -r &
          fi
      else
          PB_MODULES_RIGHT="tray" MONITOR="eDP-1" polybar -c ~/.config/polybar/config.ini example -r &
      fi
    '';


    config = ./configs/polybarConfig;
    package = unstablePkgs.polybar.override {
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

      bind-key -n MouseDrag1Status swap-window -t=
    '';

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      gruvbox
      yank
    ];

    shell = "${pkgs.zsh}/bin/zsh";
  };

  programs.emacs = {
    enable = true;
    package = unstablePkgs.emacs29;
  };

  home.stateVersion = "23.05";
  
  programs.home-manager.enable = true;
}
