-- Line numbers
vim.opt.number = true

-- Relative line number
vim.opt.relativenumber = true

-- Cursor line
vim.opt.cursorline = true

-- Tab spacing
vim.opt.shiftwidth = 4

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Show <tab> and trailing spaces
vim.opt.list = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s) See `:help 'confirm'`
vim.opt.confirm = true


