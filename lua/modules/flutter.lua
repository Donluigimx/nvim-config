-- keymaps for flutter tools
vim.keymap.set('n', '<space>fn', ':FlutterRun<CR>')
vim.keymap.set('n', '<space>fd', ':FlutterDevices<CR>')
vim.keymap.set('n', '<space>fr', ':FlutterReload<CR>')
vim.keymap.set('n', '<space>fR', ':FlutterRestart<CR>')
vim.keymap.set('n', '<space>fq', ':FlutterQuit<CR>')
vim.keymap.set('n', '<space>fl', ':FlutterLogToggle<CR>')
vim.keymap.set('n', '<space>fLC', ':FlutterLogClear<CR>')
vim.keymap.set('n', '<space>fo', ':FlutterOutlineToggle<CR>')

vim.keymap.set('n', '<space>fN', function()
  vim.ui.input({ prompt = 'FlutterRun flags (e.g., --profile): ' }, function(input)
    if input then
      vim.cmd('FlutterRun ' .. input)
    end
  end)
end, { desc = 'Run Flutter with flags' })
