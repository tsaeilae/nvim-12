-- Enable Neovim's Lua bytecode cache. Must run before any require() so cached
-- modules (config.*, plugins.*) hit the cache on this run, not the next one.
vim.loader.enable()

-- Initialize UI2 with routing overrides
require("vim._core.ui2").enable({
  enable = true,
  msg = {
    targets = {
      [""] = "msg", -- message types in float window
    },
  },
})

-- Remap space as leader key
-- Leader must be set BEFORE any plugin loads, because plugins bind to whatever
-- the leader is at their load time.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")
require("keymaps")
require("autocmds")
require("pack")
require("lsp")
