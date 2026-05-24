return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "tsx", "c", "lua", "vim", "vimdoc", "rust", "cpp", "javascript", "html", "svelte" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
