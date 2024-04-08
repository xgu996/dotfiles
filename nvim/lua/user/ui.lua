local M = {

	-- {
	-- 	"nvim-zh/colorful-winsep.nvim",
	-- 	config = true,
	-- 	event = { "WinNew" },
	-- },

	{
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {
				-- config
			}
		end,
		dependencies = { { 'nvim-tree/nvim-web-devicons' } }
	},

	--transparent
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({ -- Optional, you don't have to run setup.
				groups = {                -- table: default groups
					'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
					'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
					'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
					'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
					'EndOfBuffer',
				},
				extra_groups = {}, -- table: additional groups that should be cleared
				exclude_groups = {}, -- table: groups you don't want to clear
			})
		end
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = "VeryLazy",
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		opts = {
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = false },
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"vim",
				"python",
				"latex",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection    = "<C-n>",
					node_incremental  = "<C-n>",
					node_decremental  = "<C-h>",
					scope_incremental = "<C-l>",
				},
			}
		},

		config = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				---@type table<string, boolean>
				local added = {}
				opts.ensure_installed = vim.tbl_filter(function(lang)
					if added[lang] then
						return false
					end
					added[lang] = true
					return true
				end, opts.ensure_installed)
			end
			require("nvim-treesitter.configs").setup(opts)
		end,

		-- config = function()
		-- 	require("nvim-treesitter.configs").setup({
		-- 		ensure_installed = {
		-- 			"c",
		-- 			"cpp",
		-- 			"lua",
		-- 			"vim",
		-- 			"python",
		-- 			"latex",
		-- 		},
		-- 		highlight = {
		-- 			enable = true,
		-- 			disable = {},
		-- 			use_languagetree = false,
		-- 		},
		-- 		indent = {
		-- 			enable = false
		-- 		},
		-- 		incremental_selection = {
		-- 			enable = true,
		-- 			keymaps = {
		-- 				init_selection    = "<C-n>",
		-- 				node_incremental  = "<C-n>",
		-- 				node_decremental  = "<C-h>",
		-- 				scope_incremental = "<C-l>",
		-- 			},
		-- 		}
		-- 	})
		-- end
	},
}

return M
