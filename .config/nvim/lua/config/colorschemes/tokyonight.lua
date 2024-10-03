require("tokyonight").setup({
					-- leave it empty to use the default settings
					style = "moon", -- themes: `storm`, `moon`, a darker variant `night` and `day`
					transparent = true, -- Enable to disable setting the background color
					styles = {
							-- Style to be applied to different syntax groups
							-- Value is any valid attr-list value for `:help nvim_set_hl`
							comments = { italic = true },
							keywords = { italic = true },
							-- Background styles. Can be "dark", "transparent" or "normal"
							sidebars = "transparent", -- style for sidebars, see below
							floats = "transparent", -- style for floating windows
					},
			})
