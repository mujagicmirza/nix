{ config, pkgs, unstablePkgs, nodePkgs, ... }:
let
  modulesPath = ../../../modules/home;
in
{
  imports =
  [
    (modulesPath + /neovim/nvim.nix)
    (modulesPath + /vscode/vscode.nix)
    (modulesPath + /zsh/zsh.nix)
    (modulesPath + /tmux/tmux.nix)
    (modulesPath + /polybar/polybar.nix)
    (modulesPath + /picom/picom.nix)
    (modulesPath + /ranger/ranger.nix)
    (modulesPath + /kitty/kitty.nix)
    (modulesPath + /i3/i3.nix)
    (modulesPath + /wtf/wtf.nix)
    (modulesPath + /hyprland/hyprland.nix)
    (modulesPath + /waybar/waybar.nix)
    (modulesPath + /tofi/tofi.nix)
    ./files.nix
  ];

  home.username = "mirza";
  home.homeDirectory = "/home/mirza";
  services.polybar.script = ''
      monitors=$(polybar --list-monitors | ${pkgs.coreutils}/bin/cut -d":" -f1)
      help=$(polybar --list-monitors)

      echo $help
      echo $monitors

      PB_MODULES_RIGHT="tray" MONITOR="HDMI-A-0" polybar -c ~/.config/polybar/config.ini example -r &
      MONITOR="DVI-D-0" polybar -c ~/.config/polybar/config.ini example -r &
  '';

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ "openssl-1.1.1w" ];

  home.file.".icons/default".source = "${pkgs.apple-cursor}/share/icons/Apple-Cursor";

  home.packages = with pkgs; [ 
    # Browsers
    brave
    google-chrome

    # Development
    git
    gh
    github-copilot-cli
    #konsole
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
    dropbox
    keepassxc
    lutris
    wine
    viber
    #zathura
    gnome.nautilus
    simplescreenrecorder
    maim
    libsForQt5.kdeconnect-kde

    hyprpaper
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

  programs.emacs = {
    enable = true;
    package = unstablePkgs.emacs29;
  };

  home.stateVersion = "23.11";
  
  programs.home-manager.enable = true;
}
