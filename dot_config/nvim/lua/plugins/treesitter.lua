local language = {
  "bash",
  "c",
  "cpp",
  "json",
  "jsonc",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "rust",
  "vim",
  "vimdoc",
}

local function textobj_move(char, obj, desc)
  local move = require("nvim-treesitter-textobjects.move")
  -- stylua: ignore start
  vim.keymap.set({"n", "x", "o"}, "]"..char, function () move.goto_next_start(obj, 'textobjects') end, {desc="Next " .. desc .. " start"})
  vim.keymap.set({"n", "x", "o"}, "["..char, function () move.goto_previous_start(obj, 'textobjects') end, {desc="Previous " .. desc .. " start"})
  vim.keymap.set({"n", "x", "o"}, "]"..string.upper(char), function () move.goto_next_end(obj, 'textobjects') end, {desc="Next " .. desc .. " end"})
  vim.keymap.set({"n", "x", "o"}, "["..string.upper(char), function () move.goto_previous_end(obj, 'textobjects') end, {desc="Previous " .. desc.." end"})
  -- stylua: ignore end
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").install(language)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter.setup", {}),
        callback = function(args)
          local buf = args.buf
          local filetype = args.match

          local lang = vim.treesitter.language.get_lang(filetype) or filetype
          if not vim.treesitter.language.add(lang) then
            return
          end

          -- highlight
          vim.treesitter.start(buf, lang)

          -- fold
          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    lazy = false,
    opts = {},
    config = function()
      -- movement
      require("nvim-treesitter-textobjects").setup({ move = { set_jump = true } })
      textobj_move("c", "@class.outer", "Class")
      textobj_move("f", "@function.outer", "Function")
      textobj_move("r", "@parameter.outer", "Parameter")

      -- ;, to repeate
      local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
      vim.keymap.set({ "n", "x", "o" }, "<C-.>", ts_repeat_move.repeat_last_move)
      vim.keymap.set({ "n", "x", "o" }, "<C-,>", ts_repeat_move.repeat_last_move_opposite)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "folke/snacks.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      Snacks.toggle({
        name = "Treesitter context",
        get = function()
          return require("treesitter-context").enabled()
        end,
        set = function()
          require("treesitter-context").toggle()
        end,
      }):map("<leader>ux")
    end,
  },
}
