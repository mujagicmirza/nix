require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
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
  }
})

local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set('n', '<F2>', ":NvimTreeToggle<CR>", bufopts)
