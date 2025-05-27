vim.diagnostic.config({
  virtual_text = true, -- enables inline errors/warnings/info
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local severity_map = {
  ["Error"] = vim.diagnostic.severity.ERROR,
  ["Warn"]  = vim.diagnostic.severity.WARN,
  ["Info"]  = vim.diagnostic.severity.INFO,
  ["Hint"]  = vim.diagnostic.severity.HINT,
}

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    -- these will be buffer-local keybindings
    -- because they only work if you have an active language server

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

    vim.keymap.set('n', '<leader>la', function()
      local items = { "All", "Error", "Warn", "Info", "Hint" }
      vim.ui.select(items, { prompt = "Select diagnostic severity:" }, function(choice)
        if choice then
          if choice == "All" then
            vim.diagnostic.setqflist()
          else
            vim.diagnostic.setqflist({ severity = severity_map[choice] })
          end
        end
      end)
    end, { desc = "Open Quickfix with selected LSP diagnostics" })

    vim.keymap.set('n', '<leader>ll', function()
      local items = { "All", "Error", "Warn", "Info", "Hint" }
      vim.ui.select(items, { prompt = "Select diagnostic severity:" }, function(choice)
        if choice then
          if choice == "All" then
            vim.diagnostic.setloclist()
          else
            vim.diagnostic.setloclist({ severity = severity_map[choice] })
          end
        end
      end)
    end, { desc = "Open Quickfix with all local LSP diagnostics" })
  end
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup Flutter LSP
require('flutter-tools').setup({
  fvm = true,
  decorations = {
    statusline = {
      app_version = true,
      device = true,
      project_config = true,
    }
  },
  widget_guides = {
    enabled = true,
  },
  lsp = {
    capabilities = lsp_capabilities,
  },
  on_init = function(client)
    -- disable formatting capabilities
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentFormattingRangeProvider = false
  end,
})

-- Setup LSP for Lua
require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
  capabilities = lsp_capabilities,
})

-- Setup for Javascript LSP (ts_ls)
require('lspconfig').ts_ls.setup({
  capabilities = lsp_capabilities,
})

---
-- Autocompletion config
---
local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),

    -- Tab for navigating the completion menu
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
})
