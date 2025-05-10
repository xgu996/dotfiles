return {
  "blazkowolf/gruber-darker.nvim",
  opts = {
    bold = false,
    italic = {
      strings = false,
    },
  },
	config = function()
	 vim.cmd.colorscheme("gruber-darker")
	end
}
