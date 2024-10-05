return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function ()
		local configs = require('nvim-treesitter.configs')
		configs.setup({
			ensure_installed = {
				"bash",
				"c",
				"css", 
				"csv", 
				"dockerfile",
				"gitignore",
				"html", 
				"java", 
				"javascript", 
				"json",
				"lua", 
				"nix", 
				"php",
				"python", 
				"regex",
				"sql",
				"toml",
				"vim", 
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
