
return {
  -- add dracula
		"spaceduck-theme/nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd[[colorscheme spaceduck]]
		end
}
