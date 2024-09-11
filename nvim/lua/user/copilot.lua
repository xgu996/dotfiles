local M = {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",

}

M.config = function()
	require("copilot").setup({
		filetypes={
			tex=false
		}
	})
end

return M 
