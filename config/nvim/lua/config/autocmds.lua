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
      if line:match("^%s*-%s%[.%]%s") then
        return "<CR>- [ ] "
      end
      -- 通常のリスト (-, *, +)
      if line:match("^%s*[%-%*%+]%s") then
        return "<CR>- "
      end
      return "<CR>"
    end, { buffer = true, expr = true, desc = "Smart list continuation" })

    -- oキーでの行追加時にも適用
    vim.keymap.set("n", "o", function()
      local line = vim.api.nvim_get_current_line()
      -- チェックボックス付きリスト
      if line:match("^%s*-%s%[.%]%s") then
        return "o- [ ] "
      end
      -- 通常のリスト
      if line:match("^%s*[%-%*%+]%s") then
        return "o- "
      end
      return "o"
    end, { buffer = true, expr = true, desc = "Smart list continuation with o" })

    -- リストマーカーのトグル
    vim.keymap.set("n", "<D-;>", function()
      local line = vim.api.nvim_get_current_line()
      local row = vim.api.nvim_win_get_cursor(0)[1]
      -- - がついている行の - を削除
      if line:match("^%s*-%s") then
        local new_line = line:gsub("^(%s*)-%s", "%1")
        vim.api.nvim_buf_set_lines(0, row - 1, row, false, { new_line })
        return
      end
      -- 普通の行に - を追加
      if line:match("%S") then
        local indent = line:match("^(%s*)")
        local content = line:match("^%s*(.+)")
        local new_line = indent .. "- " .. content
        vim.api.nvim_buf_set_lines(0, row - 1, row, false, { new_line })
        return
      end
    end, { buffer = true, desc = "Toggle markdown list marker" })

    -- チェックボックスのトグル
    vim.keymap.set("n", "<D-l>", function()
      local line = vim.api.nvim_get_current_line()
      local row = vim.api.nvim_win_get_cursor(0)[1]
      -- - [ ] を - [x] に変換
      if line:match("^%s*-%s%[ %]") then
        local new_line = line:gsub("^(%s*-%s)%[ %]", "%1[x]")
        vim.api.nvim_buf_set_lines(0, row - 1, row, false, { new_line })
        return
      end
      -- - [x] を - [ ] に変換
      if line:match("^%s*-%s%[x%]") then
        local new_line = line:gsub("^(%s*-%s)%[x%]", "%1[ ]")
        vim.api.nvim_buf_set_lines(0, row - 1, row, false, { new_line })
        return
      end
      -- 普通のテキストを - [ ] に変換
      if line:match("%S") then
        local indent = line:match("^(%s*)")
        local content = line:match("^%s*(.+)")
        local new_line = indent .. "- [ ] " .. content
        vim.api.nvim_buf_set_lines(0, row - 1, row, false, { new_line })
        return
      end
    end, { buffer = true, desc = "Toggle markdown checkbox" })
  end,
})
