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
