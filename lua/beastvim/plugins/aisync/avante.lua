return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    cmd = {
      "AvanteChat",
      "AvanteToggle",
      "AvanteAsk",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "stevearc/dressing.nvim",
    },
    keys = {
      { "<leader>aa", "<cmd>AvanteChat<cr>", desc = "Apri Avante" },
      { "<leader>at", "<cmd>AvanteToggle<cr>", desc = "Mostra/Nascondi Avante" },
    },
    opts = function()
      local opts = {
        provider = vim.env.BEASTVIM_AVANTE_PROVIDER or "claude",
        claude = {
          api_key = vim.env.ANTHROPIC_API_KEY,
          model = vim.env.BEASTVIM_AVANTE_CLAUDE_MODEL or "claude-3-5-sonnet-20240620",
        },
        openai = {
          api_key = vim.env.OPENAI_API_KEY,
          model = vim.env.BEASTVIM_AVANTE_OPENAI_MODEL or "gpt-4o-mini",
        },
        cursor = {
          api_key = vim.env.CURSOR_API_KEY,
        },
        windows = {
          sidebar = {
            position = "right",
            width = 0.33,
          },
          input = {
            border = "rounded",
          },
        },
      }

      return opts
    end,
    config = function(_, opts)
      require("avante").setup(opts)
    end,
  },
}
