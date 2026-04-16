return {
  {
    "nvim-mini/mini.map",
    version = false,
    config = function()
      local map = require("mini.map")

      map.setup({
        integrations = {
          map.gen_integration.builtin_search(),
          map.gen_integration.gitsigns(),
          map.gen_integration.diagnostic(),
        },
        symbols = {
          encode = map.gen_encode_symbols.dot("4x2"), -- 表示スタイル
        },
        window = {
          side = "right",
          width = 10,
          winblend = 50, -- 透過
        },
      })
      -- キーマップ設定
      vim.keymap.set("n", "<leader>m", map.toggle, { desc = "Toggle MiniMap" })
    end,
  },
}
