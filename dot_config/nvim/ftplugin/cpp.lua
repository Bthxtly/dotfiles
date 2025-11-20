vim.api.nvim_create_autocmd("BufEnter", {
  desc = "use <leader>cc to compile CMake project",
  callback = function()
    local function file_exists(path)
      local handle = io.open(path, "r")
      return handle and handle:close() or false
    end

    local function make()
      vim.cmd("wall")
      vim.cmd("make")
    end

    if file_exists(vim.fn.expand("%:p:h") .. "/CMakeLists.txt") then
      vim.bo.makeprg = "cmake --build build"
      vim.keymap.set("n", "<leader>cc", make, { silent = true, desc = "Run CMake project" })
    end
  end,
})
