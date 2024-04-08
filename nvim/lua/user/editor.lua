local M = {
	--------
	-- Editor
	--------
	-- surround
	{
		"echasnovski/mini.surround",
		event = "InsertEnter",
		opts = {
			mappings = {
				add = "gsa",
				delete = "gsd",
				find = "gsf",
				find_left = "gsF",
				highlight = "gsh",
				replace = "gsr",
				update_n_lines = "gsn",
			},
		},
	},

	-- which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,

		opts = {
			plugins = { spelling = true },
			defaults = {
				mode = { "n", "v" },
				["g"] = { name = "+goto" },
				--["gs"] = { name = "+surround" },
				["]"] = { name = "+next" },
				["["] = { name = "+prev" },
				--["<leader><tab>"] = { name = "+tabs" },
				["<leader>b"] = { name = "+buffer" },
				["<leader>c"] = { name = "+code" },
				["<leader>f"] = { name = "+file/find" },
				["<leader>g"] = { name = "+git" },
				["<leader>l"] = { name = "+lsp" },
				--["<leader>gh"] = { name = "+hunks" },
				--["<leader>q"] = { name = "+quit/session" },
				--["<leader>s"] = { name = "+search" },
				--["<leader>u"] = { name = "+ui" },
				--["<leader>w"] = { name = "+windows" },
				["<leader>x"] = { name = "+diagnostics/quickfix" },
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register(opts.defaults)
		end,
	},
	-- autopairs
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
	},

	-- split VeryLongWords for easier w nav
	{
		'chaoren/vim-wordmotion',
		event = "InsertEnter"
	},

	-- last place
	{
		"ethanholz/nvim-lastplace",
		config = true,
	},


}

return M
