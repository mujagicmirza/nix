{ config, pkgs, ... }:
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
      nvim-scrollbar      # Scrollbar
      vim-fugitive        # Git
      gitsigns-nvim       # Inline blame and stuff
      gruvbox-nvim        # Color scheme
      copilot-vim         # Github Copilot
      nvim-tree-lua       # File manager
      lualine-nvim        # Status line
      vim-nix             # Nix syntax
      neoformat           # Formatter


      nvim-web-devicons   # Icons
      nvim-treesitter
      vimtex              # LaTeX support
      # ultisnips         # Snippets
    ];

    extraConfig = ''
      :luafile ~/.config/nvim/init.lua
    '';
  };

}
