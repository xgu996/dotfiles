return {
	"lukas-reineke/indent-blankline.nvim",
	dependencies = {
		"TheGLander/indent-rainbowline.nvim",
	},
	config = function()
		-- 使用标准终端配色
		local terminal_colors = {
			0xf38ba8, -- Red
			0xa6e3a1, -- Green
			0x89b4fa, -- Blue
			0xf9e2af, -- Yellow
			0xf5c2e7, -- Magenta
			0x94e2d5, -- Cyan
			0xbac2de, -- White
			0x585b70, -- Gray (for additional contrast)
		}

		opts = {
			-- 检查文件类型并禁用插件
			exclude = { filetypes = { "dashboard" } }
		}

		-- 配置 indent-blankline 和 indent-rainbowline
		require("ibl").setup(require("indent-rainbowline").make_opts(opts, {
			color_transparency = 0.15, -- 可根据需要调整透明度
			colors = terminal_colors,
		}))
	end
}
