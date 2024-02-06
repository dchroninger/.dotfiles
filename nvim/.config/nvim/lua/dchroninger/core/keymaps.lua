vim.g.mapleader = " "

local keymap = vim.keymap

-- General Keymaps
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x')
keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Increment and Decrement highlighted number
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- Split Windows
-- -- Split window
keymap.set('n', 'ss', '<C-w>s') -- horizontal
keymap.set('n', 'sv', '<C-w>v') -- vertical
keymap.set('n', 'se', '<C-w>=') -- equalize windows
keymap.set('n', 'sx', ':close<CR>') -- close window
-- -- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')
keymap.set('', 'sm', ':MaximizerToggle<CR>')

-- Tab Management
keymap.set('n', 'tn', '<Cmd>bnext<CR>')
keymap.set('n', 'tp', '<Cmd>bprevious<CR>')
keymap.set('n', '<leader>q', '<Cmd>:BufDel<CR>')
keymap.set('n', '<leader>Q', '<Cmd>:BufDel!<CR>')

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("n", "J", "mzJ`z")

-- Moving around
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("x", "<leader>p", [["_dP]]) -- paste over selection
keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- copy to system clipboard
keymap.set("n", "<leader>Y", [["+Y]])


keymap.set("n", "Q", "<nop>") -- disable ex mode
keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Errors?
keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- search and replace word under cursor
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)


-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>pv", ":NvimTreeFocus<CR>") -- Open if closed, then focus the file explorer
keymap.set("n", "<leader>pt", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>pc", ":NvimTreeCollapse<CR>") -- collapse file explorer recursively

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
