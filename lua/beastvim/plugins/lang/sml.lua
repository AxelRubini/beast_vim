local root_spec = {
  {
    "sml.pkg",
    "sources.cm",
  },
}

vim.list_extend(vim.g.root_spec, root_spec)
vim.g.root_spec = root_spec

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "sml" } },
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "standardml-language-server",
        "smlfmt",
      })
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      servers = {
        ["standardml-language-server"] = {
          config = {
            cmd = { "standardml-language-server" },
            filetypes = { "sml" },
            root_markers = { "sml.pkg", "sources.cm", ".git" },
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sml = { "smlfmt" },
      },
    },
  },
}
