{ config, pkgs, lib, ...}:

let
  fromGitHub = ref: repo: pkgs.vimUtils.buildVimPluginFrom2Nix {
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
      gruvbox-nvim        # Color scheme
      copilot-vim         # Github Copilot
      nvim-tree-lua       # File manager
      lualine-nvim        # Status line
      vim-nix             # Nix syntax
      neoformat           # Formatter


      nvim-web-devicons   # Icons
      nvim-colorizer-lua
      nvim-treesitter
      vimtex              # LaTeX support
      # ultisnips         # Snippets
      (fromGitHub "HEAD" "ntk148v/komau.vim")
      (fromGitHub "HEAD" "shaunsingh/nord.nvim")

      (fromGitHub "HEAD" "giusgad/hologram.nvim")
      (fromGitHub "HEAD" "MunifTanjim/nui.nvim")
      (fromGitHub "HEAD" "giusgad/pets.nvim")
    ];

    extraConfig = ''
      :luafile ~/.config/nvim/init.lua
    '';
  };

}
