-- local autocmd = vim.api.nvim_create_autocmd
function InsertDecorativeComment()
  local line = vim.api.nvim_get_current_line()
  local maxWidth = 48
  local padding = (maxWidth - 2 - string.len(line)) / 2
  local leftPadding = string.rep(" ", padding)
  local rightPadding = string.rep(" ", maxWidth - 2 - string.len(line) - padding)
  local commentBlockLines = {
    "// ************************************************",
    "// *" .. leftPadding .. line .. rightPadding .. "*",
    "// ************************************************"
  }
  
  local currentLineNum = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, currentLineNum - 1, currentLineNum, false, commentBlockLines)
end

vim.api.nvim_create_user_command('CommentBlock', InsertDecorativeComment, {})

-- Pour lier la commande à Ctrl+c, par exemple :
vim.api.nvim_set_keymap('n', '<leader>cp', ':CommentBlock<CR>', { noremap = true, silent = true })

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
