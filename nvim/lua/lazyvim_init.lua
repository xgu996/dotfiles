local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
	require("user.editor"),
	require("user.bufferline"),
	require("user.code"),
	require("user.comment"),
	require("user.colorizer"),
	require("user.copilot"),
	require("user.debug"),
	require("user.edge"),
	require("user.flash"),
	require("user.formatter"),
	require("user.fun"),
	require("user.indent"),
	-- require("user.lualine"),
	require("user.ghostline"),
	-- require("plugins.eviline"),
	require("user.markdown"),
	require("user.neotree"),
	require("user.noice"),
	require("user.project"),
	require("user.python"),
	require("user.tex"),
	require("user.terminal"),
	require("user.telescope"),
	require("user.ui"),
	require("user.winbar"),
	-- require("user.wrap"),
	-- require("plugins.wilder"),
	require("user.theme"),
	require("user.cmp"),
	require("user.lsp"),
	-- require("plugins.lsp.mason"),
	-- require("plugins.lsp.lspconfig"),
})
