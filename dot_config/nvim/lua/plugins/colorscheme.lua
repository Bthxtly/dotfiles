vim.cmd("source ~/.config/nvim/current_theme.vim")

local rosepine = false
local gruvbox = false

-- if vim.g.neovide or vim.env.TERM_PROGRAM == "ghostty" then
if true then
  rosepine = true
else
  gruvbox = true
end

return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      local opts = {
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = false,
          emphasis = true,
          comments = true,
          operators = false,
          folds = false,
        },
        contrast = "soft",
        overrides = {
          SignColumn = { link = "LineNr" },
          dCursor = { bg = "#076678" },
          -- Markdown Header Background Overrides with Foreground Colors
          ["@markup.heading.1.markdown"] = { fg = "#cc241d", bg = "", bold = true },
          ["@markup.heading.2.markdown"] = { fg = "#98971a", bg = "", bold = true },
          ["@markup.heading.3.markdown"] = { fg = "#d79921", bg = "", bold = true },
          ["@markup.heading.4.markdown"] = { fg = "#458588", bg = "", bold = true },
          ["@markup.heading.5.markdown"] = { fg = "#b16286", bg = "", bold = true },
          ["@markup.heading.6.markdown"] = { fg = "#689d6a", bg = "", bold = true },
        },
      }
      require("gruvbox").setup(opts)

      if gruvbox then
        vim.cmd("colorscheme gruvbox")
      end
    end,
  },

  {
    "rose-pine/neovim",
    config = function()
      require("rose-pine").setup({
        variant = "auto",
        dark_variant = "moon",

        palette = {
          -- Override the builtin palette per variant
          dawn = {
            base = "#FAF0E8",
          },
        },

        highlight_groups = {
          -- Keyword = { fg = "love" },
          Type = { fg = "rose" },
          ["@type"] = { fg = "rose" },
          ["@type.builtin"] = { fg = "rose" },

          ["@function"] = { fg = "love", bold = true },
          ["@function.call"] = { fg = "iris", italic = true },

          ["@variable.builtin"] = { fg = "gold", bold = false },
          ["@variable.parameter"] = { bg = "iris", blend = 15 },
          ["@operator.rust"] = { fg = "pine" },
        },
      })

      if rosepine then
        vim.cmd("colorscheme rose-pine")
      end
    end,
  },

  { "Bthxtly/mini.base16" },
}
