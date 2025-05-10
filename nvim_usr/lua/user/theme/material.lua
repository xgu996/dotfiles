M = {
	"ray-x/starry.nvim",
	lazy = false,
	config = function()
		require("starry").setup()
		vim.cmd "colorscheme starry"
	end
}

return M
