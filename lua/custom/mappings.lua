---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "load rc ", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

M.custom = {
  n = {
    ["<C-w>"] = { "<C-w>w", "C-ww but with only C-w"},
    ["<leader>mw"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace word in file" },
    ["<leader>cd"] = { "<cmd> Telescope zoxide list <CR>", "Open zoxide list" },
  },
  i = {
    ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
  },
  v = {
    ["J"] = {":m '>+1<CR>gv=gv", "Move one line up"},
    ["K"] = {":m '<-2<CR>gv=gv", "Move one line up"},
	["<leader>ms"] = {

	function ()
	  -- Save the current visual selection
	  -- local saved_reg = vim.fn.getreg('"')
	  -- Copy the visual selection to a register and clear the selection
	  vim.api.nvim_command("normal! \"ay")
	  vim.api.nvim_command("normal! gv")
	  -- Get the line numbers of the visual selection
	  local start_line = vim.fn.line("'<")
	  local end_line = vim.fn.line("'>")

	  -- Get the current indentation of the line above the visual selection
	  local above_indent = vim.fn.indent(start_line - 1)

	  -- Insert a new line with { before the selected lines with correct indentation
	  vim.fn.append(start_line - 1, string.rep(' ', above_indent) .. '{')

	  -- Append a new line with } after the selected lines with correct indentation
	  vim.fn.append(end_line + 1, string.rep(' ', above_indent) .. '}')

	  -- Restore the original visual selection
	  -- vim.fn.setreg('"', saved_reg)
	end,
		}
  },
  t = {
    ["<C-w>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N><C-w>w", true, true, true), "Escape terminal mode" },
  },
}

return M
