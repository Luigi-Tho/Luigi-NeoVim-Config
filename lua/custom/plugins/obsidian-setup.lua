return {
    "epwalsh/obsidian.nvim",
    lazy = true,
    ft = "markdown",
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre /Users/luigi_tho/My Drive (raenaa@umich.edu)/School Vault/**.md",
    --   "BufNewFile /Users/luigi_tho/My Drive (raenaa@umich.edu)/School Vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter",
    },
    opts = {
      workspaces = {
        {
          name = "school",
          path = "~/My Drive (raenaa@umich.edu)/School Vault",
        },
        {
          name = "personal",
          path = "~/Library/CloudStorage/GoogleDrive-raenaanderson11@gmail.com/My Drive",
        }
      }
    },
    config = function()
	local obs = require('obsidian')
	obs.setup({
	  ui = {enable = false},
	  detect_cwd = false,
	  open_notes_in = "vsplit",
	  finder = "telescope.nvim",
	  follow_url_func = function(url)
	    vim.fn.jobstart({"open", url})
	  end,
	  mappings = {
	    -- Toggle check-boxes.
	    ["<leader>ch"] = {
	      action = function()
		return require("obsidian").util.toggle_checkbox()
	      end,
	      opts = { buffer = true },
	    },
	  },
	  completion = {
	    nvim_cmp = true,
	    min_chars = 2,
	    new_notes_location = "current_dir",
	    prepend_note_id = true,
	    prepend_note_path = false,
	  },
	  attachments = {
	    img_folder = "Image Bank",
	  },
	  templates = {
	    subdir = "99 Templates",
	    date_format = "%d-%m-$Y",
	    time_format = "%H:%M",
	  },
	  backlinks = {
	    height = 10,
	    wrap = true,
	  },
	  daily_notes = {}
	})
    end
}
