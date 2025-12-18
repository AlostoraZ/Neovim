return {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
        require('competitest').setup()
        vim.keymap.set('n', '<leader>cc', "<cmd>CompetiTest run<CR>", { desc = "[CompetiTest] UI" })
        vim.keymap.set('n', '<leader>ca', "<cmd>CompetiTest add_testcase<CR>", { desc = "[CompetiTest] Add test case" })
        vim.keymap.set('n', '<leader>ce', "<cmd>CompetiTest edit_testcase<CR>", { desc = "[CompetiTest] Edit test case" })
        vim.keymap.set('n', '<leader>cd', "<cmd>CompetiTest delete_testcase<CR>", { desc = "[CompetiTest] Delete test case" })
    end,
}
