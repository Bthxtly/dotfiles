return {
  "RRethy/vim-illuminate",
  dependencies = { "folke/snacks.nvim" },
  ft = { "python", "scheme", "lua", "java", "c", "cpp", "rust" },
  config = function(_, opts)
    Snacks.toggle({
      name = "Illuminate",
      get = function()
        return not require("illuminate.engine").is_paused()
      end,
      set = function(enabled)
        local m = require("illuminate")
        if enabled then
          m.resume()
        else
          m.pause()
        end
      end,
    }):map("<leader>uu")

    local function map(key, dir, buffer)
      vim.keymap.set("n", key, function()
        require("illuminate")["goto_" .. dir .. "_reference"](false)
      end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
    end

    map("]]", "next")
    map("[[", "prev")

    -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        local buffer = vim.api.nvim_get_current_buf()
        map("]]", "next", buffer)
        map("[[", "prev", buffer)
      end,
    })
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    }
    require("illuminate").configure(opts)
  end,
  keys = {
    { "]]", desc = "Next Reference" },
    { "[[", desc = "Prev Reference" },
  },
}
