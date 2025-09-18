return {
  -- nvim-lintの設定をオーバーライド
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        -- markdownのlinterを空にする（無効化）
        markdown = {},
      },
    },
  },
}
