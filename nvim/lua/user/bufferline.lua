-- return {
-- 	'akinsho/bufferline.nvim',
-- 	dependencies = 'nvim-tree/nvim-web-devicons',
-- 	opts = {
-- 		options = {
-- 			mode = "tabs",
-- 			diagnostics = "nvim_lsp",
-- 			diagnostics_indicator = function(count, level, diagnostics_dict, context)
-- 				local icon = level:match("error") and " " or " "
-- 				return " " .. icon .. count
-- 			end,
-- 			indicator = {
-- 				icon = '▎', -- this should be omitted if indicator style is not 'icon'
-- 				-- style = 'icon' | 'underline' | 'none',
-- 				style = "icon",
-- 			},
-- 			show_buffer_close_icons = false,
-- 			show_close_icon = false,
-- 			enforce_regular_tabs = true,
-- 			show_duplicate_prefix = false,
-- 			tab_size = 16,
-- 			padding = 0,
-- 			separator_style = "thick",
-- 		}
-- 	}
-- }
-- -- Bufferline
return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = 'nvim-tree/nvim-web-devicons',
	keys = {
		{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
		{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
		{ "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>",          desc = "Delete other buffers" },
		{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete buffers to the right" },
		{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete buffers to the left" },
		-- { "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev buffer" },
		-- { "<S-l>",      "<cmd>BufferLineCycleNext<cr>",            desc = "Next buffer" },
		{ "[b",         "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev buffer" },
		{ "]b",         "<cmd>BufferLineCycleNext<cr>",            desc = "Next buffer" },
	},
	opts = {
		options = {
			always_show_bufferline = false,
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_, _, diag)
				local icons = require("user.icons").diagnostics
				local ret = (diag.error and icons.Error .. diag.error .. " " or "")
						.. (diag.warning and icons.Warning .. diag.warning or "")
				return vim.trim(ret)
			end,
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				}
			}
		},
	},

	config = function(_, opts)
		require("bufferline").setup(opts)
		-- Fix bufferline when restoring a session
		vim.api.nvim_create_autocmd({ "BufAdd" }, {
			callback = function()
				vim.schedule(function()
					pcall(nvim_bufferline)
				end)
			end,
		})
	end,
}
