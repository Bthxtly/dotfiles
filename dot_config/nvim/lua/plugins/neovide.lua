if vim.g.neovide then
  -- vim.o.guifont = "ComicCodeLigatures Nerd Font:h10"
  vim.g.neovide_floating_shadow = false
  vim.keymap.set({ "n", "i" }, "<C-S-V>", '<cmd>set paste<cr><ESC>"+p<cmd>set paste!<cr>', { silent = true })
  vim.keymap.set("i", "<C-M>", "<CR>")
  vim.g.neovide_hide_mouse_when_typing = true
end

return {}
