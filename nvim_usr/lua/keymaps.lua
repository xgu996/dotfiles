local map = vim.keymap.set

map("n", "<Leader>h", ":set hlsearch!<CR>", { noremap = true, silent = true })

-- moving
-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

map({ "n", "v" }, "H", "5h")
map({ "n", "v" }, "J", "5j")
map({ "n", "v" }, "K", "5k")
map({ "n", "v" }, "L", "5l")
map({ "n", "v" }, "W", "5w")
map({ "n", "v" }, "B", "5b")

map("n", "<LocalLeader>j", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<LocalLeader>k", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("v", "<LocalLeader>j", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<LocalLeader>k", ":m '<-2<cr>gv=gv", { desc = "Move up" })

--windows moving
map("n", "<S-Up>", "<C-w>k")
map("n", "<S-Down>", "<C-w>j")
map("n", "<S-Left>", "<C-w>h")
map("n", "<S-Right>", "<C-w>l")

-- split
map('n', 'sr', ':set splitright<cr>:vsplit<cr>')
map('n', 'sl', ':set nosplitright<cr>:vsplit<cr>')
map('n', 'su', ':set nosplitbelow<cr>:split<cr>')
map('n', 'sb', ':set splitbelow<cr>:split<cr>')

-- buffers
map("n", "[b", "<cmd>bprevious<cr>", { desc = "prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "next buffer" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- 定义一个快捷键 <leader>p 来设置 PYTHONPATH 为 src 的上级目录
map('n', '<leader>p', ':lua SetPythonPath()<CR>', { noremap = true, silent = true })

-- 自定义 Lua 函数设置 PYTHONPATH
function SetPythonPath()
	-- 定义需要查找的标志目录和文件
	local targets = {
		dirs = { 'src' },              -- 需要查找的目录
		files = { 'pyproject.toml' }   -- 需要查找的文件
	}

	-- 遍历查找目录
	for _, dir in ipairs(targets.dirs) do
		local dir_path = vim.fn.finddir(dir, '.;')
		if dir_path ~= '' then
			-- 获取目录的上级路径
			local project_root = vim.fn.fnamemodify(dir_path, ':h')
			vim.env.PYTHONPATH = vim.fn.expand(project_root)
			print('PYTHONPATH set to ' .. vim.env.PYTHONPATH)
			return
		end
	end

	-- 遍历查找文件
	for _, file in ipairs(targets.files) do
		local file_path = vim.fn.findfile(file, '.;')
		if file_path ~= '' then
			-- 获取文件的上级路径
			local project_root = vim.fn.fnamemodify(file_path, ':h')
			vim.env.PYTHONPATH = vim.fn.expand(project_root)
			print('PYTHONPATH set to ' .. vim.env.PYTHONPATH)
			return
		end
	end

	-- 如果没有找到任何目标，打印提示信息
	print('No suitable project root found (e.g., src or pyproject.toml)')
end

map('n', '<Tab><Tab>', ":lua vim.fn.search('<++>')<CR>c4l", { noremap = true, silent = true })
