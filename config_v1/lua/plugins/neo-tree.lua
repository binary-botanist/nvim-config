return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = true,  -- shows hidden items dimmed
            hide_dotfiles = true,
            hide_gitignored = false,
          },
          window = {
            mappings = {
              ["I"] = "toggle_gitignore",
              ["H"] = "toggle_hidden",
            },
          },
        },
      })
    end,
  }
}
