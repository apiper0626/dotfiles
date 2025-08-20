return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{
			"<leader>e",
			"<cmd>NvimTreeToggle<cr>",
			desc = "Toggle NvimTree",
		},
		{
			"<leader>r",
			"<cmd>NvimTreeRefresh<cr>",
			desc = "Refresh NvimTree",
		},
		{
			"<leader>n",
			"<cmd>NvimTreeFindFile<cr>",
			desc = "Find File in NvimTree",
		},
	},
	version = "*",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	config = function()
		require("nvim-tree").setup()
		vim.opt.termguicolors = true
	end,
}
