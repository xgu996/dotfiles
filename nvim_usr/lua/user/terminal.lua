-- terminal
return {
	'akinsho/toggleterm.nvim',
	event = "InsertEnter",
	version = "*",
	opts = {
		start_in_insert = false,
	},
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-\>]],
		})
	end
}
