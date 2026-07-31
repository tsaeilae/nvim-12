-- Register an autocommand to compile fzf-native automatically on install/update
vim.api.nvim_create_autocmd("PackChanged", {
	desc = "Telescope: Automatically build fzf-native extension",
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
			vim.system({ "make" }, { cwd = ev.data.path })
		end
	end,
})

-- Load the FZF extension (if you installed it above)
pcall(require("telescope").load_extension, "fzf")

local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<c-d>"] = actions.delete_buffer,
			},
		},
		pickers = {
			find_files = {
				file_ignore_patterns = { "node_modules", "%.git", "%.venv" },
				hidden = true,
			},
			live_grep = {
				file_ignore_patterns = { "node_modules", "%.git", "%.venv" },
				additional_args = function(_)
					return { "--hidden" }
				end,
			},
		},
	},
})

-- Basic Telescope Keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
