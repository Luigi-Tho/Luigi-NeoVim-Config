return {
    'vim-test/vim-test',
    dependencies = {
	'preservim/vimux'
    },
    vim.keymap.set('n', '<leader>tf',':TestNearest<CR>'),
    vim.keymap.set('n', '<leader>Tf',':TestFile<CR>'),
    vim.keymap.set('n', '<leader>ta',':TestSuite<CR>'),
    vim.keymap.set('n', '<leader>l',':TestLast<CR>'),
    vim.keymap.set('n', '<leader>g',':TestVisit<CR>'),

    vim.cmd('let test#strategy = "vimux"')
}
