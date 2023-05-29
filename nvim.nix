{ config, pkgs, ... }:
{
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

}
