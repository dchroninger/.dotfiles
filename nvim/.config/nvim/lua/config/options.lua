local opt = vim.opt
local global = vim.g

opt.backspace = { "indent", "eol", "start" }
opt.swapfile = false
opt.backup = false
opt.isfname:append("@-@")
global.lazyvim_picker = "fzf"
