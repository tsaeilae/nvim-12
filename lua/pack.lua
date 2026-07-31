vim.pack.add({
    -- ------ Theme -------------------------------------------------------------
    { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
     -- ------ Core libraries ---------------------------------------------------
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    -- ------ Completion & snippets --------------------------------------------
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
     -- ------ LSP tooling ------------------------------------------------------
	  { src = "https://github.com/mason-org/mason.nvim" },
	  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	  { src = "https://github.com/mason-org/mason-tool-installer.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
     -- ------ LLM --------------------------------------------------
    { src = "https://github.com/nickjvandyke/opencode.nvim", version = vim.version.range("*")},
    -- ------ Telescope (fuzzy finder) -----------------------------------------
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
     -- ------ File navigation --------------------------------------------------
    { src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = vim.version.range("3") },
    { src = "https://github.com/MunifTanjim/nui.nvim" },
    { src = "https://github.com/mbbill/undotree" },
    -- ------ UI --------------------------------------------------------------
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/karb94/neoscroll.nvim" },
})

-- ---------------------------------------------------------------------------
-- 2. Configure each plugin
-- ---------------------------------------------------------------------------
-- Ordering matters for two reasons:
--   * The colorscheme must load before anything that reads its highlights.
--   * LSP must setup AFTER blink so we can feed blink's capabilities
--     into lspconfig.
local function safe_require(mod)
  local ok, err = pcall(require, "plugin." .. mod)
  if not ok then
    vim.notify(("Failed loading plugins.%s: %s"):format(mod, err), vim.log.levels.ERROR)
  end
end

safe_require("colortheme")   -- FIRST
safe_require("telescope")
safe_require("blink")    -- blink.cmp — before LSP
safe_require("lsp")           -- uses blink.cmp capabilities
safe_require("lualine")
safe_require("neoscroll")
safe_require("neotree")
safe_require("opencode")
