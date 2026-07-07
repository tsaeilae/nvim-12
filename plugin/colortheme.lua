vim.pack.add({
	{
		src = "https://github.com/rose-pine/neovim",
		name = "rose-pine",
	},
})

local transparent_state = false

require("rose-pine").setup({
	styles = {
		transparency = transparent_state,
		italic = false,
	},

	highlight_groups = {
		TelescopeBorder = { fg = "highlight_high", bg = "none" },
		TelescopeNormal = { bg = "none" },
		TelescopePromptNormal = { bg = "none" },
		TelescopeResultsNormal = { fg = "subtle", bg = "none" },
		TelescopeSelection = { fg = "text", bg = "base" },
		TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
	},
})

vim.cmd("colorscheme rose-pine")

local function toggle_transparency()
	transparent_state = not transparent_state

	require("rose-pine").setup({
		styles = {
			transparency = transparent_state,
		},
	})

	vim.cmd("colorscheme rose-pine")

	if transparent_state then
		print("Transparency: ON")
	else
		print("Transparency: OFF")
	end
end

vim.keymap.set("n", "<Leader>bg", toggle_transparency, { desc = "Toggle transparent background" })
