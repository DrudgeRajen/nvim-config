return {
	{
		"williamboman/mason.nvim",
		opts = {}
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { 'lua_ls', 'rust_analyzer' },
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