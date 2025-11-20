return {
  "Bthxtly/nvim-origami",
  event = "BufReadPre",
  config = function()
    require("origami").setup({
      foldtext = {
        padding = 2,
        lineCount = {
          template = "󰘖  %d lines ",
        },
      },
    })

    -- stylua: ignore
    vim.keymap.set("n", "<Left>", function() require("origami").h() end)
    -- stylua: ignore
    vim.keymap.set("n", "<Right>", function() require("origami").l() end)
  end,
}
