local M = {}

-- Palette approximates GitLab's "Dark Grey" editor scheme. Alpha-based colors from
-- the upstream theme are blended against the base background (#222222) to make them
-- usable inside Neovim highlights, which expect opaque hex values.
M.colors = {
  bg = "#222222",
  bg_alt = "#222024",
  fg = "#b2b2b2", -- #ffffffa6 over #222222
  fg_light = "#ffffff",
  fg_dim = "#868686", -- #ffffff73 over #222222
  fg_muted = "#5a5a5a", -- #ffffff40 over #222222
  border = "#4e4e4e", -- #ffffff33 over #222222
  float_border = "#5a5a5a",
  comment = "#868686",
  cursor_line = "#29282c", -- #ad95e90d over #222222
  cursor_line_border = "#424242", -- #FFFFFF25 over #222222
  selection = "#393442", -- #ad95e929 over #222222
  selection_inactive = "#3b3745", -- #bfa5fc29 over #222222
  menu = "#222024",
  glyph = "#a7a7a7", -- #ffffff99 over #222222
  diag_error = "#f7998a",
  diag_warn = "#e0a855",
  diag_info = "#7fb6ed",
  diag_hint = "#bfa5fc",
  diff_add = "#2a322d", -- #6dc38f1a over #222222
  diff_delete = "#382e2d", -- #f7998a1a over #222222
  diff_change = "#272a2c", -- #7fb6ed0d over #222222
  git_add = "#6dc38f",
  git_change = "#eac079",
  git_delete = "#f7998a",
  git_ignore = "#5a5a5a",

  black = "#171717", -- #00000050 over #222222
  red = "#f7998a",
  orange = "#e0a855",
  yellow = "#eac079",
  green = "#6dc38f",
  cyan = "#32c5d2",
  blue = "#7fb6ed",
  magenta = "#bfa5fc",
  purple = "#6342b5",
  rust = "#9b3912",
}

return M
