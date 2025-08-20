return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	init = function()
		require("nvim-treesitter.install").prefer_git = false
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"css",
				"dockerfile",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"python",
				"rust",
				"typescript",
				"vim",
			},
			highlight = {
				enable = true,
			},
		})
	end,
}
