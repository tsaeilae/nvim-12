-- Initialize UI2 with routing overrides
require('vim._core.ui2').enable({
  enable = true,
  msg = {
    targets = {
      [''] = 'msg' -- message types in float window
    }
  }
})
-- Basic settings
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.wrap = false -- Don't wrap lines
vim.opt.scrolloff = 10 -- Keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor
vim.opt.mouse = "a" -- Enable mouse mode (default: '')
vim.opt.cursorline = true -- Highlight the current line (default: false):
vim.g.have_nerd_font = true -- Nerdfont available
vim.opt.breakindent = true -- wrapped line repeats indent
vim.o.undofile = true -- Save undo history
vim.o.splitright = true -- split opened right
vim.o.splitbelow = true -- split opened below
vim.o.confirm = true -- save the current file(s)
vim.o.showmode = false -- we don't need to see -- INSERT --

-- Indentation
vim.opt.tabstop = 2 -- Tab width
vim.opt.shiftwidth = 2 -- Indent width
vim.opt.softtabstop = 2 -- Soft tab stop
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case sensitive if uppercase in search
vim.opt.hlsearch = false -- Don't highlight search results
vim.opt.incsearch = true -- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.colorcolumn = "100" -- show a column at 100 position chars
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 2 -- How long to show matching bracket
vim.opt.cmdheight = 1 -- Command line height
vim.opt.fillchars = { eob = "♡" } -- empty line char

-- ESC key speed
-- vim.o.timeoutlen = 300 -- Time in milliseconds to wait for a mapped sequence to complete
-- vim.o.ttimeoutlen = 10 -- Time in milliseconds to wait for a key code sequence (like Esc) to complete

-- Enable native auto-triggering completion
vim.o.autocomplete = true       -- Suggestions appear automatically as you type
vim.o.autocompletedelay = 200    -- Delay in milliseconds before popup appears

-- Define the completion sources (Vim's native engine)
-- '.' = current buffer
-- 'w' = windows
-- 'b' = other loaded buffers
-- 'o' = omnifunc (which LSP handles automatically)
vim.o.complete = ".,w,b,o"

-- UI and matching adjustments
vim.o.completeopt = "menuone,noselect,fuzzy" -- Use the brand new 'fuzzy' matching!
vim.o.pumheight = 10                         -- Max items shown in the popup menu
vim.opt.pumblend = 10
vim.o.pumborder = "single"

vim.opt.backup = false -- do not create a backup file
vim.opt.writebackup = false -- do not write to a backup file
vim.opt.swapfile = false -- do not create a swapfile

vim.opt.hidden = true -- allow hidden buffers
vim.opt.errorbells = false -- no error sounds
vim.opt.backspace = "indent,eol,start" -- better backspace behaviour
vim.opt.autochdir = false -- do not autochange directories
vim.opt.iskeyword:append("-") -- include - in words

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Disable native autocompletion in Telescope and other prompt/special buffers
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("disable_autocomplete_in_prompts", { clear = true }),
  callback = function(ev)
    -- If the buffer is a prompt (Telescope) or a non-file helper window, turn autocomplete off
    if vim.bo[ev.buf].buftype ~= "" or vim.bo[ev.buf].filetype == "TelescopePrompt" then
      vim.bo[ev.buf].autocomplete = false
    else
      vim.bo[ev.buf].autocomplete = true
    -- Force local buffer to keep it active for standard files
    end
  end,
})


-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
