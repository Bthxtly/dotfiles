-- Define the OpenMarkdownPreview function globally
function OpenMarkdownPreview(url)
  vim.fn.execute("silent ! google-chrome-stable --new-window " .. url)
  vim.cmd("normal <CR>")
end

return {
  -- Vimwiki plugin
  {
    "vimwiki/vimwiki",
    init = function()
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
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      -- vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
    end,
    ft = { "markdown" },
  },
}
