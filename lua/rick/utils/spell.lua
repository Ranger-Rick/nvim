vim.keymap.set("n", "z=", function()
  local word = vim.fn.expand("<cword>")
  local suggestions = vim.fn.spellsuggest(word, 10) -- get up to 10 suggestions

  if #suggestions == 0 then
    vim.notify("No spelling suggestions", vim.log.levels.INFO)
    return
  end

  vim.ui.select(suggestions, { prompt = "Spelling suggestions for " .. word }, function(choice)
    if choice then
      vim.cmd("normal! ciw" .. choice) -- replace word under cursor
    end
  end)
end, { desc = "Spell suggestions via Telescope UI Select" })
