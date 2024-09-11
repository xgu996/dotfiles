return {
	{
		"lervag/vimtex",
		lazy = false,

		init = function()
			vim.g.vimtex_view_method = "skim"
			vim.g.vimtex_view_skim_sync = 1
			vim.g.vimtex_view_skim_activate = 1
			vim.g.vimtex_quickfix_enabled = 1 -- don't show quik fix for default
			vim.g.vimtex_quickfix_mode = 0 -- don't show quik fix for default
			-- vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
			-- add which-key mapping descriptions for VimTex
			vim.api.nvim_create_autocmd("FileType", {
				desc = "Set up VimTex Which-Key descriptions",
				group = vim.api.nvim_create_augroup("vimtex_mapping_descriptions", { clear = true }),
				pattern = "tex",
				callback = function(event)
					local wk = require("which-key")
					local opts = {
						mode = "n",   -- NORMAL mode
						buffer = event.buf, -- Specify a buffer number for buffer local mappings to show only in tex buffers
					}

					-- local mappings = {
					-- 	{ "", buffer = 1, desc = "tsD" },
					-- 	{ "", buffer = 1, desc = "]*" },
					-- 	{ "", buffer = 1, desc = "[r" },
					-- 	{ "", buffer = 1, desc = "]/" },
					-- 	{ "", buffer = 1, desc = "]N" },
					-- 	{ "", buffer = 1, desc = "]M" },
					-- 	{ "", buffer = 1, desc = "]R" },
					-- 	{ "", buffer = 1, desc = "[n" },
					-- 	{ "", buffer = 1, desc = "[]" },
					-- 	{ "", buffer = 1, desc = "[N" },
					-- 	{ "", buffer = 1, desc = "[m" },
					-- 	{ "", buffer = 1, desc = "[R" },
					-- 	{ "", buffer = 1, desc = "[[" },
					-- 	{ "", buffer = 1, desc = "[M" },
					-- 	{ "", buffer = 1, desc = "][" },
					-- 	{ "", buffer = 1, desc = "]m" },
					-- 	{ "", buffer = 1, desc = "dsc" },
					-- 	{ "", buffer = 1, desc = "ds$" },
					-- 	{ "", buffer = 1, desc = "dsd" },
					-- 	{ "", buffer = 1, desc = "dse" },
					-- 	{ "", buffer = 1, desc = "]]" },
					-- 	{ "", buffer = 1, desc = "cse" },
					-- 	{ "", buffer = 1, desc = "csc" },
					-- 	{ "", buffer = 1, desc = "]n" },
					-- 	{ "", buffer = 1, desc = "csd" },
					-- 	{ "", buffer = 1, desc = "]r" },
					-- 	{ "", buffer = 1, desc = "cs$" },
					-- 	{ "", buffer = 1, group = "VimTeX Toggles & Cycles" },
					-- 	{ "", buffer = 1, desc = "[/" },
					-- 	{ "", buffer = 1, desc = "<localleader>lx" },
					-- 	{ "", buffer = 1, desc = "<localleader>lI" },
					-- 	{ "", buffer = 1, desc = "<localleader>lG" },
					-- 	{ "", buffer = 1, desc = "<localleader>lK" },
					-- 	{ "", buffer = 1, desc = "<localleader>lT" },
					-- 	{ "", buffer = 1, desc = "<localleader>lL" },
					-- 	{ "", buffer = 1, desc = "<localleader>lX" },
					-- 	{ "", buffer = 1, desc = "<localleader>lC" },
					-- 	{ "", buffer = 1, desc = "tsf" },
					-- 	{ "", buffer = 1, desc = "tsc" },
					-- 	{ "", buffer = 1, group = "VimTeX" },
					-- 	{ "", buffer = 1, desc = "tsd" },
					-- 	{ "", buffer = 1, desc = "tse" },
					-- 	{ "", buffer = 1, desc = "[*" },
					-- 	{ "", buffer = 1, desc = "<localleader>la" },
					-- 	{ "", buffer = 1, desc = "<localleader>le" },
					-- 	{ "", buffer = 1, desc = "<localleader>ls" },
					-- 	{ "", buffer = 1, desc = "<localleader>lq" },
					-- 	{ "", buffer = 1, desc = "<localleader>lt" },
					-- 	{ "", buffer = 1, desc = "<localleader>lv" },
					-- 	{ "", buffer = 1, desc = "<localleader>lc" },
					-- 	{ "", buffer = 1, desc = "<localleader>lo" },
					-- 	{ "", buffer = 1, desc = "<localleader>ll" },
					-- 	{ "", buffer = 1, desc = "<localleader>lg" },
					-- 	{ "", buffer = 1, desc = "<localleader>lm" },
					-- 	{ "", buffer = 1, desc = "<localleader>li" },
					-- 	{ "", buffer = 1, desc = "<localleader>lk" },
					-- 	{ "", buffer = 1, desc = "ts$" },
					-- }
					--
					-- wk.register(mappings, opts)
					-- -- VimTeX Text Objects without variants with targets.vim
					-- opts = {
					-- 	mode = "o", -- Operator pending mode
					-- 	buffer = event.buf,
					-- }

					-- local objects = {
					-- 	["ic"] = [[LaTeX Command]],
					-- 	["ac"] = [[LaTeX Command]],
					-- 	["id"] = [[LaTeX Math Delimiter]],
					-- 	["ad"] = [[LaTeX Math Delimiter]],
					-- 	["ie"] = [[LaTeX Environment]],
					-- 	["ae"] = [[LaTeX Environment]],
					-- 	["i$"] = [[LaTeX Math Zone]],
					-- 	["a$"] = [[LaTeX Math Zone]],
					-- 	["iP"] = [[LaTeX Section, Paragraph, ...]],
					-- 	["aP"] = [[LaTeX Section, Paragraph, ...]],
					-- 	["im"] = [[LaTeX Item]],
					-- 	["am"] = [[LaTeX Item]],
					-- }
					-- wk.register(objects, opts)
				end,
			})
		end,
	},
}

--M.config = function ()
--	-- cmp
--	require('cmp').setup({
--		sources = {
--			{ name = 'vimtex', },
--		},
--	})
--
--	require('cmp_vimtex').setup({
--		additional_information = {
--			info_in_menu = true,
--			info_in_window = true,
--			info_max_length = 60,
--			match_against_info = true,
--			symbols_in_menu = true,
--		},
--		bibtex_parser = {
--			enabled = true,
--		},
--	})
--end
