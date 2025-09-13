local M = {}

function M.smart_q()
  -- Check if we're currently recording a macro
  local recording = vim.fn.reg_recording()
  if recording ~= "" then
    -- Stop recording
    vim.cmd("normal! q")
  else
    -- Close buffer using existing logic
    require("user.buffer").smart_close_buffer()
  end
end

return M

