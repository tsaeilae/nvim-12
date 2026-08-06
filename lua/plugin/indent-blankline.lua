vim.api.nvim_set_hl(0, "IblIndent", { fg = "#7D7E8C" })

require("ibl").setup({
  indent = { char = "▏", highlight = { "IblIndent" } },
})                                                             

