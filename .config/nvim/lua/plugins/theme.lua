return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
     config = function()
       require('config.colorschemes.tokyonight')
     end,
  },
}
