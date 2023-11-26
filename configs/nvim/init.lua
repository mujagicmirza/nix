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

require('gitsigns').setup()

require("colorizer").setup {
    user_default_options = {
      RGB = true, -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      names = true, -- "Name" codes like Blue or blue
      RRGGBBAA = false, -- #RRGGBBAA hex codes
      AARRGGBB = false, -- 0xAARRGGBB hex codes
      rgb_fn = true, -- CSS rgb() and rgba() functions
      hsl_fn = false, -- CSS hsl() and hsla() functions
      css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      -- Available modes for `mode`: foreground, background,  virtualtext
      mode = "background", -- Set the display mode.
      -- Available methods are false / true / "normal" / "lsp" / "both"
      -- True is same as normal
      tailwind = true, -- Enable tailwind colors
      -- parsers can contain values used in |user_default_options|
      sass = { enable = true, parsers = { "scss" }, }, -- Enable sass colors
      virtualtext = "■",
      -- update color values even if buffer is not focused
      -- example use: cmp_menu, cmp_docs
      always_update = false
    },
    -- all the sub-options of filetypes apply to buftypes
    buftypes = {},
}
require("pets").setup({
  -- your options here
})

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-d>"] = require('telescope.actions').delete_buffer,
      }
    },
    file_ignore_patterns = { "package-lock.json" }
  }
}
require('leap').add_default_mappings()

require("gruvbox").setup({
  contrast = "hard",
  transparent_mode = true,
})
vim.cmd("colorscheme gruvbox")
