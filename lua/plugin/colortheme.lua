-- Keep the full config in one table so re-setup on toggle doesn't wipe
-- highlight_groups (rose-pine's setup replaces the whole config, no merge).
local transparent_state = false

local rose_pine_config = {
	styles = {
		transparency = transparent_state,
		italic = false,
	},

	highlight_groups = {
		Visual = { bg = "rose" },
		TelescopeBorder = { fg = "highlight_high", bg = "none" },
		TelescopeNormal = { bg = "none" },
		TelescopePromptNormal = { bg = "none" },
		TelescopeResultsNormal = { fg = "subtle", bg = "none" },
		TelescopeSelection = { fg = "text", bg = "base" },
		TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
	},
}

require("rose-pine").setup(rose_pine_config)

vim.cmd("colorscheme rose-pine")

local function toggle_transparency()
	transparent_state = not transparent_state
	rose_pine_config.styles.transparency = transparent_state

	require("rose-pine").setup(rose_pine_config)

	vim.cmd("colorscheme rose-pine")

	if transparent_state then
		print("Transparency: ON")
	else
		print("Transparency: OFF")
	end
end

vim.keymap.set("n", "<Leader>bg", toggle_transparency, { desc = "Toggle transparent background" })
