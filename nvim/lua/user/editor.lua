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

	{
		"echasnovski/mini.icons",
		lazy = true,
		opts = {
			file = {
				[".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
				["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
			},
			filetype = {
				dotenv = { glyph = "", hl = "MiniIconsYellow" },
			},
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},

	-- which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts_extend = { "spec" },
		opts = {
			defaults = {},
			spec = {
				{
					mode = { "n", "v" },
					{
						"<leader>b",
						group = "buffer",
						expand = function()
							return require("which-key.extras").expand.buf()
						end,
					},
					{ "<leader>d", group = "debug", },
					{ "<leader>c", group = "code" },
					{ "<leader>f", group = "file/find" },
					{ "<leader>g", group = "git" },
					{ "<leader>l", group = "lsp" },
					{ "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
					{ "[", group = "prev" },
					{ "]", group = "next" },
					{ "g", group = "goto" },
					{ "gs", group = "surround" },
				},
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			if not vim.tbl_isempty(opts.defaults) then
				wk.register(opts.defaults)
			end
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

	{
		'kevinhwang91/nvim-ufo',
		dependencies = { 'kevinhwang91/promise-async' },
		opts = {
			filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd('FileType', {
				group = vim.api.nvim_create_augroup('local_detach_ufo', { clear = true }),
				pattern = opts.filetype_exclude,
				callback = function()
					require('ufo').detach()
				end,
			})

			vim.opt.foldlevelstart = 99
			require('ufo').setup(opts)
		end,
	},

	{
		"hedyhli/outline.nvim",
		keys = { { "<leader>cs", "<cmd>Outline<cr>", desc = "Toggle Outline" } },
		cmd = "Outline",
		opts = function()
			local defaults = require("outline.config").defaults
			local opts = {
				symbols = {
					icons = {},
					-- filter = vim.deepcopy(LazyVim.config.kind_filter),
				},
				keymaps = {
					up_and_jump = "<up>",
					down_and_jump = "<down>",
				},
			}

			for kind, symbol in pairs(defaults.symbols.icons) do
				opts.symbols.icons[kind] = {
					-- icon = LazyVim.config.icons.kinds[kind] or symbol.icon,
					hl = symbol.hl,
				}
			end
			return opts
		end,
	}

	-- viaual-multi
	-- {
	-- 	"mg979/vim-visual-multi",
	-- }

}

return M
