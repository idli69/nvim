return {
  "ibhagwan/fzf-lua",
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  keys = {
    { "<leader>ff", function() require("fzf-lua").files() end, desc = "Find Files" },
    { "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Live Grep" },
    { "<leader>fo", function() require("fzf-lua").oldfiles() end, desc = "Recent Files" },
    { "<leader>fh", function() require("fzf-lua").help_tags() end, desc = "Help" },
    { "<leader>fk", function() require("fzf-lua").keymaps() end, desc = "Keymaps" },
    { "<leader>fc", function() require("fzf-lua").commands() end, desc = "Commands" },

    { "<leader>gs", function() require("fzf-lua").git_status() end, desc = "Git Status" },
    { "<leader>gb", function() require("fzf-lua").git_branches() end, desc = "Git Branches" },
    { "<leader>gc", function() require("fzf-lua").git_commits() end, desc = "Git Commits" },

    { "<leader><leader>", function() require("fzf-lua").resume() end, desc = "Resume last picker" },
  },
  opts = {
    winopts = {
      preview = {
        scrollbar =  false
      }
    }
  },
}
