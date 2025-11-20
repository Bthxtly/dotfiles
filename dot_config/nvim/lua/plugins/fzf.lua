return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    cmd = "FzfLua",
    opts = {
      fzf_colors = { true }, -- auto-generate colorscheme

      winopts = {
        border = "single",
        fullscreen = true,

        preview = {
          border = "single",
          vertical = "down:60%",
          horizontal = "right:60%",
          delay = 100,
        },
      },

      defaults = {
        formatter = "path.dirname_first", -- italic the dirname
        prompt = "> ",
      },

      keymap = {
        fzf = {
          ["ctrl-f"] = "half-page-down",
          ["ctrl-b"] = "half-page-up",
          ["ctrl-x"] = "jump",
        },
        builtin = {
          ["<c-d>"] = "preview-page-down",
          ["<c-u>"] = "preview-page-up",
        },
      },
    },

    -- stylua: ignore
    keys = {
      -- resume
      { "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "Resume" },
      -- find
      { "<leader><space>", "<cmd>FzfLua files<cr>", desc = "Find Files (Current Dir)" },
      { "<leader>,", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Switch Buffer", },
      { "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Switch Buffer" },
      { "<leader>fc", "<cmd>lua require('fzf-lua').files({cwd = vim.fn.stdpath('config')})<cr>", desc = "Find Config File" },
      { "<leader>ff", "<cmd>FzfLua files cwd=~<cr>", desc = "Find Files (Home Dir)" },
      { "<leader>fg", "<cmd>FzfLua git_files<cr>", desc = "Find Files (git-files)" },
      { "<leader>fo", "<cmd>FzfLua zoxide<cr>", desc = "Zoxide" },
      { "<leader>fp", function() require("fzf-lua").files({ cwd = require("lazy.core.config").options.root }) end, desc = "Find Plugin File", },
      -- git
      { "<leader>gc", "<cmd>FzfLua git_commits<CR>", desc = "Commits" },
      { "<leader>gs", "<cmd>FzfLua git_status<CR>", desc = "Status" },
      -- search
      { '<leader>s"', "<cmd>FzfLua registers<cr>", desc = "Registers" },
      { "<leader>sa", "<cmd>FzfLua autocmds<cr>", desc = "Auto Commands" },
      { "<leader>sb", "<cmd>FzfLua grep_curbuf<cr>", desc = "Buffer" },
      { "<leader>:", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
      { "<leader>sc", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
      { "<leader>sC", "<cmd>FzfLua commands<cr>", desc = "Commands" },
      { "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document Diagnostics" },
      { "<leader>sD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace Diagnostics" },
      { "<leader>sg", "<cmd>FzfLua live_grep<cr>", desc = "Grep (Root Dir)" },
      { "<leader>sG", "<cmd>FzfLua live_grep<cr> cwd=~", desc = "Grep (Home Dir)" },
      { "<leader>sh", "<cmd>FzfLua help_tags<cr>", desc = "Help Pages" },
      { "<leader>sH", "<cmd>FzfLua highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>sj", "<cmd>FzfLua jumps<cr>", desc = "Jumplist" },
      { "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Key Maps" },
      { "<leader>sl", "<cmd>FzfLua loclist<cr>", desc = "Location List" },
      { "<leader>sM", "<cmd>FzfLua man_pages<cr>", desc = "Man Pages" },
      { "<leader>sm", "<cmd>FzfLua marks<cr>", desc = "Jump to Mark" },
      { "<leader>sr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent" },
      { "<leader>sR", "<cmd>FzfLua resume<cr>", desc = "Resume" },
      { "<leader>sq", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix List" },
      { "<leader>uc", "<cmd>FzfLua colorschemes<cr>", desc = "Colorscheme with Preview" },
      ---@diagnostic disable-next-line
      { "<leader>ss", function() require("fzf-lua").lsp_document_symbols({ regex_filter = symbols_filter, }) end, desc = "Goto Symbol", },
      ---@diagnostic disable-next-line
      { "<leader>sS", function() require("fzf-lua").lsp_live_workspace_symbols({ regex_filter = symbols_filter, }) end, desc = "Goto Symbol (Workspace)", },

      -- goto
      { "gd", "<cmd>FzfLua lsp_definitions     jump1=true ignore_current_line=true<cr>", desc = "Goto Definition" },
      { "gr", "<cmd>FzfLua lsp_references      jump1=true ignore_current_line=true<cr>", desc = "References" },
      { "gI", "<cmd>FzfLua lsp_implementations jump1=true ignore_current_line=true<cr>", desc = "Goto Implementation" },
      { "gy", "<cmd>FzfLua lsp_typedefs        jump1=true ignore_current_line=true<cr>", desc = "Goto T[y]pe Definition" },
    },
  },

  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
      { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoFzfLua<cr>", desc = "Todo" },
      { "<leader>sT", "<cmd>TodoFzfLua keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    },
  },
}
