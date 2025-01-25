print("Hello World")

require("config.lazy")

-- Kudos to TJ DeVries
-- https://www.youtube.com/watch?v=CuWfgiwI73Q
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Hard mode
for _, mode in pairs({'n', 'i'}) do
  vim.keymap.set(mode, "<Up>", "<Nop>")
  vim.keymap.set(mode, "<Down>", "<Nop>")
  vim.keymap.set(mode, "<Left>", "<Nop>")
  vim.keymap.set(mode, "<Right>", "<Nop>")
end
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
