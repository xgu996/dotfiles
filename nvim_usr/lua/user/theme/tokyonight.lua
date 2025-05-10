return {

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({

				style = "storm",
				transparent = false,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					keywords = { bold = true, italic = true },
					sidebars = "transparent",
					floats = "transparent",
				},
				plugins = {
					all = true,
				},
				on_colors = function(colors)
					-- colors.border = "#565f89"
					colors.border = "#FFA066"
				end,
				on_highlights = function(highlights, colors)
					highlights.LspInlayHint = {
						bg = colors.none,
						fg = colors.dark3,
					}
					highlights.Statement = { fg = colors.magenta, italic = true, bold = true }
					highlights.Type = { fg = colors.blue1, bold = true }
					highlights["@tag.attribute.tsx"] = { italic = true, fg = colors.green2 }
					highlights["@keyword.import.tsx"] = { bold = true, italic = true, fg = colors.red1 }
					highlights["@keyword.import.typescript"] = { bold = true, italic = true, fg = colors.red1 }
					highlights["@keyword.export.tsx"] = { bold = true, italic = true, fg = colors.red1 }
					highlights["@keyword.export.typescript"] = { bold = true, italic = true, fg = colors.red1 }
					highlights["@keyword.import.rust"] = { bold = true, fg = colors.red }
					highlights["@lsp.type.rust"] = { italic = true, fg = colors.red1 }
					highlights["@lsp.type.namespace.rust"] = { fg = colors.red1 }

					highlights.RainbowDelimiterRed = { fg = "#FF5D62" }
					highlights.RainbowDelimiterYellow = { fg = "#E6C384" }
					highlights.RainbowDelimiterBlue = { fg = "#7FB4CA" }
					highlights.RainbowDelimiterOrange = { fg = "#FFA066" }
					highlights.RainbowDelimiterGreen = { fg = "#98BB6C" }
					highlights.RainbowDelimiterViolet = { fg = "#D27E99" }
					highlights.RainbowDelimiterCyan = { fg = "#7AA89F" }
				end,

			})
			vim.cmd[[colorscheme tokyonight]]
			-- vim.cmd.colorscheme("tokyonight-night")
		end,
	},

}
