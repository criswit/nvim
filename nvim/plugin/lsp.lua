local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)

		vim.keymap.set("n", "<leader>ff", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set("n", "<leader>ra", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end,
})

local capabilities = cmp_nvim_lsp.default_capabilities()

local servers = {
	gopls = {
		capabilities = capabilities,
	},
	bashls = {
		capabilities = capabilities,
	},
	nil_ls = {
		capabilities = capabilities,
		settings = {
			["nil"] = {
				formatting = {
					command = { "nixpkgs-fmt" },
				},
			},
		},
	},
	ts_ls = {
		-- prevents clashing with denols
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
		single_file_support = false,
	},
}

for key, value in pairs(servers) do
	lspconfig[key].setup(value)
end

