return {
    "oflisback/obsidian-bridge.nvim",
    config = function() require("obsidian-bridge").setup() end,
    event = {
      "BufReadPre *.md",
      "BufNewFile *.md",
    },
    lazy = true,
}
