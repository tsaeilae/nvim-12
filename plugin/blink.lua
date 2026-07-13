vim.pack.add({
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require('blink.cmp').setup({
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    }
  },

  sources = { default = { 'lsp', 'buffer', 'snippets', 'path' } },

  fuzzy = { implementation = "prefer_rust_with_warning" }
})
