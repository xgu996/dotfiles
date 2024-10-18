return {
	-- "catppuccin/nvim",
	-- lazy = false,
	-- name = "catppuccin",
	-- opts = {
	-- 	integrations = {
	-- 		aerial = true,
	-- 		alpha = true,
	-- 		cmp = true,
	-- 		dashboard = true,
	-- 		flash = true,
	-- 		grug_far = true,
	-- 		gitsigns = true,
	-- 		headlines = true,
	-- 		illuminate = true,
	-- 		indent_blankline = { enabled = true },
	-- 		leap = true,
	-- 		lsp_trouble = true,
	-- 		mason = true,
	-- 		markdown = true,
	-- 		mini = true,
	-- 		native_lsp = {
	-- 			enabled = true,
	-- 			underlines = {
	-- 				errors = { "undercurl" },
	-- 				hints = { "undercurl" },
	-- 				warnings = { "undercurl" },
	-- 				information = { "undercurl" },
	-- 			},
	-- 		},
	-- 		-- navic = { enabled = true, custom_bg = "lualine" },
	-- 		neotest = true,
	-- 		neotree = true,
	-- 		noice = true,
	-- 		notify = true,
	-- 		semantic_tokens = true,
	-- 		telescope = true,
	-- 		treesitter = true,
	-- 		treesitter_context = true,
	-- 		which_key = true,
	-- 	},
	-- },
	--
	-- config = function()
	-- 	vim.cmd [[
	-- 				set termguicolors
	-- 				colorscheme catppuccin
	-- 		]]
	-- end


	-- 'rose-pine/neovim',
	--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
	--   priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	--     vim.cmd[[colorscheme rose-pine]]
	--   end,


	-- 	"maxmx03/dracula.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		vim.cmd [[
	-- 		set termguicolors
	-- 		colorscheme dracula
	-- ]]
	-- 	end

	-- "catppuccin/nvim",
	-- lazy = true,
	-- name = "catppuccin",
	-- opts = {
	-- 	integrations = {
	-- 		aerial = true,
	-- 		alpha = true,
	-- 		cmp = true,
	-- 		dashboard = true,
	-- 		flash = true,
	-- 		grug_far = true,
	-- 		gitsigns = true,
	-- 		headlines = true,
	-- 		illuminate = true,
	-- 		indent_blankline = { enabled = true },
	-- 		leap = true,
	-- 		lsp_trouble = true,
	-- 		mason = true,
	-- 		markdown = true,
	-- 		mini = true,
	-- 		native_lsp = {
	-- 			enabled = true,
	-- 			underlines = {
	-- 				errors = { "undercurl" },
	-- 				hints = { "undercurl" },
	-- 				warnings = { "undercurl" },
	-- 				information = { "undercurl" },
	-- 			},
	-- 		},
	-- 		navic = { enabled = true, custom_bg = "lualine" },
	-- 		neotest = true,
	-- 		neotree = true,
	-- 		noice = true,
	-- 		notify = true,
	-- 		semantic_tokens = true,
	-- 		telescope = true,
	-- 		treesitter = true,
	-- 		treesitter_context = true,
	-- 		which_key = true,
	-- 	},
	-- },

	-- "veiledshadow/nvim-deus",
	-- lazy = false,
	-- name = "deus",
	-- --priority = 1000,
	-- config = function()
	-- 	vim.cmd([[
	-- 		set termguicolors
	-- 		colorscheme deus
	-- 	]])
	-- end

	-- 'Mofiqul/vscode.nvim',
	-- lazy = false,
	-- name = "vscode",
	-- priority = 1000,
	-- config = function()
	-- 	vim.cmd([[colorscheme vscode]])
	-- 	-- vim.cmd([[hi Normal guibg=#000022]])
	-- 	-- vim.cmd([[hi NonText guibg=#000022]])
	-- 	-- vim.cmd([[hi SignColumn guibg=#000022]])
	-- 	-- vim.cmd([[hi LineNr guibg=#000022]])
	-- 	-- vim.cmd([[hi ColorColumn guibg=#660000]])
	-- end

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "moon",
				transparent = false,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					keywords = { bold = true, italic = true },
					sidebars = "transparent",
					floats = "transparent",
				},
				plugins = {
					all = true,
				},
				on_colors = function(colors) end,
				on_highlights = function(highlights, colors)
					highlights.LspInlayHint = {
						bg = colors.none,
						fg = colors.dark3,
					}
					highlights.Statement = { fg = colors.magenta, italic = true, bold = true }
					highlights.Type = { fg = colors.blue1, bold = true }
					highlights["@tag.attribute.tsx"] = { italic = true, fg = colors.green2 }
					highlights["@keyword.import.tsx"] = { bold = true, italic = true, fg = colors.red1 }
					highlights["@keyword.import.typescript"] = { bold = true, italic = true, fg = colors.red1 }
					highlights["@keyword.export.tsx"] = { bold = true, italic = true, fg = colors.red1 }
					highlights["@keyword.export.typescript"] = { bold = true, italic = true, fg = colors.red1 }
					highlights["@keyword.import.rust"] = { bold = true, fg = colors.red }
					highlights["@lsp.type.rust"] = { italic = true, fg = colors.red1 }
					highlights["@lsp.type.namespace.rust"] = { fg = colors.red1 }

					highlights.RainbowDelimiterRed = { fg = "#FF5D62" }
					highlights.RainbowDelimiterYellow = { fg = "#E6C384" }
					highlights.RainbowDelimiterBlue = { fg = "#7FB4CA" }
					highlights.RainbowDelimiterOrange = { fg = "#FFA066" }
					highlights.RainbowDelimiterGreen = { fg = "#98BB6C" }
					highlights.RainbowDelimiterViolet = { fg = "#D27E99" }
					highlights.RainbowDelimiterCyan = { fg = "#7AA89F" }
				end,
			})
			-- vim.cmd[[colorscheme tokyonight]]
			vim.cmd.colorscheme("tokyonight")
		end,
	},

}
