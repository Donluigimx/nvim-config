-- Custom FZF command
vim.env.FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .gitignore --ignore .git --ignore .vscode --ignore node_modules --ignore dist -l -g ""'

-- FZF remaps
vim.keymap.set('n', '<C-p>', ':Files<CR>', { silent = true })
vim.keymap.set('n', '<space>p', ':GitFiles<CR>', { silent = true })
vim.keymap.set('n', '<space>f', ':BLines<CR>', { silent = true })
vim.keymap.set('n', '<space>F', ':Ag<CR>', { silent = true })
