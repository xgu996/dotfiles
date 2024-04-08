-- telescope
return {
	'nvim-telescope/telescope.nvim',
	cmd = "Telescope",
	lazy = true,
	version = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
		"gbrlsnchs/telescope-lsp-handlers.nvim",
	},
	keys = {
		{ "<leader>ff", "<Cmd>Telescope find_files<CR>",      desc = "Find files" },
		{ "<leader>fg", "<Cmd>Telescope live_grep<CR>",       desc = "Grep" },
		{ "<leader>fb", "<Cmd>Telescope buffers<CR>",         desc = "Buffers" },
		{ "<leader>fh", "<Cmd>Telescope help_tags<CR>",       desc = "Help tags" },
		{ "<leader>fr", "<Cmd>Telescope oldfiles<CR>",        desc = "Recent" },
		{ "<leader>:",  "<cmd>Telescope command_history<cr>", desc = "Command History" },
		{ "<leader>sr", "<cmd>Telescope registers<cr>",       desc = "Registers" },
	},
	-- config = function()
	-- 	require("telescope").setup {
	-- 		pickers = {
	-- 			buffers = {
	-- 				sort_lastused = true,
	-- 				theme = "ivy",
	-- 				previewer = false,
	-- 			},
	-- 			find_files = {
	-- 				theme = "ivy"
	-- 			},
	-- 			live_grep = {
	-- 				theme = "ivy"
	-- 			}
	-- 		},
	-- 	}
	-- end
}
