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
vim.api.nvim_set_keymap('n', '<leader><leader>p', ':lua SetPythonPath()<CR>', { noremap = true, silent = true })

-- Lua 函数来设置 PYTHONPATH
function SetPythonPath()
	-- 查找 src 目录
	local src_dir = vim.fn.finddir('src', '.;')

	if src_dir ~= '' then
		-- 获取 src 的上级目录
		local project_root = vim.fn.fnamemodify(src_dir, ':h')

		-- 设置 PYTHONPATH 环境变量为项目根目录
		vim.env.PYTHONPATH = vim.fn.expand(project_root)
		print('PYTHONPATH set to ' .. vim.env.PYTHONPATH)
	else
		print('src directory not found!')
	end
end
