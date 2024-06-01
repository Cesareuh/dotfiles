local servers = {
    clangd = {},
    tsserver = {},
    html = {filetypes = {"html", "twig", "hbs"}},
    jdtls = {},
    marksman = {},
    lua_ls = {
	Lua = {
	    diagnostics = {
		globals = {"vim"},
	    }
	}
    }
}

return{
    {"williamboman/mason.nvim", config = true},
    {"williamboman/mason-lspconfig.nvim",
    config = function()
	local mason_lspconfig = require"mason-lspconfig"
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	mason_lspconfig.setup({
	    ensure_installed = vim.tbl_keys(servers),
	})
	mason_lspconfig.setup_handlers{function(server_name)
	    require('lspconfig')[server_name].setup{
		capabilities = capabilities,
		settings = servers[server_name],
		filtypes = (servers[server_name] or {}).filetypes,
	    }
	end
    }
end
	},
	"neovim/nvim-lspconfig",
	"mfussenegger/nvim-jdtls",

    }
