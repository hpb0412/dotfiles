-----------
-- Setup --
-----------

local opts = {
  noremap = true, -- https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
  silent = true,  -- To define a mapping which will not be echoed on the command line (ref :h map-silent)
}

local term_opts = { silent = true }

-- Remap space as leader key
vim.g.mapleader = " "
vim.keymap.set("", "<Space>", "<Nop>", opts)
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

----------------
-- IMPORTANCE --
----------------

-- Keymappings related to `LSP` -> `lsp.handlers`
-- Keymappings starts with `<leader>` -> whichkey configuration

--------------
-- Hardcore --
--------------

-- disable arrow keys for normal mode and insert mode
vim.keymap.set("n", "<Up>", "<NOP>", opts)
vim.keymap.set("n", "<Down>", "<NOP>", opts)
vim.keymap.set("n", "<Left>", "<NOP>", opts)
vim.keymap.set("n", "<Right>", "<NOP>", opts)
vim.keymap.set("i", "<Up>", "<NOP>", opts)
vim.keymap.set("i", "<Down>", "<NOP>", opts)
vim.keymap.set("i", "<Left>", "<NOP>", opts)
vim.keymap.set("i", "<Right>", "<NOP>", opts)

------------
-- NORMAL --
------------

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
vim.keymap.set("n", "<A-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<A-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<A-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
vim.keymap.set("n", "<A-k>", ":m-2<CR>==", opts)
vim.keymap.set("n", "<A-j>", ":m+1<CR>==", opts)
vim.keymap.set("n", "˚", ":m-2<CR>==", opts) -- on Mac <A-k> is ˚
vim.keymap.set("n", "∆", ":m+1<CR>==", opts) -- on Mac <A-j> is ∆

-- Y to  EOL
-- vim.keymap.set("n", "Y", "y$", opts)

------------
-- Insert --
------------

-- Move text up and down
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
vim.keymap.set("i", "˚", "<Esc>:m .-2<CR>==gi", opts) -- on Mac <A-k> is ˚
vim.keymap.set("i", "∆", "<Esc>:m .+1<CR>==gi", opts) -- on Mac <A-j> is ∆

------------
-- Visual --
------------

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "˚", ":m '<-2<CR>gv=gv", opts) -- on Mac <A-k> is ˚
vim.keymap.set("v", "∆", ":m '>+1<CR>gv=gv", opts) -- on Mac <A-j> is ∆
-- vim.keymap.set("v", "p", '"_dP', opts)

------------------
-- Visual Block --
------------------

-- Move line up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

--------------
-- Terminal --
--------------

-- Better terminal navigation
-- we move these key binding into `toggleterm` module
-- vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
