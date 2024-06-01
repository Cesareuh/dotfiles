return{
    "hrsh7th/nvim-cmp",
    dependencies = {
	-- Snippet Engine & its associated nvim-cmp source
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',

	-- Adds LSP completion capabilities
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-path',

	-- Adds a number of user-friendly snippets
	'rafamadriz/friendly-snippets',
    },
    config = function()
	-- luasnip setup
	local luasnip = require 'luasnip'
	-- nvim-cmp setup
	local cmp = require"cmp"
	cmp.setup({
	    snippet = {
		expand = function(args)
		    require("luasnip").lsp_expand(args.body)
		end,
	    },
	    window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	    },
	    mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-Space>'] = cmp.mapping.open_docs(),
		['<CR>'] = cmp.mapping.confirm {
		    behavior = cmp.ConfirmBehavior.Insert,
		    select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
		    if cmp.visible() then
			cmp.select_next_item()
		    elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		    else
			fallback()
		    end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
		    if cmp.visible() then
			cmp.select_prev_item()
		    elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		    else
			fallback()
		    end
		end, { 'i', 's' }),
	    }),
	    sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'vsnip' }, -- For vsnip users.
		{ name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	    }, {
		{ name = 'buffer' },
	    }),
	})
    end,
}
