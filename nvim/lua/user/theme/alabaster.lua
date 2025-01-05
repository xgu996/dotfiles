
return {
  -- 'p00f/alabaster.nvim',
  'veiledshadow/alabaster.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd [[colorscheme alabaster]]
	end
}
