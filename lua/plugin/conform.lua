local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
		yaml = { "prettierd", "prettier", stop_after_first = true },
		markdown = { "prettierd", "prettier", stop_after_first = true },
	},
	format_on_save = function(bufnr)
		-- Allow disabling per-buffer or globally via `vim.g.disable_autoformat`.
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		-- Skip on bigfiles — formatters on multi-MB buffers stall the save.
		if vim.b[bufnr].bigfile then
			return
		end
		-- 2s cap: prettierd's first format per project cold-starts a daemon and
		-- loads local prettier + plugins (svelte/tailwind), which blows past a
		-- tight cap. Warm formats take ~10-30ms, so this rarely engages.
		return { timeout_ms = 2000, lsp_format = "fallback" }
	end,
})
