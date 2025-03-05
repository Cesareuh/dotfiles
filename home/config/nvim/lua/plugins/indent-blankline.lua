return {
    "lukas-reineke/indent-blankline.nvim",
	dependencies = {"HiPhish/rainbow-delimiters.nvim"},
    config = function ()
	local highlight = {
	    "RainbowRed",
	    "RainbowYellow",
	    "RainbowBlue",
	    "RainbowOrange",
	    "RainbowGreen",
	    "RainbowViolet",
	    "RainbowCyan",
	}

	local hooks = require "ibl.hooks"
	-- create the highlight groups in the highlight setup hook, so they are reset
	-- every time the colorscheme changes
	hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#f7768e" })
	    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#e0af68" })
	    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#7aa2f7" })
	    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#ff9e64" })
	    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#9ece6a" })
	    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#bb9af7" })
	    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#73daca" })
	end)

	local ibl = require"ibl"

	vim.g.rainbow_delimiters = { highlight = highlight }
	require("ibl").setup { scope = { highlight = highlight } }
	ibl.setup({
	    scope = { highlight = highlight},
	    indent = { highlight = highlight }
	})
	hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end

}


