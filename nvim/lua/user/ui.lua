local M = {

	-- {
	-- 	"nvim-zh/colorful-winsep.nvim",
	-- 	config = true,
	-- 	event = { "WinNew" },
	-- },

	-- {
	-- 	'nvimdev/dashboard-nvim',
	-- 	event = 'VimEnter',
	-- 	config = function()
	-- 		require('dashboard').setup {
	-- 			-- config
	-- 		}
	-- 	end,
	-- 	dependencies = { { 'nvim-tree/nvim-web-devicons' } }
	-- },

	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		opts = function()
			local logo = [[
		⣄⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
		⠈⠱⡄⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
		⣷⠒⠧⣤⡤⠤⢼⢽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
		⡇⠀⠀⠀⠈⠓⠺⢿⣿⣿⣿⠿⠿⠛⠛⠛⠛⠿⠿⢿⣿⣿⣿⡿⠿⠟⠋⠉⠀⠀
		⢻⣀⠀⠀⠀⠀⠀⣀⠒⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⢰
		⠀⢸⠓⣄⠀⢀⡾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡟
		⠀⢸⠀⣻⢓⡞⠀⢀⡤⢤⡀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣀⠀⠀⠀⢠⣴⣾⠿⠋⠀
		⠀⢸⠀⡇⡼⠀⠠⢸⣷⣾⡷⠀⠀⠀⠀⠀⠀⢰⣧⣤⣿⡆⡀⠀⠀⢹⣅⠀⠀⠀
		⠀⢸⢠⡷⠗⠒⠀⠀⠉⠋⠀⠀⣀⣀⠀⠀⠀⠀⠙⠛⠋⠀⠀⠈⠒⢦⣿⣷⣄⠀
		⠀⢰⠋⣀⣀⠀⠀⠀⠀⢀⠀⠀⠉⠉⠀⠀⠀⡀⠀⠀⠀⠀⠀⣀⣀⠀⠙⣿⣿⣷
		⠀⡇⡞⠅⠀⢹⡀⢀⣠⡞⠀⠀⠀⠀⠀⠀⠀⢇⠀⠀⠀⢰⠋⠁⠈⢳⡀⣿⣿⣿
		⠀⣇⢷⣀⣀⠼⠀⢀⡠⠟⠒⠉⢹⠉⠙⠲⢴⣋⠙⠀⠀⠸⣄⠀⢀⡼⢡⢻⡿⠙
		⠀⠘⢆⠀⠀⣤⠞⠁⠀⠀⠀⠀⡼⢇⠀⠀⠀⠈⠙⠲⣄⠀⠈⠙⢋⡵⠋⢸⣄⠀
		⠀⠀⢸⡕⠆⠂⠀⠀⠀⠀⣠⠞⠁⠘⡄⠀⠀⠀⠀⠀⠘⠆⠀⠒⠋⠀⠀⢸⠪⠄
		⠀⠀⠸⠁⠀⠀⠀⠀⣀⠴⠃⠀⠀⠀⠙⣆⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠇⠀
    ]]

			logo = string.rep("\n", 8) .. logo .. "\n\n"

			local opts = {
				hide = {
					-- this is taken care of by lualine
					-- enabling this messes up the actual laststatus setting after loading a file
					statusline = false,
				},
				config = {
					header = vim.split(logo, "\n"),
					-- stylua: ignore
					center = {
						{ action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
						{ action = "Telescope oldfiles", desc = " Recent Files", icon = " ", key = "r" },
						{ action = "Telescope live_grep", desc = " Find Text", icon = " ", key = "g" },
						{ action = [[lua LazyVim.telescope.config_files()()]], desc = " Config", icon = " ", key = "c" },
						{ action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
						{ action = "LazyExtras", desc = " Lazy Extras", icon = " ", key = "x" },
						{ action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
						{ action = "qa", desc = " Quit", icon = " ", key = "q" },
					},
					footer = function()
						local stats = require("lazy").stats()
						local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
						return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
					end,
				},
			}

			for _, button in ipairs(opts.config.center) do
				button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
				button.key_format = "  %s"
			end

			-- close Lazy and re-open when the dashboard is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "DashboardLoaded",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			return opts
		end,
	},


	-- transparent
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
				-- "c",
				-- "cpp",
				"lua",
				"vim",
				-- "python",
				-- "latex",
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
