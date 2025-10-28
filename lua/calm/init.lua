local util = require("calm.util")
local highlight_builder = require("calm.highlights")
local palette = require("calm.palette").colors

local M = {}

local defaults = {
  transparent = false,
  highlights = nil, -- table or function returning a table of extra highlight definitions
}

local user_config = vim.deepcopy(defaults)

local function resolve_config(opts)
  if not opts or vim.tbl_isempty(opts) then
    return vim.deepcopy(user_config)
  end
  return util.extend(vim.deepcopy(user_config), opts)
end

local function normalize_overrides(overrides)
  if type(overrides) == "function" then
    return overrides(palette)
  end
  return overrides
end

local function apply_highlights(config)
  local groups = highlight_builder.build(config)
  local overrides = normalize_overrides(config.highlights)

  if type(overrides) == "table" then
    for group, spec in pairs(overrides) do
      groups[group] = spec
    end
  end

  util.apply_highlights(groups)
end

function M.setup(opts)
  if opts and not vim.tbl_isempty(opts) then
    user_config = util.extend(vim.deepcopy(defaults), opts)
  end
end

function M.load(opts)
  local config = resolve_config(opts)

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "calm"

  apply_highlights(config)
end

function M.colors()
  return palette
end

return M
