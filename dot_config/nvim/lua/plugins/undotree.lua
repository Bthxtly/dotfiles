return {
  "mbbill/undotree",
  lazy = true,
  keys = {
    {
      "<leader>su",
      "<cmd>UndotreeToggle<cr>",
      mode = "n",
      desc = "Undotree",
    },
  },
  init = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.cmd([[
      function g:Undotree_CustomMap()
          nmap <buffer> Y <plug>UndotreeNextState
          nmap <buffer> E <plug>UndotreePreviousState
      endfunc
    ]])
  end,
}
