local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs and indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.background = 'dark'
opt.signcolumn = 'yes'

-- backspace
opt.backspace = 'indent,eol,start'

-- clipboard
opt.clipboard:append('unnamedplus')

-- split windows
opt.splitbelow = true
opt.splitright = true

opt.iskeyword:append('-')
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/./undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8
opt.isfname:append("@-@")

opt.updatetime = 50
