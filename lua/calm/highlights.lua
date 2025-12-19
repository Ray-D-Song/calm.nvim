local M = {}

local function background(palette, opts)
  if opts.transparent then
    return "NONE"
  end
  return palette.bg
end

local function float_background(palette, opts)
  if opts.transparent then
    return "NONE"
  end
  return palette.bg_alt
end

---@param palette table The color palette
---@param opts table Configuration options
---@return table
function M.build(palette, opts)
  opts = opts or {}

  local bg = background(palette, opts)
  local float_bg = float_background(palette, opts)

  return {
    Normal = { fg = palette.fg, bg = bg },
    NormalNC = { fg = palette.fg, bg = bg },
    NormalFloat = { fg = palette.fg, bg = float_bg },
    FloatBorder = { fg = palette.float_border, bg = float_bg },
    FloatTitle = { fg = palette.blue, bg = float_bg, bold = true },
    ColorColumn = { bg = palette.cursor_line },
    Conceal = { fg = palette.fg_dim },
    Cursor = { fg = palette.bg, bg = palette.fg_light },
    CursorIM = { link = "Cursor" },
    CursorColumn = { bg = palette.cursor_line },
    CursorLine = { bg = palette.cursor_line },
    CursorLineNr = { fg = palette.fg_light, bg = palette.cursor_line, bold = true },
    DiffAdd = { bg = palette.diff_add },
    DiffChange = { bg = palette.diff_change },
    DiffDelete = { bg = palette.diff_delete },
    DiffText = { bg = palette.selection },
    Directory = { fg = palette.blue },
    EndOfBuffer = { fg = palette.bg },
    ErrorMsg = { fg = palette.red, bold = true },
    WarningMsg = { fg = palette.orange },
    MoreMsg = { fg = palette.green },
    IncSearch = { fg = palette.bg, bg = palette.magenta, bold = true },
    Search = { fg = palette.bg, bg = palette.yellow },
    Substitute = { fg = palette.bg, bg = palette.magenta },
    LineNr = { fg = palette.fg_dim },
    LineNrAbove = { fg = palette.fg_dim },
    LineNrBelow = { fg = palette.fg_dim },
    MatchParen = { fg = palette.magenta, underline = true, bold = true },
    Folded = { fg = palette.cyan, bg = palette.cursor_line },
    FoldColumn = { fg = palette.fg_dim, bg = bg },
    SignColumn = { fg = palette.fg_dim, bg = bg },
    SignColumnSB = { fg = palette.fg_dim, bg = palette.bg_alt },
    NonText = { fg = palette.border },
    SpecialKey = { fg = palette.cyan },
    Pmenu = { fg = palette.fg, bg = palette.menu },
    PmenuSel = { fg = palette.fg_light, bg = palette.selection },
    PmenuSbar = { bg = palette.cursor_line },
    PmenuThumb = { bg = palette.float_border },
    Question = { fg = palette.blue },
    QuickFixLine = { fg = palette.fg_light, bg = palette.selection_inactive },
    StatusLine = { fg = palette.fg, bg = palette.bg_alt },
    StatusLineNC = { fg = palette.fg_dim, bg = palette.bg },
    StatusLineTerm = { link = "StatusLine" },
    StatusLineTermNC = { link = "StatusLineNC" },
    TabLine = { fg = palette.fg_dim, bg = palette.bg_alt },
    TabLineSel = { fg = palette.fg_light, bg = palette.bg },
    TabLineFill = { fg = palette.fg_muted, bg = palette.bg },
    Title = { fg = palette.blue, bold = true },
    Visual = { bg = palette.selection },
    VisualNOS = { bg = palette.selection_inactive },
    Ellipsis = { fg = palette.cyan },
    CursorLineFold = { link = "FoldColumn" },
    CursorLineSign = { fg = palette.cyan, bg = palette.cursor_line },
    WinSeparator = { fg = palette.border, bg = bg },
    VertSplit = { link = "WinSeparator" },
    WinBar = { fg = palette.fg, bg = bg, bold = true },
    WinBarNC = { fg = palette.fg_dim, bg = bg },
    NormalSB = { fg = palette.fg, bg = palette.bg_alt },
    NormalFloatBorder = { link = "FloatBorder" },
    MsgSeparator = { fg = palette.border },
    Whitespace = { fg = palette.border },
    WildMenu = { fg = palette.bg, bg = palette.blue, bold = true },

    -- Diagnostics
    DiagnosticError = { fg = palette.diag_error },
    DiagnosticWarn = { fg = palette.diag_warn },
    DiagnosticInfo = { fg = palette.diag_info },
    DiagnosticHint = { fg = palette.diag_hint },
    DiagnosticOk = { fg = palette.green },
    DiagnosticSignError = { fg = palette.diag_error, bg = bg },
    DiagnosticSignWarn = { fg = palette.diag_warn, bg = bg },
    DiagnosticSignInfo = { fg = palette.diag_info, bg = bg },
    DiagnosticSignHint = { fg = palette.diag_hint, bg = bg },
    DiagnosticSignOk = { fg = palette.green, bg = bg },
    DiagnosticVirtualTextError = { fg = palette.diag_error, bg = palette.diff_delete },
    DiagnosticVirtualTextWarn = { fg = palette.diag_warn, bg = palette.diff_change },
    DiagnosticVirtualTextInfo = { fg = palette.diag_info, bg = palette.diff_change },
    DiagnosticVirtualTextHint = { fg = palette.diag_hint, bg = palette.cursor_line },
    DiagnosticUnderlineError = { undercurl = true, sp = palette.diag_error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = palette.diag_warn },
    DiagnosticUnderlineInfo = { undercurl = true, sp = palette.diag_info },
    DiagnosticUnderlineHint = { undercurl = true, sp = palette.diag_hint },

    -- Diffs & Git
    DiffAdded = { fg = palette.git_add },
    DiffRemoved = { fg = palette.git_delete },
    DiffChanged = { fg = palette.git_change },
    GitSignsAdd = { fg = palette.git_add },
    GitSignsChange = { fg = palette.git_change },
    GitSignsDelete = { fg = palette.git_delete },

    -- LSP
    LspReferenceText = { bg = palette.cursor_line },
    LspReferenceRead = { bg = palette.cursor_line },
    LspReferenceWrite = { bg = palette.selection },
    LspSignatureActiveParameter = { fg = palette.yellow, bg = palette.cursor_line, bold = true },
    LspCodeLens = { fg = palette.fg_dim },

    -- Treesitter / Semantic tokens
    ["@comment"] = { link = "Comment" },
    ["@comment.documentation"] = { link = "Comment" },
    ["@error"] = { link = "Error" },
    ["@none"] = { fg = palette.fg },
    ["@preproc"] = { link = "PreProc" },
    ["@punctuation"] = { fg = palette.fg },
    ["@punctuation.bracket"] = { fg = palette.fg },
    ["@punctuation.delimiter"] = { fg = palette.fg },
    ["@punctuation.special"] = { fg = palette.cyan },

    ["@constant"] = { fg = palette.orange },
    ["@constant.builtin"] = { fg = palette.orange },
    ["@constant.macro"] = { fg = palette.orange },
    ["@string"] = { fg = palette.green },
    ["@string.regexp"] = { fg = palette.cyan },
    ["@string.special"] = { fg = palette.cyan },
    ["@string.escape"] = { fg = palette.cyan },
    ["@character"] = { fg = palette.green },
    ["@number"] = { fg = palette.orange },
    ["@boolean"] = { fg = palette.orange },
    ["@float"] = { fg = palette.orange },

    ["@symbol"] = { fg = palette.cyan },

    ["@function"] = { fg = palette.blue },
    ["@function.builtin"] = { fg = palette.cyan },
    ["@function.call"] = { fg = palette.blue },
    ["@function.macro"] = { fg = palette.cyan },
    ["@method"] = { fg = palette.blue },
    ["@method.call"] = { fg = palette.blue },
    ["@constructor"] = { fg = palette.yellow },

    ["@parameter"] = { fg = palette.fg },
    ["@parameter.reference"] = { fg = palette.fg },
    ["@field"] = { fg = palette.fg },
    ["@property"] = { fg = palette.fg },
    ["@variable"] = { fg = palette.fg },
    ["@variable.builtin"] = { fg = palette.yellow, italic = true },
    ["@variable.member"] = { fg = palette.fg },
    ["@variable.parameter"] = { fg = palette.fg },
    ["@variable.constant"] = { fg = palette.orange },

    ["@keyword"] = { fg = palette.magenta },
    ["@keyword.function"] = { fg = palette.magenta, italic = true },
    ["@keyword.operator"] = { fg = palette.cyan },
    ["@keyword.return"] = { fg = palette.magenta },
    ["@conditional"] = { fg = palette.magenta },
    ["@repeat"] = { fg = palette.magenta },
    ["@label"] = { fg = palette.cyan },
    ["@operator"] = { fg = palette.cyan },
    ["@exception"] = { fg = palette.red },

    ["@type"] = { fg = palette.yellow },
    ["@type.builtin"] = { fg = palette.yellow },
    ["@type.qualifier"] = { fg = palette.magenta },
    ["@type.definition"] = { fg = palette.yellow },
    ["@storageclass"] = { fg = palette.yellow },
    ["@attribute"] = { fg = palette.cyan },
    ["@namespace"] = { fg = palette.yellow },

    ["@struct"] = { fg = palette.yellow },
    ["@enum"] = { fg = palette.yellow },
    ["@enumMember"] = { fg = palette.cyan },

    ["@text"] = { fg = palette.fg },
    ["@text.strong"] = { bold = true },
    ["@text.emphasis"] = { italic = true },
    ["@text.underline"] = { underline = true },
    ["@text.strike"] = { strikethrough = true },
    ["@text.title"] = { fg = palette.fg, bold = true },
    ["@text.literal"] = { fg = palette.green },
    ["@text.uri"] = { fg = palette.blue, underline = true },
    ["@text.todo"] = { fg = palette.blue, bg = palette.cursor_line, bold = true },
    ["@markup.link"] = { fg = palette.blue, underline = true },
    ["@markup.list"] = { fg = palette.red },
    ["@markup.heading"] = { fg = palette.red, bold = true },
    ["@markup.raw"] = { fg = palette.green },
    ["@markup.quote"] = { fg = palette.comment, italic = true },

    -- Traditional highlight groups
    Comment = { fg = palette.comment, italic = true },
    Constant = { fg = palette.orange },
    String = { fg = palette.green },
    Character = { fg = palette.green },
    Number = { fg = palette.orange },
    Boolean = { fg = palette.orange },
    Float = { fg = palette.orange },
    Identifier = { fg = palette.fg },
    Function = { fg = palette.blue },
    Statement = { fg = palette.magenta },
    Conditional = { fg = palette.magenta },
    Repeat = { fg = palette.magenta },
    Label = { fg = palette.cyan },
    Operator = { fg = palette.cyan },
    Keyword = { fg = palette.magenta },
    Exception = { fg = palette.red },
    PreProc = { fg = palette.cyan },
    Include = { fg = palette.blue },
    Define = { fg = palette.cyan },
    Macro = { fg = palette.cyan },
    PreCondit = { fg = palette.magenta },
    Type = { fg = palette.yellow },
    StorageClass = { fg = palette.yellow },
    Structure = { fg = palette.yellow },
    Typedef = { fg = palette.yellow },
    Special = { fg = palette.cyan },
    SpecialComment = { fg = palette.comment, italic = true },
    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Error = { fg = palette.bg, bg = palette.red },
    Todo = { fg = palette.blue, bg = palette.cursor_line, bold = true },

    -- UI plugins
    TelescopeNormal = { fg = palette.fg, bg = palette.menu },
    TelescopeBorder = { fg = palette.float_border, bg = palette.menu },
    TelescopeTitle = { fg = palette.blue, bold = true },
    TelescopeSelection = { fg = palette.fg_light, bg = palette.selection },
    TelescopeMatching = { fg = palette.magenta, bold = true },

    NvimTreeNormal = { fg = palette.fg, bg = palette.bg_alt },
    NvimTreeCursorLine = { bg = palette.cursor_line },
    NvimTreeIndentMarker = { fg = palette.border },
    NvimTreeFolderIcon = { fg = palette.blue },

    LazyNormal = { fg = palette.fg, bg = palette.menu },
    LazyTitle = { fg = palette.blue, bold = true },

    WhichKey = { fg = palette.magenta },
    WhichKeyGroup = { fg = palette.blue },
    WhichKeySeparator = { fg = palette.fg_dim },
    WhichKeyDesc = { fg = palette.cyan },
    WhichKeyFloat = { bg = palette.menu },

    NoiceCmdline = { fg = palette.fg_light, bg = palette.menu },
    NoiceCmdlineIcon = { fg = palette.magenta },
    NoiceCmdlinePopup = { fg = palette.fg, bg = palette.menu },
    NoicePopupBorder = { fg = palette.float_border },

    CmpItemAbbr = { fg = palette.fg },
    CmpItemAbbrDeprecated = { fg = palette.comment, strikethrough = true },
    CmpItemAbbrMatch = { fg = palette.magenta, bold = true },
    CmpItemKind = { fg = palette.cyan },
    CmpItemMenu = { fg = palette.fg_dim },

    -- Terminal
    TermCursor = { fg = palette.bg, bg = palette.fg_light },
    TermCursorNC = { fg = palette.bg, bg = palette.fg_dim },
  }
end

return M
