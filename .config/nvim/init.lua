-- Set line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Tab width
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Set background transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NonText", { bg = "none" })

-- Line number color
vim.api.nvim_set_hl(0, "LineNr", { fg = "#aaaaaa"})

