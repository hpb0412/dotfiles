local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------
-- Modes --
-----------

--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-----------
-- Notes --
-----------

-- Map Options key on MacOs
-- https://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim#answer-15399297


------------
-- Normal --
------------

-- Hardcore
keymap("n", "<Up>", "<NOP>", opts)
keymap("n", "<Down>", "<NOP>", opts)
keymap("n", "<Left>", "<NOP>", opts)
keymap("n", "<Right>", "<NOP>", opts)
-- keymap("n", "j", "<NOP>", opts)
-- keymap("n", "k", "<NOP>", opts)
-- keymap("n", "h", "<NOP>", opts)
-- keymap("n", "l", "<NOP>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Open TreeView
-- keymap("n", "<leader>e", ":Lex 30<CR>", opts)
-- keymap("n", "<leader>e", ":NeoTreeShowToggle<CR>", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize -2<CR>", opts)
keymap("n", "<A-Down>", ":resize +2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "˚", ":m-2<CR>==", opts) -- on Mac <A-k> is ˚
keymap("n", "∆", ":m+1<CR>==", opts) -- on Mac <A-j> is ∆

-- Telescope --
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>p", "<cmd>Telescope projects<cr>", opts)
keymap("n", "<leader><S-f>", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)


------------
-- Insert --
------------

-- Move text up and down
keymap("i", "˚", "<Esc>:m .-2<CR>==gi", opts) -- on Mac <A-k> is ˚
keymap("i", "∆", "<Esc>:m .+1<CR>==gi", opts) -- on Mac <A-j> is ∆


------------
-- Visual --
------------

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "˚", ":m '<-2<CR>gv=gv", opts) -- on Mac <A-k> is ˚
keymap("v", "∆", ":m '>+1<CR>gv=gv", opts) -- on Mac <A-j> is ∆
-- keymap("v", "p", '"_dP', opts)


------------------
-- Visual Block --
------------------

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


--------------
-- Terminal --
--------------

-- Better terminal navigation
-- we move these key binding into `toggleterm` module
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

