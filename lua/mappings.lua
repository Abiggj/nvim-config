require "nvchad.mappings"

local map = vim.keymap.set

-- Normal mode
map("n", ";", ":", { desc = "CMD enter command mode" }) -- keep ; for command mode
map("n", ":", ";", { desc = "Repeat latest f/t/F/T" }) -- use : to repeat f/t motions
map("n", '"', ",", { desc = "Repeat latest f/t/F/T in reverse" }) -- optional reverse repeat

-- Insert mode
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map("i", "jj", "<ESC>", { desc = "Escape insert mode" })

-- Double 'l' to jump past closing bracket/quote
map("i", "ff", function()
  local col = vim.fn.col(".")
  local line = vim.fn.getline(".")
  local char = line:sub(col, col)
  local closing = { [")"] = true, ["]"] = true, ["}"] = true, ['"'] = true, ["'"] = true, [">"] = true, ["`"] = true }

  if closing[char] then
    -- Move cursor one character to the right (skip the closing character)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, false, true), "n", true)
  else
    -- If not a closing char, insert literal "l"
    vim.api.nvim_feedkeys("l", "i", true)
  end
end, { desc = "Double l to jump past closing bracket/quote" })


vim.keymap.set("n", "<leader>cp", function()
  vim.fn.setreg("+", vim.fn.system("echo $GITHUB_PERSONAL"))
  print("✅ GITHUB_PERSONAL copied to clipboard!")
end, { desc = "Copy GITHUB_PERSONAL token to clipboard" })

vim.keymap.set("n", "<leader>ct", function()
  vim.fn.setreg("+", vim.fn.system("echo $GITHUB_TOKEN"))
  print("Copied GITHUB_TOKEN to clipboard!")
end, { desc = "Copy GitHub token to clipboard" })

vim.keymap.set("n", "<leader>sb", function()
  vim.api.nvim_buf_set_lines(0, 0, 0, false, { "#!/usr/bin/bash", "" })
  print("🚀 Shebang inserted!")
end, { desc = "Insert bash shebang" })
