return {
  {
    "hedyhli/outline.nvim",
    dependencies = { "epheien/outline-treesitter-provider.nvim" },
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    -- ft = { "markdown", "vimwiki.markdown" },
    keys = {
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      keymaps = {
        unfold = { "<right>", "l" },
        fold = { "<left>", "h" },
        down_and_jump = "<C-n>",
        up_and_jump = "<C-p>",
        goto_location = { "<CR>", "m" },
        goto_and_close = { "<S-CR>", "M" },
      },
      providers = { -- providers providers providers!!!
        priority = { "lsp", "coc", "markdown", "norg", "treesitter" },
        markdown = { filetypes = { "vimwiki", "markdown" } },
      },
    },
  },
}
