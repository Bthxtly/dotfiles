-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- extras
vim.g.lazyvim_blink_main = true

local o = vim.opt
o.clipboard = ""
o.confirm = false -- confirm before exiting file
o.foldmethod = "indent"
vim.cmd("set foldtext=foldtext()")
o.mouse = "n"
o.spelllang = { "en", "it" }
o.encoding = "UTF-8"
o.shiftwidth = 2
o.tabstop = 2

-- Enable persistent undo
o.undofile = true
o.undolevels = 1000 -- Number of undo levels
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
