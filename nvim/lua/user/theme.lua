return {

	-- "techtuner/aura-neovim",
	-- lazy = false,
	-- name = "aura",
	-- priority = 1000,
	-- config = function()
	-- 	vim.cmd([[
	-- 		set termguicolors
	-- 		colorscheme aura
	-- 	]])
	-- end

	'veiledshadow/nvim-deus',
	lazy = false,
	name = "deus",
	--priority = 1000,
	config = function()
		vim.cmd([[
			set termguicolors
			colorscheme deus
		]])
	end

	-- "lunarvim/darkplus.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	vim.cmd.colorscheme("darkplus")
	-- end

	-- "LunarVim/primer.nvim",
	-- lazy = false,  -- make sure we load this during startup if it is your main colorscheme
	-- priority = 1000, -- make sure to load this before all the other start plugins
	-- config = function ()
	-- 	vim.cmd.colorscheme("primer_dark")
	-- end

	-- 'veiledshadow/alabaster.nvim',
	-- lazy = false,
	-- name = "alabaster",
	-- priority = 1000,
	-- config = function()
	-- 	vim.cmd([[colorscheme alabaster]])
	-- 	vim.cmd([[hi ColorColumn guibg=#660000]])
	-- end,

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

	-- 'veiledshadow/nvim-deus',
	-- lazy = false,
	-- name = "deus",
	-- --priority = 1000,
	-- config = function()
	-- 	vim.cmd([[
	-- 	set termguicolors
	-- 	colorscheme deus
	-- ]])
	-- 	-- vim.cmd([[hi ColorColumn guibg=#660000]])
	-- end

	-- "tiagovla/tokyodark.nvim",
	-- opts = {
	-- 	-- custom options here
	-- },
	-- config = function(_, opts)
	-- 	require("tokyodark").setup(opts)   -- calling setup is optional
	-- 	vim.cmd [[colorscheme tokyodark]]
	-- end,
	--
	-- "folke/tokyonight.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- opts = {},
	-- config = function()
	-- 	vim.cmd[[colorscheme tokyonight-night]]
	-- end

	-- "craftzdog/solarized-osaka.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- opts = {},
	-- config = function()
	-- 	vim.cmd [[colorscheme solarized-osaka]]
	-- end

	-- "EdenEast/nightfox.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- opts = {},
	-- config = function()
	-- 	vim.cmd[[colorscheme nightfox]]
	-- end

	-- "catppuccin/nvim",
	-- lazy = false,
	-- priority = 1000,
	-- opts = {},
	-- config = function()
	-- 	vim.cmd [[colorscheme catppuccin]]
	-- end

	-- 'Mofiqul/dracula.nvim',
	-- lazy = false,
	-- priority = 1000,
	-- opts = {},
	-- config = function()
	-- 	vim.cmd [[colorscheme dracula]]
	-- end

	-- 'shaunsingh/nord.nvim',
	-- lazy = false,
	-- priority = 1000,
	-- opts = {},
	-- config = function()
	-- 	vim.cmd [[colorscheme nord]]
	-- end
}
