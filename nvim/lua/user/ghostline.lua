-- write my self lualine configuration
local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ 'nvim-tree/nvim-web-devicons', opt = true },
		{ "AndreM222/copilot-lualine" },
		{ "arkav/lualine-lsp-progress" }
	},
	event = "VeryLazy",
}

M.config = function()
	-- define colors
	local colors = {
		fg = "#ffffff",
		bg = "#2D323B",
		white = "#ffffff",
		grey = '#cccccc',
		black = "#000000",
		darkdark_purple = "#330066",
		dark_purple = "#6349A8",
		light_purple = "#BE95F8",
		light_red = "#AF0B00",
		dark_red = "#7D1E20",
		light_green = '#77ac30',
		dark_green = "#01473A",
		blue = "#0072BD",
		violet = "#D984F3",
		cyan = '#8be9fd',
		orange = '#ffb86c',
		yellow = '#f1fa8c',
	}

	local conditions = {
		buffer_not_empty = function()
			return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
		end,
		hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end,
		check_git_workspace = function()
			local filepath = vim.fn.expand('%:p:h')
			local gitdir = vim.fn.finddir('.git', filepath .. ';')
			return gitdir and #gitdir > 0 and #gitdir < #filepath
		end,
	}

	-- local filetype = {
	-- 	function()
	-- 		local filetype = vim.bo.filetype
	-- 		local upper_case_filetypes = {
	-- 			"json",
	-- 			"jsonc",
	-- 			"yaml",
	-- 			"toml",
	-- 			"css",
	-- 			"scss",
	-- 			"html",
	-- 			"xml",
	-- 			"python",
	-- 			"tex",
	-- 			"lua"
	-- 		}
	--
	-- 		if vim.tbl_contains(upper_case_filetypes, filetype) then
	-- 			return filetype:upper()
	-- 		end
	--
	-- 		return filetype
	-- 	end,
	-- }
	-- Config
	local lualine_config = {
		options = {
			-- component_separators = { left = '', right = '' },
			component_separators = "",
			-- section_separators = { left = '', right = ''  },
			section_separators = { left = '', right = '' },
			theme = {
				-- We are going to use lualine_c an lualine_x as left and
				-- right section. Both are highlighted by c theme .  So we
				-- are just setting default looks o statusline
				normal = {
					a = { fg = colors.fg, bg = colors.darkdark_purple },
					b = { fg = colors.fg, bg = colors.dark_purple, gui = 'bold' },
					c = { bg = colors.bg },
				},
				command = { b = { fg = colors.black, bg = colors.light_purple, gui = "bold" } },
				insert = { b = { fg = colors.whilte, bg = colors.dark_green, gui = "bold" } },
				visual = { b = { fg = colors.fg, bg = colors.dark_red, gui = "bold" } },
				replace = { b = { fg = colors.black, bg = colors.violet, gui = "bold" } },
			}
		},

		sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_b = { "mode" },
			lualine_y = {},
			lualine_z = {},
			-- These will be filled later
			lualine_c = {},
			lualine_x = {}
		},
		inactive_sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_v = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {},
			lualine_x = {}
		}
	}

	-- Inserts a component in lualine_c at left section
	local function ins_a(component)
		table.insert(lualine_config.sections.lualine_a, component)
	end

	local function ins_c(component)
		table.insert(lualine_config.sections.lualine_c, component)
	end

	-- Inserts a component in lualine_x ot right section
	local function ins_x(component)
		table.insert(lualine_config.sections.lualine_x, component)
	end

	local function ins_y(component)
		table.insert(lualine_config.sections.lualine_y, component)
	end

	local function ins_z(component)
		table.insert(lualine_config.sections.lualine_z, component)
	end

	ins_a {
		function()
			return '▊'
		end,
		color = { fg = colors.darkdark_purple }, -- Sets highlighting of component
		padding = { left = 0, right = 1 },     -- We don't need space before this
	}

	ins_a {
		-- mode component
		function()
			return '󰊠'
		end,
		color = function()
			-- auto change color according to neovims mode
			local mode_color = {
				n = colors.light_purple,
				i = colors.light_green,
				v = colors.light_red,
				[''] = colors.light_red,
				V = colors.light_red,
				c = colors.light_purple,
				no = colors.light_red,
				s = colors.orange,
				S = colors.orange,
				[''] = colors.orange,
				ic = colors.light_purple,
				R = colors.violet,
				Rv = colors.violet,
				cv = colors.violet,
				ce = colors.red,
				r = colors.light_purple,
				rm = colors.light_purple,
				['r?'] = colors.light_purple,
				['!'] = colors.light_purple,
				t = colors.light_purple,
			}
			return { fg = mode_color[vim.fn.mode()], bg = colors.darkdark_purple, gui = "bold" }
		end,
		padding = { right = 1 },
	}


	ins_c {
		-- filesize component
		'filesize',
		cond = conditions.buffer_not_empty,
		color = { fg = colors.light_purple, gui = 'bold' },
	}

	ins_c {
		'filename',
		cond = conditions.buffer_not_empty,
		color = { fg = colors.light_purple, gui = 'bold' },
		symbols = {
			modified = '[+]',   -- Text to show when the file is modified.
			readonly = '[-]',   -- Text to show when the file is non-modifiable or readonly.
			unnamed = '[No Name]', -- Text to show for unnamed buffers.
			newfile = '[New]',  -- Text to show for newly created file before first write
		}
	}

	ins_c {
		'diagnostics',
		sources = { 'nvim_diagnostic' },
		symbols = { error = ' ', warn = ' ', info = ' ' },
		diagnostics_color = {
			color_error = { fg = colors.dark_red },
			color_warn = { fg = colors.orange },
			color_info = { fg = colors.dark_green },
		},
	}

	ins_c {
		function()
			return '%='
		end,
	}

	ins_c {
		'lsp_progress',
		display_components = { 'lsp_client_name', { 'title', 'percentage', 'message' } },
		-- With spinner
		-- display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' }},
		colors = {
			percentage      = colors.light_green,
			title           = colors.light_green,
			message         = colors.light_green,
			spinner         = colors.light_green,
			lsp_client_name = colors.light_purple,
			use             = true,
		},
		separators = {
			component = ' ',
			progress = ' | ',
			message = { pre = '(', post = ')' },
			percentage = { pre = '', post = '%% ' },
			title = { pre = '', post = ': ' },
			lsp_client_name = { pre = '[', post = ']' },
			spinner = { pre = '', post = '' },
			message = { commenced = 'In Progress', completed = 'Completed' },
		},
		display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
		timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
		spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
	}

	-- ins_c {
	-- 	-- Lsp server name .
	-- 	function()
	-- 		local msg = 'No Active Lsp'
	-- 		local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
	-- 		local clients = vim.lsp.get_active_clients()
	-- 		if next(clients) == nil then
	-- 			return msg
	-- 		end
	-- 		for _, client in ipairs(clients) do
	-- 			local filetypes = client.config.filetypes
	-- 			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
	-- 				return client.name
	-- 			end
	-- 		end
	-- 		return msg
	-- 	end,
	-- 	icon = ' LSP:',
	-- 	color = { fg = colors.light_purple, gui = 'bold' },
	-- }

	-- Add components to right sections
	ins_x {
		'o:encoding',     -- option component same as &encoding in viml
		fmt = string.upper, -- I'm not sure why it's upper case either ;)
		cond = conditions.hide_in_width,
		color = { fg = colors.light_purple, gui = 'bold' },
	}

	ins_x {
		'fileformat',
		fmt = string.upper,
		icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
		color = { fg = colors.light_purple, gui = 'bold' },
	}

	ins_x {
		'copilot',
		-- fmt = string.upper,
		icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
		color = { fg = colors.light_purple, gui = 'bold' },
	}

	ins_x {
		'filetype',
		-- fmt = string.upper,
		icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
		color = { fg = colors.light_purple, gui = 'bold' },
	}

	ins_x {
		'branch',
		icon = '',
		color = { fg = colors.light_purple, gui = 'bold' },
	}

	ins_x {
		'diff',
		-- Is it me or the symbol for modified us really weird
		symbols = { added = "  ", modified = " ", removed = " " },
		diff_color = {
			added = { fg = colors.dark_green },
			modified = { fg = colors.orange },
			removed = { fg = colors.dark_red },
		},
		cond = conditions.hide_in_width,
	}

	ins_z {
		'location',
		color = { fg = colors.grey, bg = colors.darkdark_purple },
		padding = { left = 0, right = 1 },
	}

	ins_z {
		'progress',
		color = { fg = colors.grey, bg = colors.darkdark_purple },
		padding = { left = 0, right = 0 },
	}

	ins_z {
		function()
			local current_line = vim.fn.line "."
			local total_lines = vim.fn.line "$"
			local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██", "😈" }
			local line_ratio = current_line / total_lines
			local index = math.ceil(line_ratio * #chars)
			return chars[index]
		end,
		-- padding = { left = 0, right = 0 },
		color = { fg = colors.light_red, bg = colors.darkdark_purple },
		cond = nil,
	}

	-- ins_right {
	-- 	function()
	-- 		return '▊'
	-- 	end,
	-- 	color = { fg = colors.bg },
	-- 	padding = { left = 1 },
	-- }

	-- Don't forget to config
	require("lualine").setup(lualine_config)
end




return M
