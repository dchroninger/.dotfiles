local map = vim.keymap.set
local unmap = vim.keymap.del

-- Restart LSP Server
map("n", "<leader>rs", ":LspRestart<cr>")

unmap("n", "<leader>bb")
unmap("n", "<leader>E")
unmap("n", "<leader>K")
unmap("n", "<leader>S")
unmap("n", "<leader>,")
unmap("n", "<leader>`")
unmap("n", "<leader>bD")
unmap("n", "<leader>uA")
unmap("n", "<leader><tab><tab>")
unmap("n", "<leader><tab>]")
unmap("n", "<leader><tab>[")
unmap("n", "<leader><tab>d")
unmap("n", "<leader><tab>f")
unmap("n", "<leader><tab>l")
unmap("n", "<leader><tab>o")

-- Hide maps from which-key
local wk = require("which-key")
wk.add({ "<leader>rs", hidden = true })
wk.add({ "<leader>L", hidden = true })
wk.add({ "<leader>uI", hidden = true })
wk.add({ "<leader>ui", hidden = true })
wk.add({ "<leader>ul", hidden = true })
wk.add({ "<leader>uL", hidden = true })
wk.add({ "<leader>uT", hidden = true })
wk.add({ "<leader>uh", hidden = true })
wk.add({ "<leader>uf", hidden = true })
wk.add({ "<leader>uC", hidden = true })
wk.add({ "<leader>ua", hidden = true })
wk.add({ "<leader>uA", hidden = true })
wk.add({ "<leader>ug", hidden = true })
wk.add({ "<leader>uG", hidden = true })
wk.add({ "<leader>us", hidden = true })
wk.add({ "<leader>uS", hidden = true })
