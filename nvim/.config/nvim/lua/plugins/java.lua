return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  config = function()
    local config = {
      cmd = { "/usr/bin/jdtls" },
      root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
    }
    require("jdtls").start_or_attach(config)
  end,
}
