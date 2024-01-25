return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'vadimcn/codelldb',
      'williamboman/mason.nvim'
    },
      config = function ()
	    local dap = require('dap')
	    local dapui = require("dapui")

	    dap.set_log_level("DEBUG")
	    dap.adapters.codelldb = {
	      type = 'server',
	      host = '127.0.0.1',
	      port = "${port}",
	      executable = {
		command = "/Users/luigi_tho/.local/share/nvim/mason/packages/codelldb/codelldb",
		args = {"--port", "${port}"},
	      }
	    }
	    dap.configurations.cpp = {{
		name = 'Launch',
		type = 'codelldb',
		request = 'launch',
		program = function()
		  local executable = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		  -- local input_file = vim.fn.input('Path to input file: ', vim.fn.getcwd() .. '/', 'file')
		  -- return "bash -c '" .. executable .. "<" .. input_file .. "'"
		  return executable
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = {"example.txt"},
	      },
	    }

	    dap.configurations.c = dap.configurations.cpp
	    dap.configurations.rust = dap.configurations.cpp
	    require('dap.ext.vscode').load_launchjs(nil, {})
	    dapui.setup()

	    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
	    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
	    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end


	    vim.keymap.set('n', '<F5>', function()
	      dap.continue()
	    end)
	    vim.keymap.set('n', '<S-F5>', function() dap.disconnect({terminateDebuggee = true}) end)
	    vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
	    vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
	    vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
	    vim.keymap.set('n', '<S-F5>', function() require'dap'.disconnect({ terminateDebuggee = true }) end)
	    vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
	    vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
	    vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
	    vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
	    vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
	    vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
	      require('dap.ui.widgets').hover()
	    end)
	    vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
	      require('dap.ui.widgets').preview()
	    end)
	    vim.keymap.set('n', '<Leader>df', function()
	      local widgets = require('dap.ui.widgets')
	      widgets.centered_float(widgets.frames)
	    end)
	    vim.keymap.set('n', '<Leader>ds', function()
	      local widgets = require('dap.ui.widgets')
	      widgets.centered_float(widgets.scopes)
	    end)
      end
    }
}
