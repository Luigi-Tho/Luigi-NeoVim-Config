return {
	'ThePrimeagen/harpoon',
	config = function ()
		
		require("harpoon").setup({
		  vim.keymap.set("n", "<leader>hp", function () require("harpoon.ui").toggle_quick_menu() end, {desc = "[h]ar[p]oon quick menu"}),
		  vim.keymap.set("n", "<leader>hpm", function () require("harpoon.mark").add_file() end, {desc = "[h]ar[p]oon [M]ark file"}),
		  vim.keymap.set("n", "<leader>t", function () require("harpoon.term").gotoTerminal(1) end, {desc = "go to [t]erminal"}),
		})
	end
}
