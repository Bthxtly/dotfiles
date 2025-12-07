local snippet_dir = vim.fn.stdpath("config") .. "/snippets"

return {
  -- code completion
  {
    "saghen/blink.cmp",
    dependencies = {
      -- "milanglacier/minuet-ai.nvim",
      "fang2hou/blink-copilot",
    },
    -- version = "*",
    build = "cargo build --release",
    lazy = true,
    event = { "InsertEnter", "CmdlineEnter" },

    opts = {
      snippets = { preset = "luasnip" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        per_filetype = {
          lua = { inherit_defaults = true, "lazydev" },
          -- python = { inherit_defaults = true, "minuet" },
          -- c = { inherit_defaults = true, "minuet" },
          -- cpp = { inherit_defaults = true, "minuet" },
          -- rust = { inherit_defaults = true, "minuet" },
          codecompanion = { "codecompanion" },
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
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
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
        -- ["<C-a>"] = require("minuet").make_blink_map(),
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

  {
    "saghen/blink.nvim",
    build = "cargo build --release", -- for delimiters
    opts = {
      tree = { enabled = true },
    },
    keys = {
      -- tree
      { "<leader>E", "<cmd>BlinkTree toggle<cr>", desc = "Reveal current file in tree" },
      { "<leader>e", "<cmd>BlinkTree toggle-focus<cr>", desc = "Toggle file tree focus" },
    },
  },

  {
    "saghen/blink.pairs",
    build = "cargo build --release",
    --- @module 'blink.pairs'
    --- @type blink.pairs.Config
    opts = {
      mappings = {
        enabled = true,
        cmdline = true,
        disabled_filetypes = {},
        -- https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L14
        pairs = {},
      },
      highlights = {
        enabled = true,
        cmdline = true,
        groups = {
          "RainbowDelimiterCyan",
          "RainbowDelimiterOrange",
          "RainbowDelimiterBlue",
          "RainbowDelimiterYellow",
          "RainbowDelimiterViolet",
          "RainbowDelimiterGreen",
          "RainbowDelimiterRed",
        },
        unmatched_group = "BlinkPairsUnmatched",

        -- highlights matching pairs under the cursor
        matchparen = {
          enabled = true,
          -- known issue where typing won't update matchparen highlight, disabled by default
          cmdline = false,
          group = "BlinkPairsMatchParen",
        },
      },
      debug = false,
    },
  },
}
