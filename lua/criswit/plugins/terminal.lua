local config = function()
	local term = require("FTerm")
	term.setup({
		border = "double",
		dimensions = {
			height = 0.9,
			width = 0.9,
		},
	})
	vim.keymap.set("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
	vim.keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
end

return {
	"numToStr/FTerm.nvim",
	config = config,
}
