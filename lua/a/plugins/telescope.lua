return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		{
			"BurntSushi/ripgrep",
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",

			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		require("telescope").setup({
			defaults = {
				initial_mode = "normal",
			},
		})

		pcall(require("telescope").load_extension, "fzf")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
	end,
}
