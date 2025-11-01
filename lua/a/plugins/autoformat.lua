return { -- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre", "BufNewFile" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>l",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local disable_filetypes = { c = true, cpp = true }
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return nil
			else
				return {
					timeout_ms = 2500,
					lsp_format = "fallback",
				}
			end
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			c = { "clang_format" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },
			json = { "prettierd", "prettier" },
			markdown = { "prettierd", "prettier" },
			html = { "htmlbeautifier" },
			css = { "prettierd", "prettier" },
		},
	},
}
