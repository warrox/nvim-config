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

  -- {
  --   "hrsh7th/nvim-cmp",
  --   enabled = false
  -- },

  {
    "Diogo-ss/42-header.nvim",
    lazy = false,
    config = function()
        local header = require("42header")
        header.setup({
            default_map = true, -- default Mapping <F1> in normal mode
            auto_update = true,  -- update header when saving
            user = "whamdi", -- your user
            mail = "whamdi@student.42.fr", -- your mail
        })
    end
  },

	{
	"jbyuki/instant.nvim",
	lazy = false,
	},

	{
		"vim-scripts/DoxygenToolkit.vim"
	},

	-- {
	-- "lourio0/nvim-count_lines",
	-- lazy = false,
	-- config = function()
 --        require('nvim-count_lines').count_lines()
	-- end,
	-- },

	{
		"jvgrootveld/telescope-zoxide",
		lazy = false,
	},

	{
		"arakashic/chromatica.nvim",
		lazy = false,
	},
	{
	  "folke/flash.nvim",
	  event = "VeryLazy",
	  ---@type Flash.Config
	  opts = {},
	  -- stylua: ignore
	  keys = {
		{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
		{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
		{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
	  },
	},

	-- {
	--   "folke/noice.nvim",
	--   event = "VeryLazy",
	--   opts = {
	-- 	-- add any options here
	--   },
	--   dependencies = {
	-- 	-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 	"MunifTanjim/nui.nvim",
	-- 	-- OPTIONAL:
	-- 	--   `nvim-notify` is only needed, if you want to use the notification view.
	-- 	--   If not available, we use `mini` as the fallback
	-- 	"rcarriga/nvim-notify",
	-- 	},
	-- 	-- config = function()
	-- 	-- 	require "custom.configs.noice"
	-- 	-- end,
	-- }


  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
