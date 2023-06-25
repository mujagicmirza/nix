require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  },
  diagnostics = {
    enable = true,
  },
  update_focused_file = {
    enable = true,
  },
})

local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set('n', '<F2>', ":NvimTreeToggle<CR>", bufopts)
