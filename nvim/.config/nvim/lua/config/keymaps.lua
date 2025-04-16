-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

--=========================================================================
map("n", "<leader>l", "<cmd>Lazy<cr>", { silent = true, desc = "Toggle Lazy" })

map("n", "<C-c>", "<esc>")
map("n", "Q", "@q")
map("n", "ck", "<cmd>help digraph-table<cr>")
map("n", "<c-'>", "<c-]>", { desc = "Jump to entry" })
map("n", "<leader>ha", "<cmd>so $VIMRUNTIME/syntax/hitest.vim<cr>", { desc = "All highlight", silent = true })
map("n", "<leader>cc", "<cmd>lua CompileRunGcc()<CR>", { silent = true, desc = "Run code" })

-- better search
map("n", "<esc>", "<cmd>noh<cr>", { desc = "Disable hlsearch" })
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- I'm brilliant
map("n", "go", "m`<cmd>set paste<cr>o<esc><cmd>set nopaste<cr>``", { desc = "Add a new blank line below" })
map("n", "gO", "m`<cmd>set paste<cr>O<esc><cmd>set nopaste<cr>``", { desc = "Add a new blank line above" })

-- tab
map("n", "TN", "<cmd>tabnext<cr>", { desc = "switch to next tab" })
map("n", "TP", "<cmd>tabprevious<cr>", { desc = "switch to previous tab" })
map("n", "TT", "<cmd>tabnew<cr>", { desc = "add a new tab" })
map("n", "<leader>tt", "<cmd>tabnext<cr>", { desc = "switch to next tab" })
map("n", "<leader>tn", "<cmd>tabnext<cr>", { desc = "switch to next tab" })
map("n", "<leader>tp", "<cmd>tabprevious<cr>", { desc = "switch to previous tab" })

-- buffer
map("n", "<leader>bb", "<cmd>bn<cr>", { desc = "switch to next buffer" })
map("n", "<leader>bn", "<cmd>bn<cr>", { desc = "switch to next buffer" })
map("n", "<leader>bp", "<cmd>bp<cr>", { desc = "switch to previous buffer" })
map("n", "<leader>bd", "<cmd>bn<cr><cmd>bd #<cr>", { desc = "Delete current buffer and keep the window" })
map("n", "<leader>bl", "<cmd>ls<cr>", { desc = "list buffers" })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Add undo break-points
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")
-- Auto insert spaces after a comma
map("i", ",", ", <c-g>u")

-- System clipboard copy and paste
map("n", "Y", '"+y')
map("v", "Y", '"+y')

-- Quick quit and save
map("c", "Q", "q!<CR>") -- force to quit in cmdline
map("n", "<leader>qq", "<cmd>qall<cr>", { desc = "Quit all" })
map("n", "<leader>wa", "<cmd>wqall<cr>", { desc = "Write and quit all" })
map("n", "<C-S>", ":w<CR>", { silent = true, desc = "Write file" })
map("n", "<C-Q>", ":q<CR>", { silent = true, desc = "Quit" })
map("t", "<C-Q>", "<C-\\><C-N>:q<CR>", { silent = true })
map("t", "<C-H>", "<C-\\><C-N>")

-- Shortcuts
map("n", "<F1>", ":cd %:h<CR>", { silent = false, desc = "cd to file path" })
map("n", "<F2>", ":Maximize<CR>", { silent = true, desc = "Maximize the current window" })
map("n", "<F3>", ":lua CompileRunGcc()<CR>", { silent = true, desc = "Run code" })
map("n", "<F8>", ":UndotreeToggle<CR>", { silent = true, desc = "Undotree" })
map("n", "<F9>", "<cmd>lua Snacks.explorer.open()<CR>", { silent = true, desc = "Explorer" })
map("n", "<leader>e", "<cmd>lua Snacks.explorer.open()<CR>", { silent = true, desc = "Explorer" })

-- window
-- Disable the default s key
map("n", "s", "<nop>", { noremap = false })
map("n", "ss", "s")
-- Use f + arrow keys for moving the cursor around windows
map("n", "f<Left>", "<C-w>h")
map("n", "f<Down>", "<C-w>j")
map("n", "f<Up>", "<C-w>k")
map("n", "f<Right>", "<C-w>l")
-- Split the screens
map("n", "s<Down>", ":set splitbelow<CR>:split<CR>")
map("n", "s<Right>", ":set splitright<CR>:vsplit<CR>")
-- stylua: ignore
map("n", "s<Up>", function() vim.cmd("set nosplitbelow") vim.cmd("split") vim.cmd("set splitbelow") end)
-- stylua: ignore
map("n", "s<Left>", function() vim.cmd("set nosplitright") vim.cmd("vsplit") vim.cmd("set splitright") end)
-- Arrange screens
map("n", "sh", "<C-w>t<C-w>K")
map("n", "sv", "<C-w>t<C-w>H")
map("n", "srh", "<C-w>b<C-w>K")
map("n", "srv", "<C-w>b<C-w>H")
map("n", "sx", "<C-w><C-x>")

-- goto diagnostic
-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- ui
Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
Snacks.toggle.diagnostics():map("<leader>uD")
Snacks.toggle.line_number():map("<leader>ul")
Snacks.toggle.treesitter():map("<leader>uT")
Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
Snacks.toggle.dim():map("<leader>ud")
Snacks.toggle.animate():map("<leader>ua")
Snacks.toggle.indent():map("<leader>ui")
Snacks.toggle.scroll():map("<leader>uS")
Snacks.toggle
  .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" })
  :map("<leader>uC")
Snacks.toggle
  .option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" })
  :map("<leader>uA")
Snacks.toggle({
  name = "Git Signs",
  get = function()
    return require("gitsigns.config").config.signcolumn
  end,
  set = function(state)
    require("gitsigns").toggle_signs(state)
  end,
}):map("<leader>ug")
-- Snacks.toggle.profiler():map("<leader>dpp")
-- Snacks.toggle.profiler_highlights():map("<leader>dph")

-- Compile function
function CompileRunGcc()
  if vim.bo.filetype == "c" then
    vim.cmd("w")
    vim.cmd("set splitbelow")
    vim.cmd("!gcc % -o %< -lm")
    vim.cmd("sp")
    vim.cmd("res -5")
    vim.cmd("term time ./%<")
    vim.cmd("normal i")
  elseif vim.bo.filetype == "cpp" then
    vim.cmd("w")
    vim.cmd("set splitbelow")
    vim.cmd("sp")
    vim.cmd("res -5")
    vim.cmd("term g++ -std=gnu++17 % -Wall -o %< && time ./%<")
    vim.cmd("normal i")
  elseif vim.bo.filetype == "sh" then
    vim.cmd("w")
    vim.cmd("!time bash %")
  elseif vim.bo.filetype == "python" then
    vim.cmd("w")
    vim.cmd("set splitbelow")
    vim.cmd("sp")
    vim.cmd("res -5")
    vim.cmd("term python3 %")
    vim.cmd("normal i")
  elseif vim.bo.filetype == "rust" then
    vim.cmd("w")
    vim.cmd("set splitbelow")
    vim.cmd("sp")
    vim.cmd("res -5")
    vim.cmd("term cargo run")
  elseif vim.bo.filetype == "markdown" or vim.bo.filetype == "vimwiki" then
    -- vim.cmd("MarkdownPreviewToggle")
    vim.cmd("Markview toggle")
  elseif vim.bo.filetype == "typst" then
    vim.cmd("TypstPreview")
  elseif vim.bo.filetype == "tex" then
    vim.cmd("w")
    vim.cmd("VimtexCompile")
  end
end
