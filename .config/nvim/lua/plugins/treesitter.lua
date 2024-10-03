return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function ()
		local configs = require('nvim-treesitter.configs')
		configs.setup({
			ensure_installed = {
				"c",
				"bash",
				"lua", 
				"vim", 
				"javascript", 
				"html", 
				"css", 
				"csv", 
				"java", 
				"python", 
				"nix", 
				"json",
				"gitignore",
				"regex",
				"sql",
				"php",
				"dockerfile",
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
