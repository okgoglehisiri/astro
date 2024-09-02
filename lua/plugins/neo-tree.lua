-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Neo-tree

---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,    -- ドットファイルを表示
          hide_gitignored = false,  -- .gitignoreされたファイルを表示
          hide_hidden = false,      -- 隠しファイルを表示
        },
      },
    })
  end
}
