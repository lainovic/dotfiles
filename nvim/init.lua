-- init.lua - Neovim configuration
-- Author: lainovic

---------------------------------------------------
-- Basic Settings (from keymaps.lua)
---------------------------------------------------
-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- General settings
vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.number = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.termguicolors = true

-- Indentation settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Search settings
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Better split defaults
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Key mappings
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

---------------------------------------------------
-- Lazy.nvim setup
---------------------------------------------------
-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Initialize lazy.nvim
require("lazy").setup({
  spec = {
    -- import plugins
    { import = "plugins" },
  },
  install = {
    colorscheme = { "habamax" },
  },
  checker = { enabled = true },
  change_detection = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
