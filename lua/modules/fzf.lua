local fd_opts = table.concat({
  "--color=never", -- disable color output
  "--hidden", -- include hidden 
  "--type f", -- files
  "--type l", -- and symbolic links
  "--exclude '.gitignore'",
  "--exclude '.git'",
  "--exclude '.vscode'",
  "--exclude 'node_modules'",
  "--exclude 'dist'",
  "--exclude '*.g.dart'",
  "--exclude '*.freezed.dart'",
}, ' ')
require('fzf-lua').setup({
  'ivy',
  files = {
    previewer = "bat",
    -- formatter = "path.filename_first",
    fd_opts = fd_opts,
  },
})

vim.keymap.set('n', '<C-p>', ':FzfLua files<CR>', { silent = true })
vim.keymap.set('n', '<space>p', ':FzfLua git_files<CR>', { silent = true })
vim.keymap.set('n', '<leader>s', ':FzfLua git_status<CR>', { silent = true })
vim.keymap.set('n', '<space>F', ':FzfLua live_grep<CR>', { silent = true })
