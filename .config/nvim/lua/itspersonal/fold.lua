vim.wo.foldtext = "v:lua.foldText()"

vim.wo.foldmethod = "syntax"
vim.wo.foldlevel = 0
vim.wo.foldnestmax = 4

-- zj moves the cursor to the next fold.
-- zk moves the cursor to the previous fold.
-- za toggle a fold at the cursor.
-- zM closes all open folds.
-- zR opens all close folds.

function foldText()
  -- current text
  local text = string.gsub(vim.fn.getline(vim.v.foldstart), "\t", "» ") --vim.fn.getline(vim.v.foldstart)

  -- total line msg
  local totalline = vim.v.foldend - vim.v.foldstart + 1
  local info = " :: " .. totalline .. "  "

  -- empty padding
  local numlen = vim.fn.line("$")
  local width = vim.fn.winwidth(0) - string.len(numlen) - string.len(text) - string.len(info)

  -- if fold msg is too long
  if width < 0 then
    return string.sub(text, 1, width) .. ">" .. info
  end

  -- if OK
  return text .. string.rep(" ", width) .. info
end

function ToggleAllFolds()
  if vim.v.foldlevel == 0 then
    vim.cmd("normal! zR")
  else
    vim.cmd("normal! zM")
  end
end
