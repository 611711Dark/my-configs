local wezterm = require 'wezterm'

return {
    -- 字体配置（保持原版优化）
    font = wezterm.font_with_fallback({
        { family = "JetBrains Mono", harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' } },
        "Noto Sans CJK SC",
        "Symbols Nerd Font Mono"
    }),
    font_size = 14.0,
    warn_about_missing_glyphs = false,
    freetype_load_target = "Light",
    freetype_render_target = "HorizontalLcd",

    -- 颜色主题（保持原版优化)Dark Pastel;Tokyo Night;Eldritch;Dark Violet (base16)"
    color_scheme = "Dark Pastel",
    colors = {
        background  = "2e3440", -- 保留光标颜色优化
    },

    -- 窗口设置（保持原版优化）
    initial_cols = 80,
    initial_rows = 24,
    window_padding = { left = 2, right = 2, top = 1, bottom = 1 },
    window_background_opacity = 0.85,
    macos_window_background_blur = 20,
    use_ime = true,

    -- 标签栏（保持原版设置）
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,

    -- 完全保留原始按键配置
    keys = {
        -- 1. 切换单个窗格最大化 (新添加)
        { key = "Enter", mods = "ALT", action = wezterm.action.TogglePaneZoomState },
        
        -- 窗口全屏切换
        { key = "Enter", mods = "SHIFT|CTRL", action = wezterm.action.ToggleFullScreen },
        
        -- 标签操作
        { key = "t", mods = "CTRL", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
        { key = "w", mods = "CTRL", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
        { key = "PageUp", mods = "ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
        { key = "PageDown", mods = "ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },

        -- 窗格调整（原版方向键方案）
        { key = "LeftArrow",  mods = "SHIFT|CTRL", action = wezterm.action.AdjustPaneSize{ "Left", 3 } },
        { key = "RightArrow", mods = "SHIFT|CTRL", action = wezterm.action.AdjustPaneSize{ "Right", 3 } },
        { key = "UpArrow",    mods = "SHIFT|CTRL", action = wezterm.action.AdjustPaneSize{ "Up", 3 } },
        { key = "DownArrow",  mods = "SHIFT|CTRL", action = wezterm.action.AdjustPaneSize{ "Down", 3 } },

        -- 窗口分割（原版快捷键）
        { key = "j", mods = "SHIFT|CTRL", action = wezterm.action.SplitHorizontal{ domain = "CurrentPaneDomain" } },
        { key = "h", mods = "SHIFT|CTRL", action = wezterm.action.SplitVertical{ domain = "CurrentPaneDomain" } },

        -- 窗格关闭
        { key = "w", mods = "SHIFT|CTRL", action = wezterm.action.CloseCurrentPane{ confirm = true } },

        -- 窗格导航（原版ALT+方向键）
        { key = "LeftArrow",  mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
        { key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
        { key = "UpArrow",    mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
        { key = "DownArrow",  mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },
    },

    -- 其他优化保留
    default_cursor_style = "BlinkingBar",
    cursor_blink_rate = 500,
    enable_kitty_keyboard = true,
    check_for_updates = false,
    automatically_reload_config = true,
}
