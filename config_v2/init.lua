-- Editor configuration
vim.o.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.relativenumber = true -- show relative line numbers

-- Package manager
vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' }, -- LSP configuration
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' }, -- Nerd Font icons
  { src = 'https://github.com/nvim-lua/plenary.nvim.git' }, -- Reusable functions used by Telescope
  { src = 'https://github.com/nvim-telescope/telescope.nvim.git' }, -- Telescope: File picker
  { src = 'https://github.com/akinsho/toggleterm.nvim.git' }, -- Floating terminal
}

-- Python configuration
vim.g.python3_host_prog = "/usr/bin/python3"
vim.lsp.enable('ty') -- Python LSP server

-- Toggle Termi setup
require("toggleterm").setup({
  open_mapping = [[<C-M-->]],   -- key to toggle the terminal
  direction = "horizontal",   -- "horizontal", "vertical", "float", or "tab"
  size = 15,
  start_in_insert = true,
  persist_mode = false,
  float_opts = { border = "curved" },
})

-- Keyboard configuration
vim.g.mapleader = " " -- Set leader key to Space
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set("n", "<leader>le", "<cmd>Lexplore<CR>", { desc = "Toggle netrw sideba:belowright split | terminalr" })
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Floating terminal" })
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<CR>", { desc = "Vertical terminal" })
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Horizontal terminal" })
vim.keymap.set("n", "<leader>tl", "<cmd>TermSelect<CR>", { desc = "List terminals" })

-- Add keymaps to move between terminal and code
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*toggleterm#*",
  callback = function()
    local opts = { buffer = 0 }
    vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  end,
})
