
-- lua/plugins/cord.lua
return {
  "vyfor/cord.nvim",
  config = function()
    require("cord").setup({
      -- 必要に応じて設定を追加
    })
  end,
  dependencies = { "nvim-lua/plenary.nvim" }, -- Cord.nvim は plenary に依存
}
