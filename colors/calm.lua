-- Neovim entrypoint for the calm colorscheme.
local ok, calm = pcall(require, "calm")
if not ok then
  return
end

calm.load()
