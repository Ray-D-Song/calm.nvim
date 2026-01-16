local M = {}

-- Pygments Default Style theme
-- Colors inspired by Pygments default highlighting style (Emacs 22)
function M.load()
  return {
    -- Background and foreground
    bg = "#f8f8f8",           -- Pygments default background
    bg_alt = "#e8e8e8",       -- Slightly darker for UI elements
    fg = "#000000",           -- Default text color
    fg_light = "#000000",     -- Pure black for emphasis
    fg_dim = "#666666",       -- Operators and numbers
    fg_muted = "#717171",     -- Muted text (like entities)

    -- UI elements
    border = "#bbbbbb",       -- Whitespace color
    float_border = "#cccccc",
    comment = "#3D7B7B",      -- Teal comment color
    cursor_line = "#eeeeee",
    cursor_line_border = "#bbbbbb",
    selection = "#d0d0ff",    -- Light blue selection
    selection_inactive = "#e0e0e0",
    menu = "#ffffff",
    glyph = "#717171",

    -- Diagnostics
    diag_error = "#E40000",   -- Generic error red
    diag_warn = "#9C6500",    -- Preprocessor orange-brown
    diag_info = "#0000FF",    -- Function/class blue
    diag_hint = "#3D7B7B",    -- Comment teal

    -- Diffs
    diff_add = "#e0f2e0",
    diff_delete = "#ffe0e0",
    diff_change = "#ffffd0",

    -- Git
    git_add = "#008400",      -- Generic inserted green
    git_change = "#AA5D1F",   -- String escape orange
    git_delete = "#A00000",   -- Generic deleted red
    git_ignore = "#bbbbbb",

    -- Core colors (based on Pygments token colors)
    black = "#000000",
    red = "#BA2121",          -- String red
    orange = "#AA5D1F",       -- String escape orange
    yellow = "#767600",       -- Label yellow/olive
    green = "#008000",        -- Keyword/builtin green
    cyan = "#3D7B7B",         -- Comment teal
    blue = "#0000FF",         -- Function/class blue
    magenta = "#AA22FF",      -- Operator.Word/Decorator magenta
    purple = "#19177C",       -- Variable/Symbol deep purple
    rust = "#B00040",         -- Keyword.Type dark red
  }
end

return M
