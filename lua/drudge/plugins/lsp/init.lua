return {
	{
		"williamboman/mason.nvim",
		opts = {}
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { 'lua_ls', 'rust_analyzer', 'gopls', 'yamlls', 'dockerls', 'python_lsp_server' },
			handlers = {
				function(server_name)
					require('lspconfig')[server_name].setup({})
				end,
				rust_analyzer = function()
					require('lspconfig').rust_analyzer.setup({
						settings = {
							["rust-analyzer"] = {
								diagnostics = { enable = true },
							},
						},
					})
				end,

				yamlls = function()
					require('lspconfig').yamlls.setup({
						settings = {
							yaml = {
								schemas = {
									kubernetes = { "*.k8s.yaml", "k8s-*.yaml", "kube-*.yaml", "deployment.yaml", "service.yaml", "secret.yaml", "ingress.yaml", "cronjob.yaml" },
									["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] =
									"conf/**/*catalog*",
									["http://json.schemastore.org/github-workflow"] =
									".github/workflows/*",
									["http://json.schemastore.org/github-action"] =
									".github/action.{yml,yaml}",
									["http://json.schemastore.org/kustomization"] =
									"kustomization.{yml,yaml}",
								},
								customTags = {
									"!Ref", "!Sub", "!GetAtt", "!Condition",
									"!FindInMap sequence",
								},
							}
						}
					})
				end,

				gopls = function()
					require('lspconfig').gopls.setup({
						settings = {
							gopls = {
								analyses = {
									unusedparams = true,
								},
								staticcheck = true,
								gofumpt = true,
							},
						},
					})
				end,

				lua_ls = function()
					require('lspconfig').lua_ls.setup({
						settings = {
							Lua = {
								runtime = {
									version = 'LuaJIT', -- Use LuaJIT for Neovim
								},
								diagnostics = {
									globals = { 'vim' }, -- Recognize the `vim` global
									enable = true,
								},
								workspace = {
									library = vim.api.nvim_get_runtime_file("", true), -- Make Neovim runtime files visible
								},
								telemetry = {
									enable = false, -- Disable telemetry
								},
							},
						},
					})
				end,
			},

		}
	},
	{ "neovim/nvim-lspconfig" }
}
