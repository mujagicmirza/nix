{ config, pkgs, lib, ...}:

let
  fromGitHub = ref: repo: pkgs.vimUtils.buildVimPlugin {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };
in
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
      nvim-treesitter
      vimtex              # LaTeX support
      # ultisnips         # Snippets

      # Colorschemes
      papercolor-theme
      (fromGitHub "HEAD" "ntk148v/komau.vim")
      (fromGitHub "HEAD" "shaunsingh/nord.nvim")
      gruvbox-nvim

      (fromGitHub "HEAD" "giusgad/pets.nvim")
        (fromGitHub "HEAD" "giusgad/hologram.nvim")
        (fromGitHub "HEAD" "MunifTanjim/nui.nvim")
    ];

    extraConfig = ''
      :luafile ~/.config/nvim/init.lua
    '';
  };

}
