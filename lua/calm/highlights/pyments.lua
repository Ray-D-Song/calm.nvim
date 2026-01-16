-- Pygments Default Style Highlights
-- Matches the Pygments default highlighting style (Emacs 22)
-- Reference: pygments.styles.default.DefaultStyle

local default = require("calm.highlights.default")

local M = {}

function M.build(palette, opts)
  -- Start with default highlights
  local groups = default.build(palette, opts)

  -- Override with Pygments-specific styling
  -- Comments
  groups.Comment = { fg = palette.comment, italic = true }
  groups.SpecialComment = { fg = palette.comment, italic = true }

  -- Keywords (bold green)
  groups.Keyword = { fg = palette.keyword_green, bold = true }
  groups.Statement = { fg = palette.keyword_green, bold = true }
  groups.Conditional = { fg = palette.keyword_green, bold = true }
  groups.Repeat = { fg = palette.keyword_green, bold = true }

  -- Keyword.Type (nobold, different color)
  groups.Type = { fg = palette.keyword_type }
  groups.StorageClass = { fg = palette.keyword_type }
  groups.Structure = { fg = palette.keyword_type }
  groups.Typedef = { fg = palette.keyword_type }

  -- Operators (gray, not cyan like default)
  groups.Operator = { fg = palette.fg_dim }

  -- Names
  groups.Function = { fg = palette.name_function }
  groups.Identifier = { fg = palette.purple } -- Name.Variable

  -- Constants
  groups.Constant = { fg = palette.name_constant }
  groups.Number = { fg = palette.fg_dim }
  groups.Boolean = { fg = palette.fg_dim }
  groups.Float = { fg = palette.fg_dim }

  -- Strings (red)
  groups.String = { fg = palette.red }
  groups.Character = { fg = palette.red }

  -- Special/Builtins
  groups.Special = { fg = palette.name_builtin }
  groups.Label = { fg = palette.name_label }

  -- PreProc (noitalic, different from comments)
  groups.PreProc = { fg = palette.preproc }
  groups.Include = { fg = palette.preproc }
  groups.Define = { fg = palette.preproc }
  groups.Macro = { fg = palette.preproc }
  groups.PreCondit = { fg = palette.preproc }

  -- Exception (bold)
  groups.Exception = { fg = palette.name_exception, bold = true }

  -- Delimiters
  groups.Delimiter = { fg = palette.fg }

  -- Error (border style)
  groups.Error = { fg = palette.diag_error, underline = true }

  -- LSP Semantic Tokens - Pygments style
  groups["@lsp.type.class"] = { fg = palette.name_class, bold = true }
  groups["@lsp.type.namespace"] = { fg = palette.name_class, bold = true }
  groups["@lsp.type.decorator"] = { fg = palette.name_decorator }
  groups["@lsp.type.function"] = { fg = palette.name_function }
  groups["@lsp.type.method"] = { fg = palette.name_function }
  groups["@lsp.type.variable"] = { fg = palette.purple }
  groups["@lsp.type.parameter"] = { fg = palette.purple }
  groups["@lsp.type.property"] = { fg = palette.name_attribute }
  groups["@lsp.type.enumMember"] = { fg = palette.name_constant }
  groups["@lsp.type.type"] = { fg = palette.keyword_type }
  groups["@lsp.type.typeParameter"] = { fg = palette.keyword_type }
  groups["@lsp.type.operator"] = { fg = palette.fg_dim }
  groups["@lsp.mod.readonly"] = { fg = palette.name_constant }
  groups["@lsp.typemod.variable.defaultLibrary"] = { fg = palette.name_builtin }
  groups["@lsp.typemod.function.defaultLibrary"] = { fg = palette.name_builtin }

  -- TreeSitter groups (if used)
  groups["@keyword"] = { fg = palette.keyword_green, bold = true }
  groups["@keyword.function"] = { fg = palette.keyword_green, bold = true }
  groups["@keyword.operator"] = { fg = palette.operator_word, bold = true }
  groups["@keyword.return"] = { fg = palette.keyword_green, bold = true }
  groups["@keyword.conditional"] = { fg = palette.keyword_green, bold = true }
  groups["@keyword.repeat"] = { fg = palette.keyword_green, bold = true }
  groups["@type"] = { fg = palette.keyword_type }
  groups["@type.builtin"] = { fg = palette.keyword_type }
  groups["@function"] = { fg = palette.name_function }
  groups["@function.builtin"] = { fg = palette.name_builtin }
  groups["@method"] = { fg = palette.name_function }
  groups["@variable"] = { fg = palette.purple }
  groups["@variable.builtin"] = { fg = palette.name_builtin }
  groups["@parameter"] = { fg = palette.purple }
  groups["@property"] = { fg = palette.name_attribute }
  groups["@constant"] = { fg = palette.name_constant }
  groups["@constant.builtin"] = { fg = palette.name_constant }
  groups["@string"] = { fg = palette.red }
  groups["@string.regex"] = { fg = palette.string_regex }
  groups["@string.escape"] = { fg = palette.orange, bold = true }
  groups["@character"] = { fg = palette.red }
  groups["@number"] = { fg = palette.fg_dim }
  groups["@boolean"] = { fg = palette.fg_dim }
  groups["@operator"] = { fg = palette.fg_dim }
  groups["@comment"] = { fg = palette.comment, italic = true }
  groups["@exception"] = { fg = palette.name_exception, bold = true }
  groups["@label"] = { fg = palette.name_label }
  groups["@tag"] = { fg = palette.name_tag, bold = true }
  groups["@tag.attribute"] = { fg = palette.name_attribute }
  groups["@tag.delimiter"] = { fg = palette.fg }
  groups["@namespace"] = { fg = palette.name_class, bold = true }
  groups["@constructor"] = { fg = palette.name_class, bold = true }

  -- Markdown/Documentation specific
  groups["@text.strong"] = { bold = true }
  groups["@text.emphasis"] = { italic = true }
  groups["@text.title"] = { fg = palette.generic_heading, bold = true }

  return groups
end

return M
