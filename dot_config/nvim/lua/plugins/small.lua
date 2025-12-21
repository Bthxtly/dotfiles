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

  {
    "nvim-zh/colorful-winsep.nvim",
    event = { "WinLeave" },
    opts = {
      animate = { enabled = false },
    },
  },
}
