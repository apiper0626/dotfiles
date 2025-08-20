-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- 自定义配置
config = {
    color_scheme = "Catppuccin Frappe",
    font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Medium", italic = false }),
    font_size = 18,
    default_cursor_style = "BlinkingBar",
    cursor_blink_rate = 800,
    window_padding = {
        left = "1cell",
        right = "1cell",
        top = "0.5cell",
        bottom = "0.5cell",
    },
    max_fps = 60,
    animation_fps = 60,
    front_end = "WebGpu",
    prefer_egl = true,
    enable_tab_bar = true,
    window_decorations = "RESIZE",
    window_close_confirmation = "NeverPrompt",
    automatically_reload_config = true,
    audible_bell = "Disabled",
    adjust_window_size_when_changing_font_size = false,
    enable_scroll_bar = false,
    harfbuzz_features = { "calt=0" },
    default_prog = { "pwsh.exe" },
    launch_menu = {
        { label = "PowerShell 7",       args = { "pwsh.exe" } },
        { label = "Git Bash",           args = { "C:\\Program Files\\Git\\bin\\bash.exe", "-l" } },
        { label = "Windows PowerShell", args = { "powershell.exe" } },
        { label = "CMD",                args = { "cmd.exe" } },
    },
    mouse_bindings = {
        {
            event = { Down = { streak = 1, button = "Right" } },
            mods = "NONE",
            action = wezterm.action.PasteFrom("Clipboard"),
        },
        { event = { Down = { streak = 1, button = "Right" } }, mods = "CTRL", action = wezterm.action.ShowLauncher },
        {
            event = { Up = { streak = 1, button = "Left" } },
            mods = "NONE",
            action = wezterm.action.CompleteSelection("ClipboardAndPrimarySelection"),
        },
        {
            event = { Down = { streak = 1, button = "Middle" } },
            mods = "NONE",
            action = wezterm.action.PasteFrom("PrimarySelection"),
        },
        -- 添加 Ctrl + 左键点击打开链接
        {
            event = { Up = { streak = 1, button = "Left" } },
            mods = "CTRL",
            action = wezterm.action.OpenLinkAtMouseCursor,
        },
    },
    leader = {
        key = "a",
        mods = "CTRL",
        timeout_milliseconds = 1000,
    },
    keys = {
        -- 新建 tab
        {
            key = "c",
            mods = "LEADER",
            action = wezterm.action.SpawnTab("CurrentPaneDomain"),
        },
        -- 关闭当前 tab
        {
            key = "X",
            mods = "LEADER",
            action = wezterm.action.CloseCurrentTab({ confirm = true }),
        },

        -- 下一个 tab / 上一个 tab
        {
            key = "n",
            mods = "LEADER",
            action = wezterm.action.ActivateTabRelative(1),
        },
        {
            key = "p",
            mods = "LEADER",
            action = wezterm.action.ActivateTabRelative(-1),
        },
        {
            key = '"',
            mods = "LEADER|SHIFT",
            action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
        },
        {
            key = ":",
            mods = "LEADER",
            action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
        },
        -- 窗格导航（方向键风格）
        { key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
        { key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
        { key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
        { key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
        -- 关闭当前窗格
        {
            key = "x",
            mods = "LEADER",
            action = wezterm.action.CloseCurrentPane({ confirm = true }),
        },
    },
}

wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

return config
