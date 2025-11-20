return {
  "chentoast/marks.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    builtin_marks = { ".", "^" },
    excluded_filetypes = { "AvanteInput", "AvantePromptInput" },
    default_mappings = false,
  },
}
