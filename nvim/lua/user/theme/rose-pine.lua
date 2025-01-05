return {
	'rose-pine/neovim',
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd [[colorscheme rose-pine]]
		require("rose-pine").setup({
			styles = {
				-- transparency = "true",
			},
		})
	end
}
