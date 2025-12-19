local M = {}

-- Backward compatibility: load default 'tomorrow' preset
-- For new code, use require("calm").colors() or require("calm.presets.tomorrow").load()
M.colors = require("calm.presets.tomorrow").load()

return M
