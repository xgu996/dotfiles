local M = {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",

}

M.config = function()
	require("copilot").setup({})
end

return M 
