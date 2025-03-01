return{
    {"neovim/nvim-lspconfig",
    config = function()
	local lspconfig = require"lspconfig"
	lspconfig.bashls.setup{}
	lspconfig.clangd.setup{}
	lspconfig.phpactor.setup{
	    filetypes = {"php"},
	    root_dir = lspconfig.util.root_pattern("composer.json", ".git", "*.php")
	}

	--Enable (broadcasting) snippet capability for completion
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	lspconfig.html.setup{
	    filetypes = {"html", "twig", "hbs"},
  		capabilities = capabilities,
	}

	lspconfig.cssls.setup {
		capabilities = capabilities,
	}

	lspconfig.jdtls.setup{}
	lspconfig.marksman.setup{}
	lspconfig.ts_ls.setup{}
	lspconfig.gdscript.setup{}
	lspconfig.lua_ls.setup {
	    on_init = function(client)
		local path = client.workspace_folders[1].name
		if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
		    return
		end

		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
		    runtime = {
			-- Tell the language server which version of Lua you're using
			-- (most likely LuaJIT in the case of Neovim)
			version = 'LuaJIT'
		    },
		    -- Make the server aware of Neovim runtime files
		    workspace = {
			checkThirdParty = false,
			library = {
			    vim.env.VIMRUNTIME
			    -- Depending on the usage, you might want to add additional paths here.
			    -- "${3rd}/luv/library"
			    -- "${3rd}/busted/library",
			}
			-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
			-- library = vim.api.nvim_get_runtime_file("", true)
		    }
		})
	    end,
	    settings = {
		Lua = {}
	    }
	}
    end},
    "mfussenegger/nvim-jdtls",

}
