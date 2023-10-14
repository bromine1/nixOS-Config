return {
  {
    "mfussenegger/nvim-lint",
    event = "LazyFile",
    opts = {
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        nix = { "nix", "statix" },
        fish = { "fish" },
        java = { "checkstyle" },
        json = { "jsonlint" },
        python = { "ruff" },
        lua = { "selene" },
        css = { "stylelint" },
        ["*sh"] = { "ShellCheck" },
        ["*"] = { "languagetool" },
      },

      -- linters = {},
    },
  },
}
