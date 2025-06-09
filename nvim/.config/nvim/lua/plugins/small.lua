return {
  { "tpope/vim-repeat" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-surround" },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({})
    end,
  },
  { "HiPhish/rainbow-delimiters.nvim" },
  { "declancm/maximize.nvim", lazy = true, cmd = { "Maximize" } },

  {
    "folke/ts-comments.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = { lang = { markdown = "<!-- %s -->" } },
  },

  {
    "AndrewRadev/sideways.vim",
    lazy = true,
    cmd = { "SidewaysLeft", "SidewaysRight" },
  },
}
