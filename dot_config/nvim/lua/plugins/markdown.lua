vim.cmd([[
function! OpenMarkdownPreview (url)
    silent execute "!zen --new-window " . a:url
    normal <CR>
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]])

return {
  -- Vimwiki plugin
  {
    "vimwiki/vimwiki",
    lazy = true,
    ft = { "markdown", "vimwiki" },
    keys = { "<leader>ww", "<leader>wt" },
    init = function()
      vim.treesitter.language.register("markdown", { "vimwiki" })
      -- vim.g.vimwiki_filetypes = { "markdown" }
      vim.g.vimwiki_global_ext = 0
      vim.g.vimwiki_list = {
        {
          path = "~/Documents/VimWiki",
          syntax = "markdown",
          ext = ".md",
        },
      }
    end,
  },

  -- Markdown Preview plugin
  {
    "OXY2DEV/markview.nvim",
    enabled = false,
    ft = { "markdown", "vimwiki", "codecompanion" },
    opts = {
      preview = {
        filetypes = { "markdown", "vimwiki", "codecompanion" },
        map_gx = false,
      },
      markdown = {
        headings = { shift_width = 0 },
        list_items = { shift_width = 2 },
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    ft = { "markdown", "vimwiki" },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown", "vimwiki" }
    end,
  },
}
