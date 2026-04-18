local options = {
    -- BASIC SETTINGS
    number = true,              -- set numbered lines
    relativenumber = true,      -- set relative numbered lines
    cursorline = true,          -- highlight the current line
    wrap = false,               -- display lines as one long line
    scrolloff = 8,              -- keep 8 lines above/below cursor
    sidescrolloff = 8,          -- keep 8 cols above/below cursor
    
    -- INDENTATION --
    tabstop = 4,                -- the width of a single \t character
    shiftwidth = 4,             -- the number of spaces inserted for each indentation
    softtabstop = 4,            -- the number of columns affected by pressing Tab or Backspace
    expandtab = true,           -- use spaces instead of tabs
    smartindent = true,         -- make indenting smarter again
    autoindent = true,          -- copy indent from the current line
    
    -- SEARCH SETTINGS --
    ignorecase = true,          -- case insensitive search patterns
    smartcase = true,           -- case sensitive if uppercase in search
    hlsearch = true,            -- highlight all matches on previous search pattern
    incsearch = true,           -- show matches as you type
    
    -- VISUAL SETTINGS --
    termguicolors = true,       -- set term gui colors (most terminals support this)
    signcolumn = "yes",         -- always show the sign column, otherwise it would shift the text each time
    colorcolumn = "100",         -- show column at 100 characters
    showmatch = true,           -- highlight matching bracket
    matchtime = 2,              -- how long to show matching bracket
    cmdheight = 3,              -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noinsert", "noselect" }, -- mostly just for cmp
    showmode = false,           -- we don't need to see things like -- INSERT -- anymore
    pumheight = 10,             -- pop up menu height
    pumblend = 10,              -- pop up menu transparency
    winblend = 0,               -- floating windown transparency
    conceallevel = 0,           -- don't hide markup so that `` is visible in markdown files
    concealcursor = "",         -- don't hide cursor line markup
    lazyredraw = true,          -- don't redraw during macros
    synmaxcol = 300,            -- don't hightlight syntax if line is longer than 300 cols (avoid perf issue)
    showtabline = 2,            -- always show neovim tabs
    numberwidth = 4,            -- set number column width to 4
    -- guifont = "monospace:h17", -- the font used in graphical neovim applications
    
    -- FILE HANDLING --
    backup = false,             -- don't creates a backup file
    writebackup = false,        -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    swapfile = false,           -- creates a swapfile
    undofile = true,            -- enable persistent undo
    -- undodir = ""
    updatetime = 300,           -- faster completion (4000ms default)
    timeoutlen = 500,           -- time to wait for a mapped sequence to complete (in milliseconds)
    ttimeoutlen = 0,            -- key code timeout
    autoread = true,            -- auto-reload files changed outside vim/nvim 
    autowrite = false,          -- don't auto save
    
    -- BEHAVIOR SETTINGS --
    hidden = true,              -- allow hidden buffers errorbells = false,         -- no error bells
    backspace = { "indent", "eol", "start" }, -- better backspace behavior
    autochdir = false,          -- don't auto change dir 
    selection = "exclusive",     -- selection behavior
    mouse = "a",                -- allow the mouse to be used in neovim
    -- clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    modifiable = true,          -- allow buffer modidifications
    encoding = "UTF-8",
    fileencoding = "utf-8",     -- the encoding written to a file
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    
    -- FOLDING -- (required nvim-treesitter), ref here: https://www.reddit.com/r/neovim/comments/psl8rq/sexy_folds/
    foldmethod = "expr",
    foldexpr = "nvim_treesitter#foldexpr()",
    foldtext = [[substitute(getline(v:foldstart),'\t',repeat(' ',&tabstop),'g').'...'.trim(getline(v:foldend))]],
    fillchars = { fold = " " },
    foldnestmax = 20, -- maximum foldable level
    foldminlines = 1,
    -- foldenable = false, -- you don't want auto folded at launching/openning a file
    -- foldlevel = 20, -- you can replace `foldenable` option: unfold first 20 levels
    
    -- GREP --
    grepprg = "rg --vimgrep --no-heading --smart-case",
    grepformat = "%f:%l:%c:%m",
}


for k, v in pairs(options) do
	vim.opt[k] = v
end

-- suppresses messages for completion ("c" flag).
vim.opt.shortmess:append("c")
-- treat dash as part of word
vim.opt.iskeyword:append("-") -- vim.cmd([[set iskeyword+=-]])
-- include sub-dir in search
vim.opt.path:append("**")
-- allows neovim to access the system clipboard
vim.opt.clipboard:append("unnamedplus")
