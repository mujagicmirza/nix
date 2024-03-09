{ config, pkgs, lib, ...}:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig      # LSP
      nvim-cmp
      cmp-nvim-lsp

      telescope-nvim      # Fuzzy serach
        plenary-nvim
      vim-fugitive        # Git
      gitsigns-nvim       # Inline blame and stuff
      copilot-vim         # Github Copilot
      nvim-tree-lua       # File manager
      lualine-nvim        # Status line
      neoformat           # Formatter
      vim-tmux-navigator  # Tmux navigation

      vim-nix             # Nix syntax
      vim-glsl            # GLSL syntax

      nvim-web-devicons   # Icons
      nvim-colorizer-lua
      nvim-treesitter.withAllGrammars
      vimtex              # LaTeX support
      # ultisnips         # Snippets

      # Colorschemes
      papercolor-theme
      gruvbox-nvim
      onehalf

    ];

    extraConfig = ''
      :luafile ~/.config/nvim/init.lua
    '';
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };


}
