-- Test script for calm.nvim presets
-- Run with: nvim -l test_presets.lua

-- Add lua directory to package path
package.path = package.path .. ";./lua/?.lua;./lua/?/init.lua"

print("=== Testing calm.nvim presets ===\n")

-- Test 1: Load presets directly
print("Test 1: Loading presets directly")
local tomorrow = require("calm.presets.tomorrow")
local vscode = require("calm.presets.vscode")
local vscode_light = require("calm.presets.vscode-light")

local tomorrow_colors = tomorrow.load()
local vscode_colors = vscode.load()
local vscode_light_colors = vscode_light.load()

print("✓ Tomorrow preset loaded, bg:", tomorrow_colors.bg)
print("✓ VSCode preset loaded, bg:", vscode_colors.bg)
print("✓ VSCode Light preset loaded, bg:", vscode_light_colors.bg)
print()

-- Test 2: Backward compatibility
print("Test 2: Backward compatibility (palette.lua)")
local palette = require("calm.palette")
print("✓ palette.lua loaded, bg:", palette.colors.bg)
print("✓ Should match tomorrow preset:", palette.colors.bg == tomorrow_colors.bg)
print()

-- Test 3: Verify all 43 colors exist in each preset
print("Test 3: Verify all required colors exist")
local required_colors = {
  "bg", "bg_alt", "fg", "fg_light", "fg_dim", "fg_muted",
  "border", "float_border", "comment", "cursor_line", "cursor_line_border",
  "selection", "selection_inactive", "menu", "glyph",
  "diag_error", "diag_warn", "diag_info", "diag_hint",
  "diff_add", "diff_delete", "diff_change",
  "git_add", "git_change", "git_delete", "git_ignore",
  "black", "red", "orange", "yellow", "green", "cyan", "blue", "magenta", "purple", "rust"
}

local function check_colors(preset_name, colors)
  local missing = {}
  for _, color in ipairs(required_colors) do
    if not colors[color] then
      table.insert(missing, color)
    end
  end
  if #missing > 0 then
    print("✗", preset_name, "missing colors:", table.concat(missing, ", "))
    return false
  else
    print("✓", preset_name, "has all", #required_colors, "required colors")
    return true
  end
end

check_colors("tomorrow", tomorrow_colors)
check_colors("vscode", vscode_colors)
check_colors("vscode-light", vscode_light_colors)
print()

-- Test 4: Color differences between presets
print("Test 4: Verify presets have different colors")
print("✓ Tomorrow vs VSCode bg different:", tomorrow_colors.bg ~= vscode_colors.bg)
print("✓ VSCode vs VSCode Light bg different:", vscode_colors.bg ~= vscode_light_colors.bg)
print("  Tomorrow bg:", tomorrow_colors.bg)
print("  VSCode bg:", vscode_colors.bg)
print("  VSCode Light bg:", vscode_light_colors.bg)
print()

print("=== All tests completed ===")
