local M = {}

-- VSCode light theme
-- Colors mapped from VSCode's light theme to calm's 43-color structure
function M.load()
  return {
    palette = {
      bg = "#FFFFFF",
      bg_alt = "#CECECE",
      fg = "#343434",
      fg_light = "#000000",
      fg_dim = "#098658",
      fg_muted = "#868686",
      border = "#DDDDDD",
      float_border = "#EEEEEE",
      comment = "#008000",
      cursor_line = "#E5E5E5",
      cursor_line_border = "#6F6F6F",
      selection = "#ADD6FF",
      selection_inactive = "#D2D2D2",
      menu = "#F8F8F8",
      glyph = "#767676",
      diag_error = "#FF0000",
      diag_warn = "#800000",
      diag_info = "#0000FF",
      diag_hint = "#16825D",
      diff_add = "#DBE6C2",
      diff_delete = "#FFCCCC",
      diff_change = "#FFA3A3",
      git_add = "#587c0c",
      git_change = "#895503",
      git_delete = "#ad0707",
      git_ignore = "#8e8e90",

      black = "#FFFFFF",
      red = "#FF0000",
      orange = "#C72E0F",
      yellow = "#795E26",
      green = "#098658",
      cyan = "#16825D",
      blue = "#0000FF",
      magenta = "#AF00DB",
      purple = "#000080",
      rust = "#A31515",
    },
    highlights_name = "default",
  }
end

return M
