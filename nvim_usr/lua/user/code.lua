local M = {
	-- Code runner
	{
		"CRAG666/code_runner.nvim",
		lazy = true,
		keys = {
			{ "<leader>r", "<Cmd>RunCode<CR>", desc = "run code" },
		},
		config = function()
			require('code_runner').setup({
				filetype = {
					python = "python -u",
					julia = "julia"
				},
			})
		end
	},

	-- comment
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			options = {
				custom_commentstring = function()
					return vim.bo.commentstring
				end,
			},
		},
	},

	-- rename
	{
		"smjonas/inc-rename.nvim",
		opts = {},
		keys = {
			{
				"<leader>lr",
				function()
					require "inc_rename"
					return ":IncRename " .. vim.fn.expand "<cword>"
				end,
				expr = true,
				desc = "IncRename",
			},
		},
	},

	-- trouble
	{
		"folke/trouble.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- Lua
			vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end),
			vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end),
			vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end),
			vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end),
			vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end),
			vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end),

		},
	},
}

return M
