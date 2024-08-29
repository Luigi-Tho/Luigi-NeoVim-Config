return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'vadimcn/codelldb',
      'williamboman/mason.nvim'
    },
  },
  -- {
  --   "mxsdev/nvim-dap-vscode-js",
  --   dependencies = {
  --     "mfussenegger/nvim-dap",
  --   }
  -- },
  config = function ()
    local dap = require('dap')
    dap.adapters.lldb = {
      type = 'executable',
      command = '/usr/bin/lldb',
      name = 'lldb'
    }
    dap.configurations.cpp = {
      {
	name = 'Launch',
	type = 'lldb',
	request = 'launch',
	program = function()
	  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
	end,
	cwd = '${workspaceFolder}',
	stopOnEntry = false,
	args = {},
      },
    }
  end
}
