local leet_arg = "leetcode.nvim"

return {
  "kawre/leetcode.nvim",
  -- build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
  lazy = leet_arg ~= vim.fn.argv(0, -1),
  cmd = "Leet",

  opts = {
    arg = "leetcode.nvim",

    lang = "python",

    storage = {
      -- home = "/home/bthxtly/Program/LeetCode/",
      home = vim.fn.stdpath("data") .. "/leetcode",
      cache = vim.fn.stdpath("cache") .. "/leetcode",
    },

    picker = { provider = "fzf-lua" },

    image_support = false,
  },

  dependencies = {
    "ibhagwan/fzf-lua",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
}
