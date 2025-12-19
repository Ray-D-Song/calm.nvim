local M = {}

-- VSCode dark theme
-- Colors mapped from VSCode's dark theme to calm's 43-color structure
function M.load()
  return {
    bg = "#1F1F1F",
    bg_alt = "#1F1F1F",
    fg = "#D4D4D4",
    fg_light = "#BBBBBB",
    fg_dim = "#5A5A5A",
    fg_muted = "#6A6A6A",
    border = "#444444",
    float_border = "#898989",
    comment = "#6A9955",
    cursor_line = "#222222",
    cursor_line_border = "#51504F",
    selection = "#264F78",
    selection_inactive = "#404040",
    menu = "#202020",
    glyph = "#AEAFAD",
    diag_error = "#F44747",
    diag_warn = "#D7BA7D",
    diag_info = "#569CD6",
    diag_hint = "#4EC9B0",
    diff_add = "#373D29",
    diff_delete = "#4B1818",
    diff_change = "#6F1313",
    git_add = "#81b88b",
    git_change = "#e2c08d",
    git_delete = "#c74e39",
    git_ignore = "#8c8c8c",

    black = "#1F1F1F",
    red = "#F44747",
    orange = "#CE9178",
    yellow = "#DCDCAA",
    green = "#B5CEA8",
    cyan = "#4EC9B0",
    blue = "#569CD6",
    magenta = "#C586C0",
    purple = "#646695",
    rust = "#D16969",
  }
end

return M
