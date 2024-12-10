-- change some telescope options and a keymap to browse plugin files
return {
  "nvim-telescope/telescope.nvim",
  keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
      -- stylua: ignore
      {
        "<leader>fs",
        function() require("telescope.builtin").live_grep() end,
        desc = "Find String (grep)",
      },
      -- stylua: ignore
      {
        "<leader>fh",
        function() require("telescope.builtin").help_tags() end,
        desc = "Find Help Tags",
      },
  },
  -- change some options
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
    },
  },
}
