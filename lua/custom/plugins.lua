local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  -- override plugin configs
{
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    -- enabled = true
  },
  -- {
  --   'goolord/alpha-nvim',
  --   lazy = false,
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   config = function ()
  --       require'alpha'.setup(require'alpha.themes.startify'.config)
  --   end
  -- };

  {
    "Diogo-ss/42-header.nvim",
    lazy = false,
    config = function()
        local header = require("42header")
        header.setup({
            default_map = true, -- default Mapping <F1> in normal mode
            auto_update = true,  -- update header when saving
            user = "whamdi", -- your user
            mail = "", -- your mail
        })
    end
  },

-- ------THEMES------
--   {
-- 		"rebelot/kanagawa.nvim",
--   },
--
-- {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--     config = function()
--         require("catppuccin").setup({
--             flavour = "mocha", -- Change this line to your desired flavor
--             -- Autres options de configuration de Catppuccin
--         })
--     end,
-- },
-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
-- {
--     "scottmckendry/cyberdream.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("cyberdream").setup({
--             -- Recommended - see "Configuring" below for more config options
--             transparent = true,
--             italic_comments = true,
--             hide_fillchars = true,
--             borderless_telescope = true,
--             terminal_colors = true,
--         })
--         vim.cmd("colorscheme cyberdream") -- set the colorscheme
--     end,
-- },
--------------------

  -- {
  --   "lourio0/nvim-count_lines",
  --   lazy = false,
  --   config = function()
  --       require('nvim-count_lines').count_lines()
  --   end,
  -- },

  {
    "rcarriga/nvim-notify",
    lazy = false,
  },

  {
    "MunifTanjim/nui.nvim",
    lazy = false,
  },

{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
},

  {
    "jbyuki/instant.nvim",
    lazy = false,
  },
  {
	"andweeb/presence.nvim",
	lazy = false,
  },

  {
  'stevearc/aerial.nvim',
	lazy = false,
    opts = {},
  -- Optional dependencies
    dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
  {
    "smjonas/inc-rename.nvim",
	lazy = false,
    config = function()
      require("inc_rename").setup()
    end,
 },
  {
    "karb94/neoscroll.nvim",
	lazy = false,
    config = function ()
      require('neoscroll').setup {}
    end
  },

{ 'anuvyklack/pretty-fold.nvim',
	lazy = false,
   config = function()
      require('pretty-fold').setup()
   end
},
		{'kevinhwang91/nvim-ufo',
		lazy = false,
		requires = 'kevinhwang91/promise-async'},
	--{
	--   "startup-nvim/startup.nvim",
	--   lazy = false,
	--   requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
	--   config = function()
	-- 	require"startup".setup()
	--   end
	-- },
}
  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
