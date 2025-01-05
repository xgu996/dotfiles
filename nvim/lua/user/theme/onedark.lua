return {
	-- add dracula
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- Lua
		require('onedark').setup {
			style = 'darker'
		}
		require('onedark').load()
		vim.cmd [[colorscheme onedark]]
	end
}
