local M = {}

function M.apply_highlights(highlights)
  local set_hl = vim.api.nvim_set_hl

  for group, spec in pairs(highlights) do
    if spec.link then
      set_hl(0, group, { link = spec.link })
    else
      local hl = {}
      for key, value in pairs(spec) do
        if key == "style" and type(value) == "table" then
          for _, style in ipairs(value) do
            hl[style] = true
          end
        else
          hl[key] = value
        end
      end
      set_hl(0, group, hl)
    end
  end
end

function M.extend(options, overrides)
  if not overrides or vim.tbl_isempty(overrides) then
    return options
  end
  return vim.tbl_deep_extend("force", options, overrides)
end

return M
