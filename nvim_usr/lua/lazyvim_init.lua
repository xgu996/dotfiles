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
require("lazy").setup({
	require("user.blink_cmp"),
	require("user.editor"),
	require("user.bufferline"),
	require("user.code"),
	require("user.comment"),
	require("user.colorizer"),
	require("user.copilot"),
	require("user.debug"),
	require("user.edge"),
	require("user.eviline"), -- my custom statusline
	require("user.flash"),
	require("user.formatter"),
	require("user.fzf"),
	require("user.indent"),
	require("user.leetcode"),
	require("user.lsp"),
	-- require("user.lualine"),
	-- require("user.heirline"),
	require("user.markdown"),
	require("user.multicursor"),
	require("user.neotree"),
	require("user.neodev"),
	require("user.project"),
	require("user.python"),
	require("user.rainbow_pair"),
	require("user.recorder"),
	require("user.snacks"),
	require("user.tex"),
	require("user.telescope"),
	require("user.unicode"),
	require("user.theme.catppuccin"),
	-- require("user.theme.gruvbox-material"),
	-- require("user.theme.kanagawa"),
	-- require("user.theme.tokyonight"),
	-- require("user.theme.cold"),
	-- discard. These pluggins are integrated into the snacks.nvim
	require("user.terminal"),
	require("user.git"),
	-- require("user.cmp"),

	---
	require("user.ui"),
	-- require("user.winbar"),
	require("user.yazi"),
})
