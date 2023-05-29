{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> {};
in
{
  home.username = "mirza";
  home.homeDirectory = "/home/mirza";
  nixpkgs.config.allowUnfree = true;
  
  home.file.".doom.d/config.el".source = ./doom.d/config.el;
  home.file.".doom.d/init.el".source = ./doom.d/init.el;
  home.file.".doom.d/packages.el".source = ./doom.d/packages.el;
  
  home.file.".local/share/fonts/MonacoNerd.ttf".source = ./MonacoNerd.ttf;
  home.file.".local/share/fonts/BlexMonoNerd.ttf".source = ./BlexMonoNerd.ttf;
  
  home.file."Pictures/glass.jpg".source = ./glass.jpg;
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

    # System
    xclip
    networkmanagerapplet
    arandr

    # Fonts
    noto-fonts-emoji
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      vscodevim.vim
      catppuccin.catppuccin-vsc
      github.copilot
      editorconfig.editorconfig
      dbaeumer.vscode-eslint
      eamodio.gitlens
    ];
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;


    shellAliases = {
      ll = "ls -l";
      copy = "xclip -sel c";
      hello = "echo $1";
      update = "sudo nixos-rebuild switch";
    };

    history = {
      size = 10000;
    };

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
    };

  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-web-devicons
      plenary-nvim
      nvim-treesitter
      telescope-nvim
      vimtex
      ultisnips
      vim-fugitive
      nvim-scrollbar
      vim-html-template-literals
      gruvbox-nvim
      copilot-vim
      nvim-tree-lua
      # coq_nvim        # In order to use COQ, you have to install some deps using :COQDeps which will dirty up the system
      lualine-nvim
      vim-nix
    ];

    extraConfig = ''
      :luafile ~/.config/nvim/init.lua
    '';
  };

  xdg.configFile.nvim = {
    source = ./nvimConfig;
    recursive = true;
  };


  services.picom = {
    enable = true;
    package = unstable.picom-next;
    settings = builtins.import ./picomConfig;
  };

  services.polybar = {
    enable = true;
    script = "polybar example &";
    config = ./polybarConfig;
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
