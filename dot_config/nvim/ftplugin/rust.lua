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

vim.cmd("iabbr M> ->")

-- ":Rust*" shortcuts
vim.keymap.set("n", "<leader>rt", "<cmd>RustTest<cr>")
vim.keymap.set("n", "<leader>rr", "<cmd>RustRun<cr>")

-- select a variable and add `dbg!(&var);` below
vim.keymap.set("n", "<leader>rd", "odbg!(&);<esc>hhp")
vim.keymap.set("x", "<leader>rd", "yodbg!(&);<esc>hhp")
