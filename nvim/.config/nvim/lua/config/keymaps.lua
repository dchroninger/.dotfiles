-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- Docked Terminal Behavior
keymap.set("n", "<leader>ft", "<cmd>ToggleTerm<cr>", {})

-- Move selection in Visual mode
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "J", ":m '<+1<CR>gv=gv")

-- Window Management
keymap.set("n", "ss", "<C-w>s")
keymap.set("n", "sv", "<C-w>v")
keymap.set("n", "sx", ":close<CR>")
keymap.set("n", "se", "<C-w>=")

-- Buffer Management
keymap.set("n", "tn", "<cmd>bnext<cr>")
keymap.set("n", "tp", "<cmd>bprevious<cr>")
keymap.set("n", "tq", "<cmd>:BufDel<cr>")

-- Neotree Preferences
keymap.set("n", "<leader>pv", "<cmd>Neotree focus<cr>")
keymap.set("n", "<leader>pt", "<cmd>Neotree<cr>")

-- LSP Helpers
keymap.set("n", "<leader>rs", ":LspRestart<cr>")
