local M = {}

-- Tomorrow (Pygments) dark theme
-- Palette mirrors the Tomorrow (Pygments) dark theme. A few alpha-based accents from
-- the upstream CSS are manually blended so the Neovim highlights stay fully opaque.
function M.load()
  return {
    palette = {
      bg = "#1d1f21",
      bg_alt = "#191b1d",
      fg = "#c5c8c6",
      fg_light = "#f0f0f0",
      fg_dim = "#616264", -- rgba(255, 255, 255, 0.3) over #1d1f21
      fg_muted = "#7f8284",
      border = "#666666",
      float_border = "#808080",
      comment = "#969896",
      cursor_line = "#282a2e",
      cursor_line_border = "#373b41",
      selection = "#373b41",
      selection_inactive = "#303234",
      menu = "#191b1d",
      glyph = "#b5b8b6",
      diag_error = "#cc6666",
      diag_warn = "#de935f",
      diag_info = "#81a2be",
      diag_hint = "#b294bb",
      diff_add = "#233726",
      diff_delete = "#4b2526",
      diff_change = "#2f343f",
      git_add = "#288f2a",
      git_change = "#f0c674",
      git_delete = "#cc6666",
      git_ignore = "#969896",

      black = "#141516",
      red = "#cc6666",
      orange = "#de935f",
      yellow = "#f0c674",
      green = "#b5bd68",
      cyan = "#8abeb7",
      blue = "#81a2be",
      magenta = "#b294bb",
      purple = "#85678f",
      rust = "#a3685a",
    },
    highlights_name = "default",
  }
end

return M
