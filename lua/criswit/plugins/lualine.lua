local config = function()
	local lualine = require("lualine")
	lualine.setup({
		options = {
			theme = "auto",
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			icons_enabled = true,
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" }, -- git info and diagnostics
			lualine_c = {
				{ "filename", path = 1 }, -- show file path relative to root
				{
					"lsp_progress",
					separator = "|",
					fmt = function(str)
						return str:sub(1, 40) .. "..."
					end,
				},
			},
			lualine_x = { "encoding", "fileformat", "filetype" }, -- Encoding, format, type
			lualine_y = { "progress" }, -- File progress (percentage)
			lualine_z = { "location" }, -- Cursor location (line:col)
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { { "filename", path = 1 } }, -- Filename only in inactive windows
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {
			lualine_a = { { "tabs", mode = 2 } }, -- Display tabs as buttons
			lualine_b = { "buffers" }, -- Show open buffers
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		extensions = { "nvim-tree", "quickfix", "fugitive" }, -- Useful integrations
	})
end

return {
	"nvim-lualine/lualine.nvim",
	config = config,
}
