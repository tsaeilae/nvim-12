local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Center screen after moving up / down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center cursor after moving down half-page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center cursor after moving up half-page" })

-- Clear highlights on search when pressing <Esc> in normal mode
-- See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Neotree toggle
vim.keymap.set("n", "<leader>e", ":Neotree float reveal toggle<CR>", { desc = "Toggle Neotree" })

-- save file
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", { desc = "Save file" })

-- save file with double tap esc in insert and normal mode
vim.keymap.set({ "i", "n" }, "<Esc><Esc>", "<cmd>w<CR><Esc>", { desc = "Save file with esc double tab" })

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", { desc = "Quit file" })

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', { desc = "Delete single file without copying to register" })

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Move lines up/down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line(s) down in visual mode" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line(s) up in visual mode" })

-- Restart
vim.keymap.set("n", "<leader>r", ":restart <CR>", { desc = "Restart" })

