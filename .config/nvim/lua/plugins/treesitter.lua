return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function ()
		local configs = require('nvim-treesitter.configs')
		configs.setup({
			auto_install = true,
			ensure_installed = {
				"c",
				"css",
				"html",
				"java",
				"javascript",
				"json",
				"lua",
				"nix",
				"php",
				"python",
				"toml",
			},
			-- sync_install = false,
			highlight = {
				enable = true,
				disable = { "c" },
			},
			indent = {enable = true},
		})
	end
}
