return {
    { 'terryma/vim-smooth-scroll', 
       config = function()
        vim.api.nvim_set_keymap('n', '<C-u>', ':call smooth_scroll#up(&scroll, 0, 2)<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<C-d>', ':call smooth_scroll#down(&scroll, 0, 2)<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<C-b>', ':call smooth_scroll#up(&scroll*2, 0, 4)<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<C-f>', ':call smooth_scroll#down(&scroll*2, 0, 4)<CR>', { noremap = true, silent = true })
       end
    },
}
