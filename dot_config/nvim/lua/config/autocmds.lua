vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "highlight yanked text",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd({ "VimEnter", "VimResized" }, {
  desc = "Setup LSP hover window",
  callback = function()
    vim.lsp.handlers["textDocument/hover"] = { border = "rounded" }
  end,
})

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  desc = "Correct lualine highlight in Gruvbox",
  callback = function()
    vim.api.nvim_set_hl(0, "StatusLine", { link = "lualine_c_normal" })
  end,
})

-- local og_virt_text
-- local og_virt_line
-- vim.api.nvim_create_autocmd({ "CursorMoved", "DiagnosticChanged" }, {
--   desc = "disable virtual text if there is diagnostic in",
--   group = vim.api.nvim_create_augroup("diagnostic_only_virtlines", {}),
--   callback = function()
--     if og_virt_line == nil then
--       og_virt_line = vim.diagnostic.config().virtual_lines
--     end
--
--     -- ignore if virtual_lines.current_line is disabled
--     if not (og_virt_line and og_virt_line.current_line) then
--       if og_virt_text then
--         vim.diagnostic.config({ virtual_text = og_virt_text })
--         og_virt_text = nil
--       end
--       return
--     end
--
--     if og_virt_text == nil then
--       og_virt_text = vim.diagnostic.config().virtual_text
--     end
--
--     local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
--
--     if vim.tbl_isempty(vim.diagnostic.get(0, { lnum = lnum })) then
--       vim.diagnostic.config({ virtual_text = og_virt_text })
--     else
--       vim.diagnostic.config({ virtual_text = false })
--     end
--   end,
-- })
