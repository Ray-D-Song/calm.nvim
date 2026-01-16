local util = require("calm.util")

---@class CalmConfig
---@field preset? "tomorrow"|"vscode"|"vscode-light"|"sublime"|"pyments" Colorscheme preset
---@field transparent boolean Enable transparent background
---@field highlights? table|fun(palette: table): table Extra highlight definitions

---@class CalmModule
---@field setup fun(opts?: CalmConfig): nil
---@field load fun(opts?: CalmConfig): nil
---@field colors fun(): table
local M = {}

---@type CalmConfig
local defaults = {
  preset = "tomorrow",
  transparent = false,
  highlights = nil, -- table or function returning a table of extra highlight definitions
}

---@type CalmConfig
local user_config = vim.deepcopy(defaults)

---@param preset_name string
---@return table
local function load_preset(preset_name)
  local preset_path = "calm.presets." .. preset_name
  local ok, preset = pcall(require, preset_path)

  if not ok then
    vim.notify(
      string.format("Calm: Preset '%s' not found, falling back to 'tomorrow'", preset_name),
      vim.log.levels.WARN
    )
    preset = require("calm.presets.tomorrow")
  end

  return preset.load()
end

---@param highlights_name string
---@return table
local function load_highlights_builder(highlights_name)
  local highlights_path = "calm.highlights." .. highlights_name
  local ok, builder = pcall(require, highlights_path)

  if not ok then
    vim.notify(
      string.format("Calm: Highlights '%s' not found, falling back to 'default'", highlights_name),
      vim.log.levels.WARN
    )
    builder = require("calm.highlights.default")
  end

  return builder
end

---@param opts? CalmConfig
---@return CalmConfig
local function resolve_config(opts)
  if not opts or vim.tbl_isempty(opts) then
    return vim.deepcopy(user_config)
  end
  return util.extend(vim.deepcopy(user_config), opts)
end

---@param overrides? table|fun(palette: table): table
---@param palette table
---@return table?
local function normalize_overrides(overrides, palette)
  if type(overrides) == "function" then
    return overrides(palette)
  end
  return overrides
end

---@param config CalmConfig
local function apply_highlights(config)
  local preset_data = load_preset(config.preset)
  local palette = preset_data.palette
  local highlights_name = preset_data.highlights_name

  local builder = load_highlights_builder(highlights_name)
  local groups = builder.build(palette, config)

  local overrides = normalize_overrides(config.highlights, palette)
  if type(overrides) == "table" then
    for group, spec in pairs(overrides) do
      groups[group] = spec
    end
  end

  util.apply_highlights(groups)
end

---Setup the calm colorscheme with user configuration
---@param opts? CalmConfig
function M.setup(opts)
  if opts and not vim.tbl_isempty(opts) then
    user_config = util.extend(vim.deepcopy(defaults), opts)
  end
end

---Load the calm colorscheme
---@param opts? CalmConfig
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

---Get the color palette for the current preset
---@return table
function M.colors()
  local preset_data = load_preset(user_config.preset)
  return preset_data.palette
end

return M
