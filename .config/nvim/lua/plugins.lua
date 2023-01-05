-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- PACKER
  -- =============================================
  use { 'wbthomason/packer.nvim' }

  -- Load first (startup speedup, common utils, etc)
  -- =============================================
  use {'lewis6991/impatient.nvim'}
  use {'nathom/filetype.nvim'}
  use { 'nvim-lua/plenary.nvim' }
  use { 'kyazdani42/nvim-web-devicons' }

  -- Misc Utilities
  -- =============================================
  use { 'metakirby5/codi.vim' }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup ({
        'css';
        'javascript';
        'html';
      },{
        css = true;
      })
    end
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {
        disable_filetype = { "TelescopePrompt" , "vim" },
      }
    end
  }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup {
        -- use the default settings
        -- TODO: create key-mappings (see the repo)
      }
    end
  }

  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup {
        -- use the default settings
        keywords = {
          FIX = {
            icon = " ", -- used for sign, and w/search results
            color = "error", -- hex color, or named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of
              -- other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
          },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "DOVE" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
          TEST = { icon = ">", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
        -- highlight = {
        --   multiline = true, -- enable multine todo comments
        --   multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
        --   multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
        --   max_line_len = 400, -- ignore lines longer than this
        --   comments_only = false,
        --   exclude = {},
        -- },
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
          warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
          info = { "DiagnosticInfo", "#2563EB" },
          hint = { "DiagnosticHint", "#10B981" },
          default = { "Identifier", "#7C3AED" },
          test = { "Identifier", "#F2992F" },
        },
      }
    end
  }

  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {
        -- use the default settings
      }
    end
  }

  -- 'akinsho/bufferline.nvim'
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require("bufferline").setup{
        options = {
          separator_style = "slant"
        }
      }
    end
  }

  -- 'tami5/lspsaga.nvim'
  use {
    'tami5/lspsaga.nvim',
    config = function()
      require("lspsaga").setup {
      }

      require("lspsaga").init_lsp_saga({
        finder_action_keys = {
          open = '<CR>',
          quit = {'q', '<esc>'},
        },
        code_action_keys = {
          quit = {'q', '<esc>'},
        },
        rename_action_keys = {
          quit = '<esc>',
        },
      })
    end
  }

  -- TODO: these are next to be installed
  use { 'p00f/nvim-ts-rainbow' }

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  use { 'JoosepAlviste/nvim-ts-context-commentstring' }

  -- MODERN COLOR THEMES
  -- =============================================
  use {
    'navarasu/onedark.nvim',              -- default for all but MD
    config = function()
      require('onedark').setup {
        style = 'deep'
      }
      require('onedark').load()
    end
  }

  use { 'rebelot/kanagawa.nvim' }
  use { 'folke/tokyonight.nvim' }
  use { 'tiagovla/tokyodark.nvim' }
  use { 'sainnhe/sonokai' }
  use { 'ray-x/aurora' }

  -- LEGACY COLOR THEMES
  -- =============================================
  use { 'zeis/vim-kolor' }
  use { 'NLKNguyen/papercolor-theme' }  -- markdown-only theme
  use { 'morhetz/gruvbox' }
  use { 'dracula/vim' }

  -- LEGACY VIM UTILITIES
  -- =============================================
  use { 'godlygeek/tabular' }
  use { 'tpope/vim-surround' }
  use { 'mattn/emmet-vim' }


  -- GIT
  -- =============================================
  use { 'tpope/vim-fugitive' }
  use {
    'lewis6991/gitsigns.nvim',
    config = "require('config.gitsigns')"
  }

  -- TMUX
  -- =============================================
  use { 'christoomey/vim-tmux-navigator' }

  -- Language Parsers
  -- =============================================
  use {
    'nvim-treesitter/nvim-treesitter',
    config = "require('config.treesitter')"
  }
  use {
    'neovim/nvim-lspconfig',
    config = "require('config.lsp')"
  }

  -- Snippets
  -- TODO/FIXME: should these come before or after nvim-cmp if
  -- TODO/FIXME: .. nvim-cmp calls setup for any these below?
  -- =============================================
  use { 'SirVer/ultisnips' }
  use { 'honza/vim-snippets', rtp = '.' }
  use { 'quangnguyen30192/cmp-nvim-ultisnips', rtp = '.'}

  -- Completion
  -- TODO/FIXME: debug/edit/add the existing `nvim-cmp` config
  -- =============================================
  -- use { 'hrsh7th/nvim-cmp' }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      "quangnguyen30192/cmp-nvim-ultisnips",
      config = function()
        -- optional call to setup (see customization section)
        require("cmp_nvim_ultisnips").setup{}
      end,
      -- If you want to enable filetype detection based on treesitter:
      -- requires = { "nvim-treesitter/nvim-treesitter" },
    },
    config = "require('config.cmp')"
  }

  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/cmp-nvim-lua' }

  -- Telescope
  -- =============================================
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = "require('config.telescope')"
  }

  use { 'fhill2/telescope-ultisnips.nvim' }

  -- Statusline
  -- =============================================
  use {
    'hoob3rt/lualine.nvim',
    config = "require('config.lualine')"
  }

  -- non-Treesitter Markdown lang-tools
  -- =============================================
  -- use { 'vim-pandoc/vim-pandoc' }
  -- use { 'vim-pandoc/vim-pandoc-syntax' }
  use { 'preservim/vim-markdown' }
  use { 'SidOfc/mkdx' }
  use { 'Scuilion/markdown-drawer' }


  -- TODO/FIXME: additional plugins to install next
  -- =============================================
  -- very nifty navigation / alternative to vim-sneak
  -- * [ ] .. use { 'ggandor/lightspeed.nvim' }
  -- ..
  -- view diffs for git-changes across multiple changed-files
  -- * [ ] .. use { 'sindrets/diffview.nvim' }
  -- ..
  -- improved selection of objects/subjects via treesitter
  -- * [ ] .. use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  -- * [ ] .. use { 'RRethy/nvim-treesitter-textsubjects' }
  -- ..
  -- adds ts-syntax-highlighting to 'function' arguments
  -- * [ ] .. use { 'm-demare/hlargs.nvim' }
  -- ..
  -- utils to improve TS dev w/NV LSP
  -- * [ ] .. use { 'jose-elias-alvarez/nvim-lsp-ts-utils' }
  -- ..
  -- vim.ui interfaces - improve the defaults
  -- * [ ] .. use { 'stevearc/dressing.nvim' }

end)
