return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "java" } },
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "jdtls" })
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      servers = {
        jdtls = {
          config = {
            cmd = { "jdtls" },
            filetypes = { "java" },
            root_markers = {
              ".project",
              ".classpath",
              "pom.xml",
              "build.gradle",
              ".git",
            },
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        java = { "google-java-format" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        java = { "checkstyle" },
      },
    },
  },
}

