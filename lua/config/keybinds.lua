-- Set <space> as the leader key
vim.g.mapleader = ' '

-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')


-- Neotree keymaps
vim.keymap.set({ 'n' }, '<leader>nt', '<cmd>Neotree toggle<cr>')
vim.keymap.set({ 'n' }, '<leader>nc', '<cmd>Neotree close<cr>')

-- LSP keymaps
-- Semantic rename
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
-- Go to definition
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})


-- Format file
vim.keymap.set('n', '<leader>f', function()
  local buf = vim.api.nvim_get_current_buf()

  -- Check if any LSP client attached to this buffer supports formatting
  local has_lsp_formatter = false
  for _, client in pairs(vim.lsp.get_clients { bufnr = buf }) do
    if client:supports_method("textDocument/formatting") then
      has_lsp_formatter = true
      break
    end
  end

  if has_lsp_formatter then
    vim.lsp.buf.format { async = true }
  else
    require("conform").format { async = true }
  end
end, { desc = "Format (LSP or Conform fallback)" })


-- [[ Basic Autocommands ]].
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ Create user commands ]]
-- See `:h nvim_create_user_command()` and `:h user-commands`

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.fn.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }))
end, { desc = 'Print the git blame for the current line' })

-- [[ Add optional packages ]]
-- Nvim comes bundled with a set of packages that are not enabled by
-- default. You can enable any of them by using the `:packadd` command.

-- For example, to add the "nohlsearch" package to automatically turn off search highlighting after
-- 'updatetime' and when going to insert mode
vim.cmd('packadd! nohlsearch')
