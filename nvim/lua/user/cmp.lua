local icons = require("user.icons")

local setCompHL = function()
	vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#BD93F9", bg = "NONE", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#fdff00", bg = "NONE", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#FF5555", bg = "NONE", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })

	vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#CAA9FA", bg = "NONE", italic = true, bold = true })

	vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#FF9933", bg = "None", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#FF9933", bg = "None", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#FF9933", bg = "None", bold = true })

	vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#FF5555", bg = "None", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#FF5555", bg = "None", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#FF5555", bg = "None", bold = true })

	vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FF92D0", bg = "None", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FF92D0", bg = "None", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FF92D0", bg = "None", bold = true })

	vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#78AB30", bg = "None", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#78AB30", bg = "None", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#78AB30", bg = "None", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#78AB30", bg = "None", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#78AB30", bg = "None", bold = true })

	vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#cccccc", bg = "None", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#7E8294", bg = "None", bold = true })

	vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#D4A959", bg = "None", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#D4A959", bg = "None", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#D4A959", bg = "None", bold = true })

	vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#6C8ED4", bg = "None", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#6C8ED4", bg = "None", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#6C8ED4", bg = "None", bold = true })

	vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#58B5A8", bg = "None", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#58B5A8", bg = "None", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#58B5A8", bg = "None", bold = true })

	-- CMP penu
	vim.api.nvim_set_hl(0, "MyPmenu", { bg = "#2D323B", fg = "#A377BF", bold = true, italic = true })
	vim.api.nvim_set_hl(0, "MyPmenuSel", { bg = "#aaafff", fg = "black", bold = true, italic = true })
end

local M = {

	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies =
	{
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"zbirenbaum/copilot-cmp",
			config = function()
				require("copilot_cmp").setup()
			end
		},
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		{
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},

	},
}
M.config = function()
	setCompHL()
	local cmp = require("cmp")
	vim.opt.completeopt = { "menu", "menuone", "noselect" }

	cmp.setup({

		window = {
			completion = cmp.config.window.bordered({
				border = "double",
				winhighlight = "Normal:MyPmenu,FloatBorder:MyPmenu,CursorLine:MyPmenuSel,Search:None",
				side_padding = 1,
			})
		},

		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				require('luasnip').lsp_expand(args.body)
			end,
		},

		mapping = cmp.mapping.preset.insert({
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.abort(),
			['<CR>'] = cmp.mapping.confirm({ select = true }),
		}),

		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				-- Kind icons
				local kind = vim_item.kind

				-- vim_item.kind = string.format('%s', icons[vim_item.kind])
				vim_item.kind = (icons.kind[kind] or "?") .. " "
				vim_item.menu = " (" .. kind .. ")"

				-- vim_item.menu = ({
				-- 	buffer = "[Buffer]",
				-- 	nvim_lsp = "[LSP]",
				-- 	luasnip = "[LuaSnip]",
				-- 	nvim_lua = "[Lua]",
				-- 	latex_symbols = "[LaTeX]",
				-- })[entry.source.name]

				return vim_item
			end
		},

		sources = cmp.config.sources({
			{ name = "copilot" },
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
			{ name = "buffer" },
			{ name = "path" }
		})
	})
end

return M
