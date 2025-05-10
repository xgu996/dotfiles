return {
	"EdenEast/nightfox.nvim",
	lazy = false,
	config = function()
		require('nightfox').setup({
			options = {
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = "italic",
					keywords = "bold",
					functions = "italic,bold",
					variables = "NONE",
					operators = "bold",
					types = "italic,bold"
				},
				inverse = {
					match_paren = false,
					visual = false,
					search = false
				},
				dim_inactive = false,
				lualine_bold = true
			}
		})
		vim.cmd [[colorscheme nightfox]]
	end
} -- lazy
