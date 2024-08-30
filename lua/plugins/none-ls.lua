---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require "null-ls"

    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Rust
      null_ls.builtins.formatting.rustfmt,
      null_ls.builtins.diagnostics.rustfmt,
      null_ls.builtins.diagnostics.clippy.with({
        extra_args = { "--all-features", "--all-targets" },
      }),

      -- PHP
      null_ls.builtins.formatting.phpcbf,
      null_ls.builtins.diagnostics.php,
      null_ls.builtins.diagnostics.phpcs,
      null_ls.builtins.diagnostics.phpstan,

      -- Node (using Biome)
      null_ls.builtins.formatting.biome,
      null_ls.builtins.linting.biome,

      -- Go
      null_ls.builtins.formatting.gofmt,
      null_ls.builtins.formatting.goimports,
      null_ls.builtins.diagnostics.golangci_lint,

      -- YAML
      null_ls.builtins.formatting.yamlfmt,
      null_ls.builtins.diagnostics.yamllint,

      -- OpenAPI
      null_ls.builtins.diagnostics.spectral,
    })
  end,
}