-- Highlight when yanking (copying) text
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

