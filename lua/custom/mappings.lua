---@type MappingsTable
local M = {}

M.general = {
  n = {
	["<C-w>"] = { "<C-w>w", "C-ww but with only C-w"},
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
  },
  i = {
    ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
  },
  v = {
    ["J"] = {":m '>+1<CR>gv=gv", "Move one line up"},
    ["K"] = {":m '<-2<CR>gv=gv", "Move one line up"},
  },
  t = {
    ["<C-w>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N><C-w>w", true, true, true), "Escape terminal mode" },
  },
}

return M
