vim.cmd("source ~/dotfiles/nvim/.config/nvim/current_theme.vim")

return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    opts = { contrast = "soft" },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
