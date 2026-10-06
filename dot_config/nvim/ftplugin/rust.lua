local abbr = {
  ie = "i8",
  iah = "i16",
  isr = "i32",
  iht = "i64",

  fe = "f8",
  fah = "f16",
  fsr = "f32",
  fht = "f64",

  ue = "u8",
  uah = "u16",
  usr = "u32",
  uht = "u64",
}

for ab, type in pairs(abbr) do
  vim.cmd("iabbr " .. ab .. " " .. type)
end

vim.cmd("iabbr ;; ::")
vim.cmd("iabbr M> ->")

vim.keymap.set("n", "<leader>rr", "<cmd>RustTest<cr>")

-- select a variable and add `dbg!(&var);` below
vim.keymap.set("n", "<leader>rd", "odbg!(&);<esc>hhp")
vim.keymap.set("x", "<leader>rd", "yodbg!(&);<esc>hhp")
