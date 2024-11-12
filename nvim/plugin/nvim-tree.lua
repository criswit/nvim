require("nvim-tree").setup({
	git = {
		ignore = false,
	},
})

vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { silent = true })
