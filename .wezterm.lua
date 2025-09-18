local wezterm = require 'wezterm'

return {
    -- プログラム設定
    default_prog = { "wsl.exe", "~" },
    
    -- フォント設定
    font = wezterm.font("JetBrainsMono Nerd Font"),
    font_size = 13.0,
    use_ime = true,
    
    -- ウィンドウ設定
    window_background_opacity = 0.9,
    -- win32_system_backdrop = "Mica",
    color_scheme = "catppuccin-mocha",
    window_close_confirmation = "NeverPrompt",
    window_decorations = "RESIZE",
    
    -- タブバー設定
    hide_tab_bar_if_only_one_tab = false,
    use_fancy_tab_bar = true,
    show_new_tab_button_in_tab_bar = false,
    -- show_close_tab_button_in_tabs = false,
    
    -- ウィンドウフレーム設定
    window_frame = {
        active_titlebar_bg = "none",     -- catppuccin-mocha base
        inactive_titlebar_bg = "none",   -- 同じ色で違和感なくす
    },
    
    -- 背景グラデーション
    window_background_gradient = {
        colors = { "#1e1e2e" },
    },
    
    -- カラー設定
    colors = {
        tab_bar = {
            background = "rgba(30, 30, 46, 0.0)",    -- 背景透明 (#1e1e2e を 0%透過)
            
            active_tab = {
                bg_color = "rgba(30, 30, 46, 0.0)",  -- アクティブタブ背景
                fg_color = "#94e2d5",                -- アクティブタブ文字色
            },
            
            inactive_tab = {
                bg_color = "rgba(30, 30, 46, 0.0)",  -- 非アクティブタブ背景
                fg_color = "#a6adc8",                -- 非アクティブタブ文字色 (subtext0)
            },
            
            inactive_tab_hover = {
                bg_color = "rgba(30, 30, 46, 0.8)",  -- ホバー時
                fg_color = "#f5e0dc",                -- Catppuccin pink
            },
            
            new_tab = {
                bg_color = "rgba(30, 30, 46, 0.0)",
                fg_color = "#89b4fa",                -- Catppuccin blue
            },
            
            new_tab_hover = {
                bg_color = "rgba(30, 30, 46, 0.8)",
                fg_color = "#f5c2e7",                -- Catppuccin pink
            },
        },
    },
}