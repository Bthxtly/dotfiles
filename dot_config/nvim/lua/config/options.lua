local o = vim.opt

-- fold
vim.wo.foldmethod = "syntax"
o.foldlevel = 99
o.fillchars = {
  fold = "·",
  foldopen = "",
  foldclose = "",
  foldsep = " ",
  diff = "╱",
  eob = "~",
}

-- indent
o.shiftwidth = 2
o.tabstop = 2
o.expandtab = true
o.shiftround = true
o.smartindent = true

-- case
o.ignorecase = true
o.smartcase = true

-- list
o.list = true

-- session
o.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

-- number
o.number = true
o.relativenumber = true

-- grep
o.grepprg = "rg --vimgrep"
o.grepformat = "%f:%l:%c:%m"

-- others
o.scrolloff = 5
o.mouse = "nv"
o.spelllang = { "en", "it" }
o.encoding = "UTF-8"
o.cursorline = true
o.laststatus = 3
o.conceallevel = 2
o.lazyredraw = true
o.termguicolors = true
o.updatetime = 200
o.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
o.wrap = false
o.formatexpr = "v:lua.require'conform'.formatexpr()"
o.signcolumn = "yes"
vim.o.exrc = true

-- Enable persistent undo
o.undofile = true
o.undolevels = 10000 -- Number of undo levels
o.undoreload = 10000 -- Number of lines to save for undo

-- Enable backups and swap files
o.backup = true
o.swapfile = true

-- Set directories for undo, backup, and swap files
local config_path = vim.fn.expand("$HOME/.local/state/nvim")
o.undodir = config_path .. "/undo"
o.backupdir = config_path .. "/backup"
o.directory = config_path .. "/swap"

-- Create directories if they don't exist
local function ensure_dir(path)
  if vim.fn.isdirectory(path) == 0 then
    vim.fn.mkdir(path, "p")
  end
end

ensure_dir(vim.o.undodir)
ensure_dir(vim.o.backupdir)
ensure_dir(vim.o.directory)
