local M = {}

function M.smart_close_buffer()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_buf_get_option(bufnr, "modified")

  -- Check if buffer is modified
  if modified then
    vim.notify("Buffer has unsaved changes", vim.log.levels.WARN)
    return
  end

  -- Get list of windows showing this buffer
  local windows = vim.fn.getbufinfo(bufnr)[1].windows

  -- Check if this is the last buffer
  local buf_count = #vim.fn.getbufinfo({ buflisted = 1 })

  -- If not the last buffer, switch to alternate buffer in each window
  if buf_count > 1 then
    for _, win in ipairs(windows or {}) do
      vim.api.nvim_win_call(win, function() vim.cmd("bprevious") end)
    end
  end

  -- Close the buffer (will close window if last buffer)
  vim.cmd("bdelete " .. bufnr)
end

return M

