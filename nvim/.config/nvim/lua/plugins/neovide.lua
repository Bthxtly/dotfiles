if vim.g.neovide then
  vim.o.guifont = "ComicShannsMono Nerd Font:h13" -- text below applies for VimScript
  vim.keymap.set("n", "<C-S-V>", '"+p', { silent = true })
end
return {}
