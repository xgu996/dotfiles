-- dropbar
return {
	"Bekaboo/dropbar.nvim",
	event = "UIEnter",
	opt = {},
	keys = {
		{ "<leader>;", function() require("dropbar.api").pick() end,                desc = "Dropbar pick" },
		{ "[c",        function() require("dropbar.api").goto_context_start() end,  desc = "Dropbar go to context start" },
		{ "]c",        function() require("dropbar.api").select_next_context() end, desc = "Dropbar select next context" },
	},
}
