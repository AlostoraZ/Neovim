local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

map("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without copy to clipboard" })
map("n", "x", '"_x', opts)

-- Hightlight copied text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Copy filepath to clipboard
map("n", "yp", function()
    local filePath = vim.fn.expand("%:~")
    vim.fn.setreg("+", filePath)
    print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipborad" })

-- ===========================
-- INSERT MODE
-- ===========================
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("i", "JK", "<ESC>", { desc = "Exit insert mode" })
map("i", "<C-b>", "<ESC>^i", { desc = "Beginning of line" })
map("i", "<C-e>", "<End>", { desc = "End of line" })
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })

-- ===========================
-- NORMAL MODE
-- ===========================
-- Window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tabs
map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Next tab" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Previous tab" })
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Increment / Decrement
map("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Clear search highlights
map("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear highlights" })

-- Run Java
-- map("n", "<leader>rr", function()
-- vim.cmd("split term://javac % && java %:r")
-- end, { desc = "Run current Java file" })

-- Window movement
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })

-- Save / Copy
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("n", "yA", "<cmd>%y+<CR>", { desc = "Copy entire file" })

-- Line numbers toggle
map("n", "<leader>ln", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })

-- Smooth wrapped line movement
map("n", "j", 'v:count || mode(1)[0:1]=="no" ? "j" : "gj"', { desc = "Move down", expr = true })
map("n", "k", 'v:count || mode(1)[0:1]=="no" ? "k" : "gk"', { desc = "Move up", expr = true })
map("n", "<Up>", 'v:count || mode(1)[0:1]=="no" ? "k" : "gk"', { desc = "Move up", expr = true })
map("n", "<Down>", 'v:count || mode(1)[0:1]=="no" ? "j" : "gj"', { desc = "Move down", expr = true })

-- Buffers
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "New buffer" })
-- map("n", "<leader>x", "<cmd>bd<CR>", { desc = "Delete buffer" })
map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprev<CR>", { desc = "Prev buffer" })
map("n", "<leader>pb", "<cmd>BufferLineTogglePin<CR>", { desc = "Toggle buffer pin" })
map("n", 'gbb', '<cmd>BufferLinePick<CR>', { desc = "Select Buffer" })

-- LSP formatting
map("n", "<leader>fm", function()
    vim.lsp.buf.format { async = true }
end, { desc = "LSP format" })

-- auto-Session
map("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "Save session" })
map("n", "<leader>wr", "<cmd>AutoSession restore<CR>", { desc = "Restore session" })
map("n", "<leader>wp", "<cmd>AutoSession search<CR>", { desc = "Pick session" })

-- nvim-specter
map('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
map('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
    { desc = "Search current word" })
map('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Search current word" })
map('n', '<leader>sc', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
    { desc = "Search on current file" })

-- comment
map('n', '<leader>/', function()
    return vim.v.count == 0
        and '<Plug>(comment_toggle_linewise_current)'
        or '<Plug>(comment_toggle_linewise_count)'
end, { desc = "Toggle comment", expr = true })

-- ===========================
-- TERMINAL MODE
-- ===========================
--local terminal = require("nvterm.terminal")
--local toggle_modes = {'n', 't'}
--map( toggle_modes, '<leader>th', function () terminal.toggle('horizontal') end )
--map( toggle_modes, '<leader>tv', function () terminal.toggle('vertical') end )
--map( toggle_modes, '<A-h>', function () terminal.toggle('horizontal') end )
--map( toggle_modes, '<A-v>', function () terminal.toggle('vertical') end )
--map( toggle_modes, '<A-i>', function () terminal.toggle('float') end )
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Escape terminal mode" })


-- ===========================
-- VISUAL MODE
-- ===========================
map("v", "<Up>", 'v:count || mode(1)[0:1]=="no" ? "k" : "gk"', { desc = "Move up", expr = true })
map("v", "<Down>", 'v:count || mode(1)[0:1]=="no" ? "j" : "gj"', { desc = "Move down", expr = true })
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })
map("v", "JK", "<ESC>", { desc = "Exit insert mode" })

-- ===========================
-- VISUAL BLOCK MODE
-- ===========================
map("x", "j", 'v:count || mode(1)[0:1]=="no" ? "j" : "gj"', { desc = "Move down", expr = true })
map("x", "k", 'v:count || mode(1)[0:1]=="no" ? "k" : "gk"', { desc = "Move up", expr = true })
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Don’t copy replaced text", silent = true })

-- ===========================
-- NVIMTREE
-- ===========================
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>", { desc = "Focus NvimTree" })

-- ===========================
-- TELESCOPE
-- ===========================
-- map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    { desc = "Find all files" })
-- map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
-- map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
-- map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help" })
-- map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
-- map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Fuzzy find in buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
-- map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "Pick hidden terminal" })
-- map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "Bookmarks" })


-- ===========================
-- WHICHKEY
-- ===========================
map("n", "<leader>wK", "<cmd>WhichKey<CR>", { desc = "WhichKey all keymaps" })
map("n", "<leader>wk", function()
    local input = vim.fn.input "WhichKey: "
    vim.cmd("WhichKey " .. input)
end, { desc = "WhichKey query" })

-- ===========================
-- GITSIGNS
-- ===========================
map("n", "]c", function()
    if vim.wo.diff then return "]c" end
    vim.schedule(function() require("gitsigns").next_hunk() end)
    return "<Ignore>"
end, { desc = "Next hunk", expr = true })

map("n", "[c", function()
    if vim.wo.diff then return "[c" end
    vim.schedule(function() require("gitsigns").prev_hunk() end)
    return "<Ignore>"
end, { desc = "Prev hunk", expr = true })

-- map("n", "<leader>rh", function() require("gitsigns").reset_hunk() end, { desc = "Reset hunk" })
-- map("n", "<leader>ph", function() require("gitsigns").preview_hunk() end, { desc = "Preview hunk" })
-- map("n", "<leader>lb", function() package.loaded.gitsigns.blame_line() end, { desc = "Blame line" })
map("n", "<leader>td", function() require("gitsigns").toggle_deleted() end, { desc = "Toggle deleted" })

-- ===========================
-- BLANKLINE
-- ===========================
map("n", "<leader>cc", function()
    local ok, start = require("indent_blankline.utils").get_current_context(
        vim.g.indent_blankline_context_patterns,
        vim.g.indent_blankline_use_treesitter_scope
    )
    if ok then
        vim.api.nvim_win_set_cursor(0, { start, 0 })
        vim.cmd("normal! _")
    end
end, { desc = "Jump to current context" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

vim.keymap.set("n", "<leader>rr", function()
    for name, _ in pairs(package.loaded) do
        if name:match("^custom") then
            package.loaded[name] = nil
        end
    end
    dofile(vim.env.MYVIMRC)
    print("🔁 config reloaded!")
end, { desc = "Reload Neovim config" })
