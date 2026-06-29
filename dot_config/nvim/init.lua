require("config.autocmds")
require("config.options")

-- lazy.nvim
require("config.lazy")

require("config.keymaps")
require("config.run")

-- enable ui2
require("vim._core.ui2").enable({ enable = true })
