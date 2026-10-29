-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

vim.keymap.set("n", "<D-z>", "u", { desc = "Undo" })
vim.keymap.set("i", "<D-z>", "<C-o>u", { desc = "Undo" })
vim.keymap.set("x", "<D-z>", "<Esc>u", { desc = "Undo" })
vim.keymap.set("n", "<D-Z>", "<C-r>", { desc = "Redo" })
vim.keymap.set("i", "<D-Z>", "<C-o><C-r>", { desc = "Redo" })
vim.keymap.set("x", "<D-Z>", "<Esc><C-r>", { desc = "Redo" })

vim.keymap.set("n", "<D-x>", '"+dd', { desc = "Cut Line" })
vim.keymap.set("i", "<D-x>", '<C-o>"+dd', { desc = "Cut Line" })
vim.keymap.set("x", "<D-x>", '"+d', { desc = "Cut Selection" })

vim.keymap.set("n", "<D-c>", '"+yy', { desc = "Copy Line" })
vim.keymap.set("i", "<D-c>", '<C-o>"+yy', { desc = "Copy Line" })
vim.keymap.set("x", "<D-c>", '"+y', { desc = "Copy Selection" })

vim.keymap.set("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-Down>", "<Esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-Up>", "<Esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("x", "<A-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("x", "<A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

vim.keymap.set({ "n", "x" }, "<D-Right>", "$", { desc = "End of Line" })
vim.keymap.set({ "n", "x" }, "<D-Left>", "0", { desc = "Start of Line" })
vim.keymap.set("i", "<D-Right>", "<End>", { desc = "End of Line" })
vim.keymap.set("i", "<D-Left>", "<Home>", { desc = "Start of Line" })
vim.keymap.set({ "n", "x" }, "<A-Right>", "e", { desc = "End of Word" })
vim.keymap.set({ "n", "x" }, "<A-Left>", "b", { desc = "Start of Word" })
vim.keymap.set("i", "<A-Right>", "<C-o>e<Right>", { desc = "End of Word" })
vim.keymap.set("i", "<A-Left>", "<C-o>b", { desc = "Start of Word" })

vim.keymap.set({ "n", "i" }, "<A-S-Down>", "<Cmd>copy .<CR>", { desc = "Duplicate Down" })
vim.keymap.set({ "n", "i" }, "<A-S-Up>", "<Cmd>copy .-1<CR>", { desc = "Duplicate Up" })
vim.keymap.set("x", "<A-S-Down>", ":<C-u>'<,'>copy '><CR>'[V']", { desc = "Duplicate Down" })
vim.keymap.set("x", "<A-S-Up>", ":<C-u>'<,'>copy '<-1<CR>'[V']", { desc = "Duplicate Up" })

vim.keymap.set("n", "<A-BS>", "db", { desc = "Delete Previous Word" })
vim.keymap.set("i", "<A-BS>", "<C-w>", { desc = "Delete Previous Word" })
vim.keymap.set({ "n", "i" }, "<D-BS>", function()
  local cursor = vim.api.nvim_win_get_cursor(0)
  if cursor[2] > 0 then
    vim.api.nvim_buf_set_text(0, cursor[1] - 1, 0, cursor[1] - 1, cursor[2], { "" })
    vim.api.nvim_win_set_cursor(0, { cursor[1], 0 })
  end
end, { desc = "Delete to Start of Line" })
