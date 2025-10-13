-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.spell = false

    -- formatoptionsのrは削除（競合するため）
    vim.opt_local.formatoptions:remove("r")

    -- 改行時にリスト記号を引き継ぐ
    vim.keymap.set("i", "<CR>", function()
      local line = vim.api.nvim_get_current_line()
      -- チェックボックス付きリスト (- [ ] or - [x])
      local indent = line:match("^(%s*)-%s%[.%]%s")
      if indent then
        return "<CR>" .. indent .. "- [ ] "
      end
      -- 通常のリスト (-, *, +)
      local indent_marker = line:match("^(%s*[%-%*%+]%s)")
      if indent_marker then
        return "<CR>" .. indent_marker
      end
      return "<CR>"
    end, { buffer = true, expr = true, desc = "Smart list continuation" })

    -- oキーでの行追加時にも適用
    vim.keymap.set("n", "o", function()
      local line = vim.api.nvim_get_current_line()
      -- チェックボックス付きリスト
      local indent = line:match("^(%s*)-%s%[.%]%s")
      if indent then
        return "o" .. indent .. "- [ ] "
      end
      -- 通常のリスト
      local indent_marker = line:match("^(%s*[%-%*%+]%s)")
      if indent_marker then
        return "o" .. indent_marker
      end
      return "o"
    end, { buffer = true, expr = true, desc = "Smart list continuation with o" })
  end,
})
