-----------
-- Setup --
-----------

local opts = {
  noremap = true, -- https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
  silent = true,  -- To define a mapping which will not be echoed on the command line (ref :h map-silent)
}

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------
-- NOTES --
-----------

-- MODES --
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Map `Options` key on MacOs
-- https://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim#answer-15399297

-----------------
-- IMPORTANTCE --
-----------------

-- Keymappings related to `LSP` -> `lsp.handlers`
-- Keymappings starts with `<leader>` -> whichkey configuration

--------------
-- Hardcore --
--------------

-- disable arrow keys for normal mode and insert mode
keymap("n", "<Up>", "<NOP>", opts)
keymap("n", "<Down>", "<NOP>", opts)
keymap("n", "<Left>", "<NOP>", opts)
keymap("n", "<Right>", "<NOP>", opts)
keymap("i", "<Up>", "<NOP>", opts)
keymap("i", "<Down>", "<NOP>", opts)
keymap("i", "<Left>", "<NOP>", opts)
keymap("i", "<Right>", "<NOP>", opts)

------------
-- Normal --
------------

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

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

-- Move line up and down
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
