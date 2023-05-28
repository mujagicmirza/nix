require('LspConfig')
require('VimConfig')
require('TreeConfig')
--local use = require('packer').use
--
--require('packer').startup(function()
--  use {
--    'wbthomason/packer.nvim',
--    'neovim/nvim-lspconfig',
--    'kyazdani42/nvim-web-devicons',
--    'nvim-lua/plenary.nvim',
--    'nvim-treesitter/nvim-treesitter',
--    'nvim-telescope/telescope.nvim',
--    'kyazdani42/nvim-tree.lua',
--      requires = {
--      'kyazdani42/nvim-web-devicons', -- optional, for file icons
--      },
--      tag = 'nightly',
--    --'Mofiqul/dracula.nvim',
--    'ms-jpq/coq_nvim', branch = 'coq',
--    'lervag/vimtex',
--    'SirVer/ultisnips',
--    'tpope/vim-fugitive',
--    'nvim-lualine/lualine.nvim',
--    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
--    'petertriho/nvim-scrollbar',
--    'APZelos/blamer.nvim',
--    'pangloss/vim-javascript',
--    'jonsmithers/vim-html-template-literals',
--    'ellisonleao/gruvbox.nvim',
--    'github/copilot.vim',
--    }
--end)

vim.cmd([[
    nnoremap <C-p> <cmd>Telescope find_files<cr>
    nnoremap <C-f> <cmd>Telescope live_grep<cr>
]])

vim.cmd([[
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
]])
vim.cmd([[
let g:vimtex_quickfix_enabled = 0
]])

vim.cmd([[
let g:UltiSnipsSnippetDirectories=["custom-snippets"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
]])

require('lualine').setup{
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {{'filename', path = 1}},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    tabline = {
      lualine_a = {
          {
              'tabs',
              mode = 2,
              max_length = vim.o.columns,
          }
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    }
}
require("scrollbar").setup()
