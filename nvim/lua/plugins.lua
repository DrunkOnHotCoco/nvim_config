vim.cmd [[packadd packer.nvim]]
require('nvim-lastplace').setup{
    lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
    lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
    lastplace_open_folds = true
}

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


  -- JJ/JK escape
  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup {
      mapping = {"jk", "jj"}, -- a table with mappings to use
      timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
      clear_empty_lines = false, -- clear line after escaping if there is only whitespace
      keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime  
      }
    end,
  }

  -- Remember last location in iles
  use 'ethanholz/nvim-lastplace'

  -- Session Manager
  use {
  'rmagatti/auto-session',
  config = function()
    require("auto-session").setup {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
    }
  end
  }
  ---- Keybind suggestions (type command, suggest bind)
  --use {
  --  "folke/which-key.nvim",
  --  config = function()
  --    require("which-key").setup {
  --    }
  --  end
  --}
  
  -- Devicons - Icons
  use {
    'nvim-tree/nvim-web-devicons'
  }
  
  -- Color Theme (s...)
  use {
    'overcache/NeoSolarized'
  }
  use {
    'romgrk/doom-one.vim'
  }
  
  -- Styling/Status Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons'},
    config = function()
      require("lualine").setup{
        options = {
          theme = 'dracula', 
          globalstatus = true
        }
      }
    end,
  }

  --Terminal
  
  --use {
  --  's1n7ax/nvim-terminal',
  --  config = function()
  --      vim.o.hidden = true
  --      require('nvim-terminal').setup()
  --  end,
  --}


  
  -- Telescope - Fuzzy Search
  use {
    'nvim-lua/plenary.nvim',
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  -- Find and Replace
  use{
    'windwp/nvim-spectre',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  -- Treesitter - Syntax tree highlighting 
     
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
          require("nvim-treesitter").setup{
            options = {
              update_focused_file = true
            },
            highlight = {
              enable = true,
            },
            indent = {
              enable = true,
            },
          }
        end,
  }

  -- File Explorer
  use {
  'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("nvim-tree").setup{
        log = {
          enable = true,
          truncate = true,
          types = {
            git = true,
            profile = true,
          }
        },
      }
    end,
  }

  -- Tabs
  use {
  'romgrk/barbar.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("bufferline").setup{
        diagnostics = "coc" 
      }
    end,
  }

  use {
    'tiagovla/scope.nvim',
    config = function()
      require("scope").setup{
      }
    end,
  }
  
  -- C/C++ Stuff
  use {
    'neoclide/coc.nvim', -- Conquer of Completion (note that coc-clangd is also installed)
    branch = 'release'
  }

end)
