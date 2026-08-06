-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Return to the last cursor position when reopening a file.
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local lcount = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- indent-blankline draws guides as overlay virtual text, which renders on top
-- of the cursor and hides the bar cursor in insert mode. Blank the guide cell
-- under the cursor so the cursor stays visible.
vim.api.nvim_create_augroup("ibl_cursor", { clear = true })
local ibl_cursor_ns = vim.api.nvim_create_namespace("ibl_cursor")

local function refresh_ibl_cursor_overlay()
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_clear_namespace(buf, ibl_cursor_ns, 0, -1)

  local config = require("ibl.config").get_config(buf)
  if not config.enabled then
    return
  end
  if vim.tbl_contains(config.exclude.filetypes, vim.bo[buf].filetype) then
    return
  end
  if vim.tbl_contains(config.exclude.buftypes, vim.bo[buf].buftype) then
    return
  end

  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local char = vim.api.nvim_get_current_line():sub(col + 1, col + 1)
  if char == " " or char == "" then
    vim.api.nvim_buf_set_extmark(buf, ibl_cursor_ns, row - 1, col, {
      virt_text = { { " " } },
      virt_text_pos = "overlay",
      hl_mode = "combine",
      priority = 2000,
    })
  end
end

vim.api.nvim_create_autocmd({ "InsertEnter", "CursorMovedI", "TextChangedI", "InsertLeave" }, {
  group = "ibl_cursor",
  callback = refresh_ibl_cursor_overlay,
})

