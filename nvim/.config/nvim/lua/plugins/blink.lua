local snippet_dir = vim.fn.stdpath("config") .. "/snippets"

return {
  -- code completion
  {
    "saghen/blink.cmp",
    -- version = "*",
    build = "cargo build --release",
    lazy = true,
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      snippets = { preset = "luasnip" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          lua = { inherit_defaults = true, "lazydev" },
          python = { inherit_defaults = true, "minuet" },
          c = { inherit_defaults = true, "minuet" },
          cpp = { inherit_defaults = true, "minuet" },
        },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
          minuet = {
            name = "minuet",
            module = "minuet.blink",
            async = true,
            timeout_ms = 3000,
            score_offset = 50,
          },
        },
      },

      signature = { enabled = true },

      completion = {
        menu = {
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind" },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        -- avoid unnessary LLM request
        trigger = { prefetch_on_insert = false },
      },

      -- command line and search
      cmdline = {
        enabled = true,
        completion = {
          menu = { auto_show = true },
        },
        keymap = {
          ["<Left>"] = {},
          ["<Right>"] = {},
        },
      },

      keymap = {
        ["<C-y>"] = { "accept", "fallback" },
        ["<C-k>"] = { "fallback" }, -- disable <c-k> in insert mode
        ["<C-l>"] = require("minuet").make_blink_map(),
        ["<CR>"] = {},
        ["<Up>"] = {},
        ["<Down>"] = {},
      },
    },
    opts_extend = { "sources.default" },
  },

  -- snippet engine
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    lazy = true,
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { snippet_dir } })
    end,
  },

  -- add and edit snippets easily
  {
    "chrisgrieser/nvim-scissors",
    -- dependencies = "nvim-telescope/telescope.nvim",
    lazy = true,
    opts = {
      snippetDir = snippet_dir,
      jsonFormatter = "jq",
    },
    keys = {
      {
        "<leader>se",
        function()
          require("scissors").editSnippet()
        end,
        desc = "Edit snippet",
        mode = "n",
      },
      {
        "<leader>sn",
        function()
          require("scissors").addNewSnippet()
        end,
        desc = "Add new snippet",
        mode = { "n", "v" },
      },
    },
  },

  {
    "folke/lazydev.nvim",
    lazy = true,
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
