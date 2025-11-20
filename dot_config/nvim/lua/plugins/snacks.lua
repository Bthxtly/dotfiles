vim.g.snacks_animate = false

local logo
if vim.g.neovide then
  logo = [[
            `7MN.   `7MF'`7MM"""YMM    .g8""8q.`7MMF'   `7MF'`7MMF'`7MMM.     ,MMF'
              MMN.    M    MM    `7  .dP'    `YM.`MA     ,V    MM    MMMb    dPMM  
              M YMb   M    MM   d    dM'      `MM VM:   ,V     MM    M YM   ,M MM  
              M  `MN. M    MMmmMM    MM        MM  MM.  M'     MM    M  Mb  M' MM  
              M   `MM.M    MM   Y  , MM.      ,MP  `MM A'      MM    M  YM.P'  MM  
              M     YMM    MM     ,M `Mb.    ,dP'   :MM;       MM    M  `YM'   MM  
            .JML.    YM  .JMMmmmmMMM   `"bmmd"'      VF      .JMML..JML. `'  .JMML.]]
else
  logo = [[
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠁⠈⣷
    ⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠔⠛⡗⠊⠁
    ⠀⠀⠀⠀⠀⠀⠀⢸⡁⠀⣸⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠴⠚⠁⠀⠀⢠⡇⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⡇⠀⠉⠑⠲⠤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠤⠒⠉⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠉⠒⠢⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣧⡤⠒⠚⠉⠉⠉⠉⠉⠉⠉⠙⠒⠦⣄⠀⠀⠀⠀⠀⠀⠀⡏⠀⠀⠀
    ⠀⠀⢀⣠⣤⣄⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⣀⣤⣤⣤⣄⡀⠀⠀⠈⠑⢦⡀⠀⠀⠀⠀⡇⠀⠀⠀
    ⠀⠀⢸⣿⣿⣿⡇⠀⠀⠀⠀⢃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠙⢦⡀⢀⣰⠇⠀⠀⠀
    ⣴⣾⣿⣿⣿⣿⡇⠀⠀⠀⠀⢸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣟⠁⣿⣿⣿⣀⣿⠃⠀⠀⠀⠀⠀⠀⠹⡉⠁⠀⠀⠀⠀
    ⢿⣿⣿⣿⣿⡿⠇⠀⢀⣤⣄⣀⠉⠉⠑⡶⠦⠀⠀⠀⠀⠀⠀⢀⣀⣀⡀⠉⠛⢿⢿⠿⠏⢁⡴⠛⠦⣀⠀⠀⠀⠀⢳⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛⠛⠛⠿⣷⣶⣧⡀⠀⠀⠀⠀⢀⠔⠉⠀⠀⠀⠉⠓⠢⠤⠤⠚⠁⠀⠀⠀⣰⠓⢆⠀⠀⢸⡀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡟⠻⢷⣄⠀⢰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣾⣿⡇⠈⢣⠀⢸⠃⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣇⠀⠀⠉⠁⡇⠀⠀⣷⠶⠶⣤⡀⠀⠀⠀⢀⡤⢄⠀⠻⣿⣿⠏⠀⢸⠀⡼⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⠀⠀⠀⢣⠀⠀⠀⣀⣀⡀⠁⠀⢀⡀⠀⠓⣉⠀⠀⠠⣾⣿⣇⡜⡴⠁⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠢⣀⠀⠈⢇⠀⢺⣿⣿⡟⠀⠀⠸⣍⢩⠟⠁⠀⠀⠀⠀⣠⣾⠟⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⣦⣌⣳⣄⡀⠀⠀⠀⠀⠀⠈⠁⠀⠀⢀⣀⡴⡞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠛⢲⣋⣀⣀⣀⡀⠈⠉⠉⠑⠒⣒⠚⠉⠉⠉⡤⢄⣀⠈⢳⠤⢤⡀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠒⠋⠀⠀⠀⠀⠹⣄⣀⢀⡤⠚⠉⠓⠦⣄⣀⣇ ⠀⠉⠙⠦⠴⠃⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡅⢈⡏⠀⠀⠀⠀⠀⠸⣅⣠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]]
end

return {
  "folke/snacks.nvim",
  lazy = false,
  opts = function(opts, _)
    -- keymaps
    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
    Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
    Snacks.toggle.diagnostics():map("<leader>uD")
    Snacks.toggle.line_number():map("<leader>ul")
    Snacks.toggle.treesitter():map("<leader>uT")
    Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
    Snacks.toggle.dim():map("<leader>ud")
    Snacks.toggle.indent():map("<leader>ui")
    Snacks.toggle
      .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" })
      :map("<leader>uC")
    Snacks.toggle
      .option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" })
      :map("<leader>ut")

    opts = {
      image = {
        enabled = true,
        doc = {
          inline = false,
          float = true,
          -- half the defaults
          max_width = 40,
          max_height = 20,
        },
        convert = { notify = false },
        math = { enabled = false },
      },

      indent = { enabled = true },

      picker = { enabled = true },

      explorer = { enabled = false },

      notifier = {
        enabled = true,
        margin = { right = 0 },
      },

      dashboard = {
        width = 60,
        row = nil, -- dashboard position. nil for center
        col = nil, -- dashboard position. nil for center
        pane_gap = 4, -- empty columns between vertical panes
        autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
        -- These settings are used by some built-in sections
        preset = {
          pick = "fzf-lua",
        -- stylua: ignore
        keys = {
          { icon = " ", key = "n", desc = "New file", action = "<cmd>enew<cr>"},
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = "<cmd>FzfLua oldfiles<cr>" },
          { icon = " ", key = "c", desc = "Config", action = "<cmd>lua require('fzf-lua').files({cwd = vim.fn.stdpath('config')})<cr>", },
          { icon = " ", key = "s", desc = "Select Session", action = "<cmd>lua require('persistence').select()<cr>", },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":q" },
        },
          -- Used by the `header` section
          header = { logo, hl = "Character" },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 0 },
          { section = "startup" },
        },
      },

      styles = {
        notification = {
          border = false,
          wo = {
            wrap = true,
          },
        },
      },
    }
    return opts
  end,
  keys = {
    { "<leader>fs", "<cmd>lua Snacks.picker()<cr>", desc = "open Snacks.picker" },
    { "<leader>sN", "<cmd>lua Snacks.notifier.show_history()<cr>", desc = "open notify history" },
  },
}
