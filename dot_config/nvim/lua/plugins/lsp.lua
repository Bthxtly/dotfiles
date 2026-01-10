vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "rename" })
vim.keymap.set("n", "<leader>uh", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "toggle inlay hints" })

vim.keymap.set("n", "<leader>ci", function()
  vim.diagnostic.config({ virtual_lines = { current_line = true } })

  vim.api.nvim_create_autocmd("CursorMoved", {
    group = vim.api.nvim_create_augroup("line-diagnostics", { clear = true }),
    callback = function()
      vim.diagnostic.config({ virtual_lines = false })
      return true
    end,
  })
end, { desc = "turn on virtual lines at current line" })

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    opts = function(_, opts)
      vim.diagnostic.config({
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        -- virtual_lines = { current_line = true },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
      })
      return opts
    end,

    config = function()
      vim.lsp.inlay_hint.enable(true)

      -- make lsp highlight lower priority than treesitter
      vim.highlight.priorities.semantic_tokens = 95

      -- lua_ls
      vim.lsp.enable("lua_ls")
      vim.lsp.config("lua_ls", {
        Lua = {
          -- Inlay hints
          hint = {
            enable = true,
            setType = true,
            arrayIndex = "Disable",
          },
          codeLens = {
            enable = true,
          },
          completion = {
            callSnippet = "Replace",
            postfix = ".",
            displayContext = 50,
          },
          telemetry = {
            enable = false,
          },
        },
      })

      -- python
      vim.lsp.enable("pyright")
      vim.lsp.config("pyright", {
        cmd = { "delance-langserver", "--stdio" },
        filetypes = { "python" },
        root_markers = {
          "pyproject.toml",
          "setup.py",
          "setup.cfg",
          "requirements.txt",
          "Pipfile",
          "pyrightconfig.json",
          ".git",
        },
        single_file_support = true,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "openFilesOnly",
              inlayHints = {
                variableTypes = true,
                functionReturnTypes = true,
                callArgumentNames = true,
                pytestParameters = true,
              },
            },
          },
        },
      })

      -- c/c++
      vim.lsp.enable("clangd")

      -- typst
      vim.lsp.enable("tinymist")

      -- racket & scheme
      vim.lsp.enable("racket_langserver")
      vim.lsp.config("racket_langserver", {
        cmd = { "racket", "--lib", "racket-langserver" },
        filetypes = { "racket", "scheme" },
        root_markers = { ".git" },
      })

      -- json
      vim.lsp.enable("jsonls")
      vim.lsp.config("jsonls", {
        cmd = { "vscode-json-language-server", "--stdio" },
        filetypes = { "json", "jsonc" },
        init_options = {
          provideFormatter = false,
        },
        root_markers = { ".git" },
      })

      -- cmake
      vim.lsp.enable("cmake")

      -- hyprland
      vim.lsp.enable("hyprls")
    end,
  },
}
