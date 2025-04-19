vim.cmd('packadd packer.nvim')

vim.g.mapleader = " "  -- Use space as the leader key. You can also use "," or ";"

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- a theme
    use 'navarasu/onedark.nvim'
    require("onedark").setup({
      style = "dark"
    })
    require("onedark").load()

    -- Icons
    use 'nvim-tree/nvim-web-devicons'

    -- Syntax highlighting
    use 'nvim-treesitter/nvim-treesitter'

    -- File explorer
    use 'nvim-tree/nvim-tree.lua'
    require("nvim-tree").setup({
            sort_by = "case_sensitive",
            view = {
                    adaptive_size = true,
            },
            renderer = {
                    group_empty = true,
            },
            filters = {
                    dotfiles = false,
            },
    })

    -- optional keybindings
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

    require'nvim-treesitter.configs'.setup {
      -- Add languages to be installed here that you want installed
      ensure_installed = { "c", "cpp", "lua", "python", "javascript", "typescript", "html", "css", "kotlin" },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
      highlight = {
        enable = true,
      },
    }

    use {
            'nvim-telescope/telescope.nvim',
            requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { "nvim-telescope/telescope-file-browser.nvim" }

    -- LSP Config
    use {
            'neovim/nvim-lspconfig',
            requires = {
                    -- You might need to include dependencies for specific LSP servers here
                    -- For example:
                    -- {'williamboman/mason.nvim'},
                    -- {'williamboman/mason-lspconfig.nvim'},
            }
    }

end)

require("telescope").load_extension "file_browser"

-- Telescope configuration
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Telescope file-browser configuration
vim.keymap.set("n", "<space>fb", function()
	require("telescope").extensions.file_browser.file_browser()
end)

-- Other configuration
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.number = true

