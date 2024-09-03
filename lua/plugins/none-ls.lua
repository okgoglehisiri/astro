-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    -- Import null-ls
    local null_ls = require "null-ls"

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use opts.sources = {} instead of the list_insert_unique function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Set rustfmt as a formatter for Rust files
    })

    -- Add auto-formatting on save for Rust files
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    opts.on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end
  end,
}
