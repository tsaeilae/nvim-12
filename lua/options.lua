-- Basic settings
vim.opt.number = true                   -- Line numbers
vim.opt.relativenumber = true           -- Relative line numbers
vim.opt.wrap = false                    -- Don't wrap lines
vim.opt.scrolloff = 10                  -- Keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8               -- Keep 8 columns left/right of cursor
vim.opt.mouse = "a"                     -- Enable mouse mode (default: '')
vim.opt.cursorline = true               -- Highlight the current line (default: false):
vim.g.have_nerd_font = true             -- Nerdfont available
vim.opt.breakindent = true              -- wrapped line repeats indent
vim.opt.undofile = true                 -- Save undo history
vim.opt.splitright = true               -- split opened right
vim.opt.splitbelow = true               -- split opened below
vim.opt.confirm = true                  -- save the current file(s)
vim.opt.showmode = false                -- we don't need to see -- INSERT --
vim.opt.backup = false                  -- do not create a backup file
vim.opt.writebackup = false             -- do not write to a backup file
vim.opt.swapfile = false                -- do not create a swapfile
vim.opt.hidden = true                   -- allow hidden buffers
vim.opt.errorbells = false              -- no error sounds
vim.opt.backspace = "indent,eol,start"  -- better backspace behaviour
vim.opt.autochdir = false               -- do not autochange directories
vim.opt.iskeyword:append("-")           -- include - in words
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
vim.opt.modifiable = true               -- Allow buffer modifications

-- Indentation
vim.opt.tabstop = 2        -- Tab width
vim.opt.shiftwidth = 2     -- Indent width
vim.opt.softtabstop = 2    -- Soft tab stop
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true  -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true  -- Case sensitive if uppercase in search
vim.opt.hlsearch = false  -- Don't highlight search results
vim.opt.incsearch = true  -- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.colorcolumn = "100" -- show a column at 100 position chars
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 2 -- How long to show matching bracket
vim.opt.cmdheight = 1 -- Command line height
vim.opt.fillchars = { eob = "♡" } -- empty line char
vim.opt.shortmess:append("c") -- Prevents showing extra messages like "match 1 of 2" in core ui2 msg float window

-- ESC key speed
-- vim.o.timeoutlen = 300 -- Time in milliseconds to wait for a mapped sequence to complete
-- vim.o.ttimeoutlen = 10 -- Time in milliseconds to wait for a key code sequence (like Esc) to complete

-- Enable native auto-triggering completion
-- vim.opt.autocomplete = true -- Suggestions appear automatically as you type
-- vim.opt.autocompletedelay = 200 -- Delay in milliseconds before popup appears

-- Def_ine the completion sources (Vim's native engine)
-- '.' = current buffer
-- 'w' = windows
-- 'b' = other loaded buffers
-- 'o' = omnifunc (which LSP handles automatically)
-- vim.opt.complete = ".,w,b,o"

-- UI and matching adjustments
-- vim.opt.completeopt = "menuone,noselect,fuzzy" -- Use the brand new 'fuzzy' matching!
-- vim.opt.pumheight = 10                         -- Max items shown in the popup menu
-- vim.opt.pumborder = "single"

