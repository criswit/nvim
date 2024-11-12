vim.g.material_style = "darker"

require("material").setup({
	contrast = {
		sidebars = false,
		floating_windows = false,
	},

	plugins = {},

	disable_background = false,
})

require("onedarkpro").setup({
	colors = {
		onedark = {
			bg = (vim.g.neovide and "#16233B" or "#282c34"),
			cursorline = (vim.g.neovide and "#131F34" or "#2d313b"),
		},
	},
})

vim.cmd.colorscheme("material")
