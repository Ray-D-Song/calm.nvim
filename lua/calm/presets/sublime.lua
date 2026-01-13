local M = {}

-- Sublime Text theme (based on nvim-juliana)
-- Colors inspired by the classic Sublime Text Mariana/Monokai color schemes
function M.load()
  return {
    -- Background and foreground
    bg = "#303841",
    bg_alt = "#2e353e",
    fg = "#d8dee9",
    fg_light = "#ffffff",
    fg_dim = "#46525c",
    fg_muted = "#a6acb9",

    -- UI elements
    border = "#46525c",
    float_border = "#a6acb9",
    comment = "#a6acb9",
    cursor_line = "#3f4750",
    cursor_line_border = "#46525c",
    selection = "#3f4750",
    selection_inactive = "#373f48",
    menu = "#2e353e",
    glyph = "#a6acb9",

    -- Diagnostics
    diag_error = "#c76b70",
    diag_warn = "#fac761",
    diag_info = "#5c99d6",
    diag_hint = "#5fb4b4",

    -- Diffs
    diff_add = "#41525a",
    diff_delete = "#4f434a",
    diff_change = "#585249",

    -- Git
    git_add = "#99c794",
    git_change = "#f9ae58",
    git_delete = "#ec5f66",
    git_ignore = "#6a6a6a",

    -- Core colors
    black = "#303841",
    red = "#ec5f66",
    orange = "#f97b58",
    yellow = "#f9ae58",
    green = "#99c794",
    cyan = "#5fb4b4",
    blue = "#5c99d6",
    magenta = "#c695c6",
    purple = "#95b2d6",
    rust = "#c76b70",
  }
end

return M
