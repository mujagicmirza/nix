require('LspConfig')
require('VimConfig')
require('TreeConfig')

vim.cmd([[
    nnoremap <C-p> <cmd>Telescope find_files<cr>
    nnoremap <C-f> <cmd>Telescope live_grep<cr>
    nnoremap <C-b> <cmd>Telescope buffers<cr>
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
let g:vimtex_view_method = 'zathura'
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

require('gitsigns').setup()


