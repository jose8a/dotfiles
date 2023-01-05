if vim.fn.has('nvim-0.7') == 1 then
print('we got neovim 0.7')

-- this removes ugly background solid green color from the gitsigns
-- gutter column
vim.opt.termguicolors = true

-- FIXME: trying to get this to work in Lua as below
-- .. but so far nothing works
-- augroup transparent_signs
--   au!
--
--   au ColorScheme * highlight GitSignsAdd ctermbg=none guibg=none
--   au ColorScheme * highlight GitSignsChange ctermbg=none guibg=none
--   au ColorScheme * highlight GitSignsDelete ctermbg=none guibg=none
-- augroup end

-- FIXME: trying to remove the green background color from gitsigns
-- vim.cmd [[highlight GitSignsAdd guibg=none gui=nocombine]]

-- FIXME: trying to remove the green background color from
-- the GitSignsAdd column, but this doesn't seem to
-- work (2022.0503)
local augroup = vim.api.nvim_create_augroup
local gitSignsAddGroup = augroup("GitSignsAdd", { clear = true })

vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "*",
    command = "highlight GitSignsAdd ctermbg=none ctermfg=green",
    group = gitSignsAddGroup
  }
)
end

-- Telescope key-shortcups
vim.cmd [[nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>]]
vim.cmd [[nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>]]
vim.cmd [[nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>]]
vim.cmd [[nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>]]
vim.cmd [[nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references()<cr>]]
vim.cmd [[nnoremap <leader>fd <cmd>lua require('telescope.builtin').lsp_definitions()<cr>]]
vim.cmd [[nnoremap <leader>ft <cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>]]
-- Telescope extension shortcuts
vim.cmd [[nnoremap <leader>fu <cmd>lua require('telescope').extensions.ultisnips.ultisnips()<cr>]]

