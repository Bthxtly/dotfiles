-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

--=========================================================================
map("n", "<C-c>", "<esc>")
-- I'm brilliant
map("n", "go", "o<esc>S<esc>k", { desc = "add a new blank line below" })
map("n", "gO", "O<esc>S<esc>j", { desc = "add a new blank line above" })
--=========================================================================
-- tab
map("n", "TN", "<cmd>tabnext<cr>", { desc = "switch to next tab" })
map("n", "TP", "<cmd>tabnext<cr>", { desc = "switch to previous tab" })
map("n", "TT", "<cmd>tabnext<cr>", { desc = "add a new tab" })
--=========================================================================
-- Windows manager {{{
-- Disable the default s key
vim.keymap.set("n", "s", "<nop>")
vim.keymap.set("n", "ss", '"_xi')

-- Use f + arrow keys for moving the cursor around windows
vim.keymap.set("n", "f<Left>", "<C-w>h")
vim.keymap.set("n", "f<Down>", "<C-w>j")
vim.keymap.set("n", "f<Up>", "<C-w>k")
vim.keymap.set("n", "f<Right>", "<C-w>l")

-- Split the screens
vim.keymap.set("n", "s<Down>", ":set splitbelow<CR>:split<CR>")
vim.keymap.set("n", "s<Right>", ":set splitright<CR>:vsplit<CR>")
-- stylua: ignore
vim.keymap.set("n", "s<Up>", function() vim.cmd("set nosplitbelow") vim.cmd("split") vim.cmd("set splitbelow") end)
-- stylua: ignore
vim.keymap.set("n", "s<Left>", function() vim.cmd("set nosplitright") vim.cmd("vsplit") vim.cmd("set splitright") end)

-- -- Open terminal
-- vim.keymap.set("n", "t<Up>", "s<Up>:terminal<CR>:normal i<CR>")
-- vim.keymap.set("n", "t<Down>", "s<Down>:terminal<CR>:normal i<CR>")
-- vim.keymap.set("n", "t<Left>", "s<Left>:terminal<CR>:normal i<CR>")
-- vim.keymap.set("n", "t<Right>", "s<Right>:terminal<CR>:normal i<CR>")

-- Arrange screens
vim.keymap.set("n", "sh", "<C-w>t<C-w>K")
vim.keymap.set("n", "sv", "<C-w>t<C-w>H")
vim.keymap.set("n", "srh", "<C-w>b<C-w>K")
vim.keymap.set("n", "srv", "<C-w>b<C-w>H")
vim.keymap.set("n", "sx", "<C-w><C-x>")
--}}}
--=========================================================================
-- Other mappings {{{

-- Auto insert spaces after a comma
vim.keymap.set("i", ",", ",<space>")

-- Quick edit
-- vim.keymap.set("n", "<leader>vv", ":tabnew ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>vt", ":tabnew ~/Documents/VimWiki/index.md<CR>")

-- Toggle highlight search {{{
local hlstate = 0
vim.keymap.set("n", "<leader><CR>", function()
  if hlstate == 0 then
    vim.cmd("nohlsearch")
  else
    vim.cmd("set hlsearch")
  end
  hlstate = 1 - hlstate
end, { silent = true, desc = "toggle hlsearch" })
--}}}

-- System clipboard copy and paste
vim.keymap.set("n", "Y", '"+y')
vim.keymap.set("v", "Y", '"+y')

-- Quick quit and save
vim.keymap.set("c", "Q", "q!<CR>")
vim.keymap.set("n", "<C-S>", ":w<CR>", { silent = true })
vim.keymap.set("n", "<C-Q>", ":q<CR>", { silent = true })
vim.keymap.set("t", "<C-Q>", "<C-\\><C-N>:q<CR>", { silent = true })
vim.keymap.set("t", "<C-H>", "<C-\\><C-N>")

-- Shortcuts
vim.keymap.set("n", "<F2>", ":Maximize<CR>", { silent = true })
vim.keymap.set("n", "<F3>", ":lua CompileRunGcc()<CR>", { silent = true })
vim.keymap.set("n", "<F8>", ":UndotreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<F9>", ":Neotree toggle<CR>", { silent = true })

-- Compile function {{{
function CompileRunGcc()
  vim.cmd("w")
  if vim.bo.filetype == "c" then
    vim.cmd("set splitbelow")
    vim.cmd("!gcc % -o %< -lm")
    vim.cmd("sp")
    vim.cmd("res -5")
    vim.cmd("term time ./%<")
    vim.cmd("normal i")
  elseif vim.bo.filetype == "cpp" then
    vim.cmd("set splitbelow")
    vim.cmd("sp")
    vim.cmd("res -5")
    vim.cmd("term g++ -std=c++11 % -Wall -o %< && time ./%<")
    vim.cmd("normal i")
  elseif vim.bo.filetype == "sh" then
    vim.cmd("!time bash %")
  elseif vim.bo.filetype == "python" then
    vim.cmd("set splitbelow")
    vim.cmd("sp")
    vim.cmd("res -5")
    vim.cmd("term python3 %")
    vim.cmd("normal i")
  elseif vim.bo.filetype == "rust" then
    vim.cmd("set splitbelow")
    vim.cmd("sp")
    vim.cmd("res -5")
    vim.cmd("term cargo run")
  elseif vim.bo.filetype == "markdown" or vim.bo.filetype == "vimwiki" then
    vim.cmd("MarkdownPreview")
  elseif vim.bo.filetype == "tex" then
    vim.cmd("VimtexCompile")
  end
end --}}}
--}}}

-- vim:foldmethod=marker
