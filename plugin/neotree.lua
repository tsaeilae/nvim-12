require("neo-tree").setup({})

-- Neotree toggle
vim.keymap.set("n", "<leader>e", ":Neotree float reveal toggle<CR>", { desc = "Toggle Neotree" })
