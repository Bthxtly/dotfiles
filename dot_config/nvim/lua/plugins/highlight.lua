vim.cmd([[au BufRead,BufNewFile *.kbd set filetype=kbd]])
vim.filetype.add({ pattern = { [".*/hypr/.*%.conf"] = "hyprlang" } })

return {
  {
    "brenoprata10/nvim-highlight-colors",
    keys = {
      { "<leader>ht", '<cmd>lua require("nvim-highlight-colors").toggle()<cr>', silent = true, desc = "Toggle color" },
    },
  },
  { "ap/vim-css-color", event = "VeryLazy" },
  { "kmonad/kmonad-vim", lazy = true, ft = "kbd" },
  { "fladson/vim-kitty", lazy = true, ft = "kitty" },
}
