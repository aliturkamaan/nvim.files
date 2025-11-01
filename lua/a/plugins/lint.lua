return {
	{ -- Linting
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			-- Define your linters (only what you use)
			lint.linters_by_ft = {
				markdown = { "markdownlint" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				json = { "jsonlint" }, -- optional
				python = { "ruff" }, -- add if you use Python
			}

			-- Prevent default linters from loading
			for _, ft in ipairs({
				"clojure",
				"dockerfile",
				"inko",
				"janet",
				"ruby",
				"terraform",
				"text",
				"rst",
			}) do
				lint.linters_by_ft[ft] = nil
			end

			-- Auto-lint on save & enter (but only if buffer is modifiable)
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					if vim.bo.modifiable then
						lint.try_lint()
					end
				end,
			})

			-- Manual trigger
			vim.keymap.set("n", "<leader>ll", function()
				lint.try_lint()
			end, { desc = "[L]int current file" })
		end,
	},
}
