return{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
	ensure_installed = {"bash", "lua", "java", "c", "cpp", "php", "markdown", "markdown_inline", "gdscript", "css", "html", "dart", "python", "latex"},
    }
}
