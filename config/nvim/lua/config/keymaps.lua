-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--local map = LazyVim.safe_keymap_set
--map("i", "jj", "<ESC>", { desc = "Exit insert mode", remap = false })
--map({ "n", "v" }, "<C-e>", "$", { desc = "Move to end of line", remap = false })
--map({ "n", "v" }, "<C-a>", "0", { desc = "Move to start of line", remap = false })
--map("i", "<C-e>", "<C-o>$", { desc = "Move to end of line", remap = false })
--map("i", "<C-a>", "<C-o>0", { desc = "Move to start of line", remap = false })

vim.keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode", remap = false })
vim.keymap.set({ "n", "v" }, "<C-e>", "$", { desc = "Move to end of line", remap = false })
vim.keymap.set({ "n", "v" }, "<C-a>", "0", { desc = "Move to start of line", remap = false })
vim.keymap.set("i", "<C-e>", "<C-o>$", { desc = "Move to end of line", remap = false })
vim.keymap.set("i", "<C-a>", "<C-o>0", { desc = "Move to start of line", remap = false })

vim.keymap.del("n", "L")
vim.keymap.del("n", "H")

-- インサートモードでCtrl+hjklでカーソル移動
-- map("i", "<C-h>", "<Left>", { desc = "Move left in insert mode", remap = false })
-- map("i", "<C-j>", "<Down>", { desc = "Move down in insert mode", remap = false })
-- map("i", "<C-k>", "<Up>", { desc = "Move up in insert mode", remap = false })
-- map("i", "<C-l>", "<Right>", { desc = "Move right in insert mode", remap = false })
