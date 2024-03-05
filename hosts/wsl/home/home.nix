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
    (modulesPath + /ranger/ranger.nix)
  ];

  home.username = "mirza";
  home.homeDirectory = "/home/mirza";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [ 
    # Development
    git
    gh
    github-copilot-cli
    (python311.withPackages (p: with p; [
      requests
    ]))
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
    unstablePkgs.atuin

    gnome.nautilus

    # System
    jq
    highlight
    file
    htop
  ];


  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
