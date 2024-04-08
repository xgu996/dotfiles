--neotree
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = true,
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
	},
	config = function()
		require("neo-tree").setup()
	end,
}
