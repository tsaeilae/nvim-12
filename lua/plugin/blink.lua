require('blink.cmp').setup({
   keymap = {
    -- `enter` preset wires <CR> → accept. Then we override <Tab>/<S-Tab> so
    -- they cycle the completion menu when it's open, fall back to snippet
    -- jumps inside a snippet, and finally fall through to a literal Tab.
    preset    = "enter",
    ["<Tab>"]   = { "select_next", "snippet_forward",  "fallback" },
    ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
  },

  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    }
  },

  sources = { default = { 'lsp', 'buffer', 'snippets', 'path' } },

  fuzzy = {
    implementation = "prefer_rust_with_warning",
    prebuilt_binaries = { download = true }
  }
})
