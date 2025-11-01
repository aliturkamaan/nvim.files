---@meta
vim = vim or {}

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("a.plugins")

-- colorsheme
vim.cmd([[colorscheme gruvbox]])

vim.opt.clipboard = "unnamedplus"
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.showmode = false

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Diagnostic
vim.diagnostic.config({
	severity_sort = true,
	float = {
		border = "rounded",
		source = "if_many",
	},
	underline = {
		severity = vim.diagnostic.severity.ERROR,
	},
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = "Error ",
			[vim.diagnostic.severity.WARN] = "Warning ",
			[vim.diagnostic.severity.INFO] = "Info ",
			[vim.diagnostic.severity.HINT] = "Hint ",
		},
	} or false, -- Use `false` not `{}`

	virtual_text = {
		source = "if_many",
		spacing = 2,
		format = function(diagnostic)
			-- Return only the message, no table lookup needed
			return diagnostic.message
		end,
	},
})

-- Buffer navigation
vim.keymap.set("n", "<leader>]", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>[", ":bprevious<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
