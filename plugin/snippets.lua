vim.pack.add({
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
})

require("luasnip.loaders.from_vscode").load()

local function check_back_space()
  local col = vim.fn.col(".") - 1
  if col == 0 then return true end
  local line = vim.fn.getline(".")
  return line:sub(col, col):match("%s") ~= nil
end

vim.keymap.set("i", "<Tab>", function()
  local luasnip = require("luasnip")
  if vim.fn.pumvisible() == 1 then
    return "<C-N>"
  end
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
    return ""
  end
  if check_back_space() then
    return "<Tab>"
  end
  return "<C-N>"
end, { expr = true, silent = true })

vim.keymap.set("s", "<Tab>", function()
  if require("luasnip").jumpable(1) then
    require("luasnip").jump(1)
    return ""
  end
  return "<Tab>"
end, { expr = true, silent = true })

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
  if require("luasnip").jumpable(-1) then
    require("luasnip").jump(-1)
    return ""
  end
  return "<S-Tab>"
end, { expr = true, silent = true })
