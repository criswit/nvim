local cmp = require("cmp")
local lspkind = require("lspkind")

local function select_next_item(fallback)
	if cmp.visible() then
		cmp.select_next_item()
	else
		fallback()
	end
end

local function confirm_completion(fallback)
	if cmp.visible() then
		cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert })
	else
		fallback()
	end
end

cmp.setup({
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "path" },
	}),
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = function(fallback)
			select_next_item(fallback)
		end,
		["<CR>"] = function(fallback)
			confirm_completion(fallback)
		end,
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
		}),
	},
})

-- Use buffer source for `/` and `?`
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})

