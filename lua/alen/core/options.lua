local opt = vim.opt

-- Setting vim leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Numbering system
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2

-- Expand tabs
opt.expandtab = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- Clipboard
opt.clipboard = "unnamed,unnamedplus"
-- Scrolloff and cmdheight
opt.cmdheight = 0
opt.scrolloff = 0

-- Setting completeopt
opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }

vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option_value("updatetime", 300, {})

-- Disabling netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- colors
opt.termguicolors = true
opt.background = "dark"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- scrolloff
opt.scrolloff = 999

-- enable mouse
opt.mouse = "a"

-- signcolumn
opt.signcolumn = "yes"

-- setting backspace
opt.backspace = "indent,eol,start"

opt.wrap = true

opt.cursorline = true

vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false})]])

-- swap
USER = os.getenv("USER")

SWAPDIR = "/home/" .. "/" .. USER .. "/.nvim/swap/"
BACKUPDIR = "/home/" .. "/" .. USER .. "/.nvim/backup/"
UNDODIR = "/home/" .. "/" .. USER .. "/.nvim/undo/"

if vim.fn.isdirectory(SWAPDIR) == 0 then
  vim.fn.mkdir(SWAPDIR, "p", "0o700")
end

if vim.fn.isdirectory(BACKUPDIR) == 0 then
  vim.fn.mkdir(BACKUPDIR, "p", "0o700")
end

if vim.fn.isdirectory(UNDODIR) == 0 then
  vim.fn.mkdir(UNDODIR, "p", "0o700")
end

opt.directory = SWAPDIR
opt.backupdir = BACKUPDIR
opt.undodir = UNDODIR
opt.swapfile = true
opt.backup = true
opt.undofile = true

-- Append backup files with timestamp
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local extension = "~" .. vim.fn.strftime("%Y-%m-%d-%H%M%S")
    vim.o.backupext = extension
  end,
})

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
