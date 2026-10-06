return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-frappe") --"catppuccin-mocha", "cattppuccin-macchiato"
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
        dependencies = {
          "nvim-tree/nvim-web-devicons", -- imports icon dependency
        },
        opts = {
          theme = "tokyodark", -- sets the lualine theme to tokyodark
      }
  },
}
