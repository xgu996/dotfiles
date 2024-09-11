local icons = require("user.icons")

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig",
		"folke/neoconf.nvim",
		"folke/neodev.nvim",
		-- {
		-- 	"j-hui/fidget.nvim",
		-- 	tag = "legacy",
		-- },
	},

	opts = {
		diagnostics = {
			underline = false,
			update_in_insert = false,
			virtual_text = {
				spacing = 4,
				source = "if_many",
				prefix = "●",
				-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
				-- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
				-- prefix = "icons",
			},
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
					[vim.diagnostic.severity.WARN] = icons.diagnostics.BoldWarning,
					[vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
					[vim.diagnostic.severity.INFO] = icons.diagnostics.Information,
				},
			},
		},
	},

	config = function(_, opts)
		local servers = {
			lua_ls = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
					diagnostics = {
						disable = { "missing-parameters", "missing-fields" },
					}
				},
			},
			-- pyright = {
			-- 	python = {
			-- 		analysis = {
			-- 			--autoImportCompletions = false,
			-- 			autoSearchPaths = true,
			-- 			diagnosticMode = "openFilesOnly",
			-- 			typeCheckingMode = "off", -- off, basic, strict
			-- 			useLibraryCodeForTypes = true,
			-- 		},
			-- 	},
			-- },
			pylsp = {
				pylsp = {
					configurationSources = { "pylint" },
					plugins = {
						pylint = {
							enabled = true,
							args = { "--disable=R,C", "--disable=import-error" },
						},
						flake8 = { enabled = false },
						pycodestyle = { enabled = false },
						pyflakes = { enabled = false },
					}
				}
			},
			texlab = {},
			-- ltex = {},
			-- remark_ls = {},
		}

		local on_attach = function(_, bufnr)
			-- Enable completion triggered by <c-x><c-o>
			local nmap = function(keys, func, desc)
				if desc then
					desc = 'LSP: ' .. desc
				end

				vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
			end

			nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
			nmap('gd', require "telescope.builtin".lsp_definitions, 'Goto Definition')
			nmap('<leader>k', vim.lsp.buf.hover, 'Hover Documentation')
			-- nmap('gi', require "telescope.builtin".lsp_implementations, '[G]oto [I]mplementation')
			nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
			nmap('<leader>lwa', vim.lsp.buf.add_workspace_folder, 'Workspace Add Folder')
			nmap('<leader>lwr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove Folder')
			nmap('<leader>lwl', function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, 'Workspace List Folders')
			nmap('<leader>ld', vim.lsp.buf.type_definition, 'Type Definition')
			-- nmap('<leader>rn', "<cmd>Lspsaga rename ++project<cr>", '[R]e[n]ame')
			nmap('<leader>lca', vim.lsp.buf.code_action, 'Code Action')
			nmap('<leader>lda', require "telescope.builtin".diagnostics, 'Diagnostics')
			nmap('<leader>lgr', require('telescope.builtin').lsp_references, 'Goto References')
			-- nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
			nmap("<leader>lf", function()
				vim.lsp.buf.format { async = true }
			end, "Format code")
		end
		require("neoconf").setup()
		require("neodev").setup()
		-- require("fidget").setup()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(servers),
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup {
						settings = servers[server_name],
						on_attach = on_attach,
					}
				end,
			}
		})

		-- diagnostics signs
		for severity, icon in pairs(opts.diagnostics.signs.text) do
			local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
			name = "DiagnosticSign" .. name
			vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
		end

		-- if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
		-- 	opts.diagnostics.virtual_text.prefix = "●"
		-- end

		vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
	end

}
