#!/usr/bin/env bash

conda create -n neovim -y python=3.12 pynvim
conda activate neovim
export PYTHON=$(which python)
conda deactivate

export RUBY=$(which ruby)

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install node
nvm use node

export NODE=$(which node)

export PERL=$(which perl)

/bin/cat <<EOF > ~/.config/nvim/lua/core/options.lua
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local options = {
  backup = false,         -- creates a backup file
  conceallevel = 2,       -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hidden = true,          -- required to keep multiple buffers and open multiple buffers
  ignorecase = true,      -- ignore case in search patterns
  mouse = "a",            -- allow the mouse to be used in neovim
  pumheight = 8,          -- pop up menu height
  pumblend = 10,          -- transparency of pop-up menu
  showmode = false,       -- we don't need to see things like -- INSERT -- anymore
  smartcase = true,       -- smart case
  smartindent = true,     -- make indenting smarter again
  splitbelow = true,      -- force all horizontal splits to go below current window
  splitright = true,      -- force all vertical splits to go to the right of current window
  swapfile = true,        -- creates a swapfile
  timeoutlen = 500,       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,        -- enable persistent undo
  updatetime = 100,       -- faster completion (4000ms default)
  writebackup = false,    -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,       -- convert tabs to spaces
  shiftwidth = 2,         -- the number of spaces inserted for each indentation
  tabstop = 2,            -- insert 2 spaces for a tab
  cursorline = true,      -- highlight the current line
  number = true,          -- set numbered lines
  relativenumber = true,  -- set relative numbered lines
  numberwidth = 4,        -- set number column width to 4 {default 4}
  signcolumn = "yes",     -- always show the sign column, otherwise it would shift the text each time
  wrap = false,           -- display lines as one long line
  scrolloff = 8,          -- minimal number of columns to scroll horizontally.
  sidescrolloff = 8,      -- minimal number of screen columns
  lazyredraw = false,     -- Won't be redrawn while executing macros, register and other commands.
  termguicolors = true,   -- Enables 24-bit RGB color in the TUI
  foldenable = true,
  foldlevel = 99,
  foldlevelstart = 99,
  foldmethod = "indent",
  fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "", lastline = " " }, -- make EndOfBuffer invisible
  foldcolumn = "1",
  ruler = false,
}

local global = {
  mkdp_auto_close = false,
  tex_compiles_successfully = false,
  term_pdf_vierer_open = false,
  tex_flavor = "latex",
  tex_conceal = "abdmgs",
  vimtex_quickfix_mode = 0,
  vimtex_compiler_latexmk_engines = { ["_"] = "-pdflatex" },
  vimtex_view_enabled = 0,
  vimtex_view_automatic = 0,
  mapleader = " ",
  vscode_snippets_path = vim.fn.stdpath("config") .. "/snippets/vscode",
  lua_snippets_path = vim.fn.stdpath("config") .. "/lua/custom/lua_snippets",
  magma_automatically_open_output = true,
  magma_wrap_output = false,
  magma_output_window_borders = false,
  magma_cell_highlight_group = "CursorLine",
  magma_save_path = vim.fn.stdpath("data") .. "/magma",
  vim_svelte_plugin_load_full_syntax = 1,
  python3_host_prog = "$PYTHON",
  ruby_host_prog = "$RUBY",
  node_host_prog = "$NODE",
  perl_host_prog = "$PERL",
  copilot_assume_mapped = true,
  vimwiki_list = { {
    path = '~/Documents/Notes',
    path_html = '~/Documents/Notes/HTML/',
    syntax = 'markdown',
    ext = '.md'
  } },
  vimwiki_url_maxsave = 0,
}

vim.opt.shortmess:append "Ac" -- Disable asking when editing file with swapfile.
vim.opt.whichwrap:append "<,>,[,],h,l"
vim.opt.iskeyword:append "-"
vim.lsp.set_log_level("ERROR")

set_option(options)
set_global(global)

EOF
