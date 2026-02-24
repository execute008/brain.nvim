local M = {}

M.chat_buf = nil
M.chat_win = nil
M.input_buf = nil
M.input_win = nil
M.code_win = nil

function M.create_chat_buffer()
  if M.chat_buf and vim.api.nvim_buf_is_valid(M.chat_buf) then
    return M.chat_buf
  end

  M.chat_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_name(M.chat_buf, 'brain://chat')
  vim.bo[M.chat_buf].buftype = 'nofile'
  vim.bo[M.chat_buf].filetype = 'markdown'
  vim.bo[M.chat_buf].swapfile = false
  vim.bo[M.chat_buf].modifiable = false

  vim.api.nvim_buf_set_keymap(M.chat_buf, 'n', 'q', '<cmd>lua require("brain.ui").close_chat()<CR>', { noremap = true, silent = true })

  return M.chat_buf
end

function M.create_input_buffer()
  if M.input_buf and vim.api.nvim_buf_is_valid(M.input_buf) then
    return M.input_buf
  end

  M.input_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_name(M.input_buf, 'brain://input')
  vim.bo[M.input_buf].buftype = 'nofile'
  vim.bo[M.input_buf].filetype = 'markdown'
  vim.bo[M.input_buf].swapfile = false

  vim.api.nvim_buf_set_keymap(M.input_buf, 'n', '<CR>', '<cmd>lua require("brain.ui").send_input()<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(M.input_buf, 'i', '<C-CR>', '<Esc><cmd>lua require("brain.ui").send_input()<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(M.input_buf, 'n', 'q', '<cmd>lua require("brain.ui").close_chat()<CR>', { noremap = true, silent = true })

  vim.api.nvim_buf_set_lines(M.input_buf, 0, -1, false, { '' })

  return M.input_buf
end

function M.open_layout(code_file)
  vim.cmd('edit ' .. vim.fn.fnameescape(code_file))
  M.code_win = vim.api.nvim_get_current_win()

  M.create_chat_buffer()
  M.create_input_buffer()

  vim.cmd('vsplit')
  vim.cmd('wincmd l')
  M.chat_win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(M.chat_win, M.chat_buf)
  vim.cmd('vertical resize 50')

  vim.cmd('belowright split')
  M.input_win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(M.input_win, M.input_buf)
  vim.cmd('resize 3')

  vim.wo[M.input_win].number = false
  vim.wo[M.input_win].relativenumber = false
  vim.wo[M.input_win].signcolumn = 'no'
  vim.wo[M.input_win].statusline = '%#Comment# 💬 Type message, <Enter> to send %*'

  vim.wo[M.chat_win].number = false
  vim.wo[M.chat_win].relativenumber = false
  vim.wo[M.chat_win].signcolumn = 'no'
  vim.wo[M.chat_win].wrap = true
  vim.wo[M.chat_win].linebreak = true
  vim.wo[M.chat_win].statusline = '%#Title# 🧠 Brain Chat %*'

  vim.api.nvim_set_current_win(M.code_win)

  M.disable_ai_completion()
end

function M.disable_ai_completion()
  local config = require('brain').config
  if not config.disable_copilot then return end

  local code_buf = vim.api.nvim_get_current_buf()
  pcall(function() vim.b[code_buf].copilot_enabled = false end)
  pcall(function() vim.b[code_buf].completion = false end)

  vim.api.nvim_create_autocmd('BufEnter', {
    buffer = code_buf,
    callback = function()
      pcall(function() require('cmp').setup.buffer({ enabled = false }) end)
      pcall(function() vim.b.copilot_enabled = false end)
    end,
  })
end

function M.send_input()
  if not M.input_buf or not vim.api.nvim_buf_is_valid(M.input_buf) then return end

  local lines = vim.api.nvim_buf_get_lines(M.input_buf, 0, -1, false)
  local msg = vim.fn.trim(table.concat(lines, '\n'))
  if msg == '' then return end

  vim.api.nvim_buf_set_lines(M.input_buf, 0, -1, false, { '' })

  M.append_chat({ '', '**You:** ' .. msg, '' })

  local hints = require('brain.hints')
  local challenge = require('brain.challenge')
  local code_content = ''
  if challenge.current and challenge.current.code_file then
    local f = io.open(challenge.current.code_file, 'r')
    if f then code_content = f:read('*a'); f:close() end
  end

  M.append_chat({ '_Thinking..._', '' })

  -- Use hints module for chat (it uses the same OpenClaw backend)
  local config = require('brain').config
  if config.hint_provider ~= 'openclaw' or config.openclaw.token == '' then
    vim.schedule(function()
      -- Remove thinking indicator
      M._remove_thinking()
      M.append_chat({ '> Chat requires OpenClaw integration (hint_provider = "openclaw").', '' })
    end)
    return
  end

  local url = string.format('http://127.0.0.1:%d/v1/chat/completions', config.openclaw.port)
  local messages = {
    { role = 'system', content = 'You are a coding coach. The user is working on a cognitive challenge. Be concise, helpful, and Socratic — guide without giving away the answer.\n\nCurrent code:\n```typescript\n' .. code_content .. '\n```' },
    { role = 'user', content = msg },
  }

  local payload = vim.fn.json_encode({
    model = 'openclaw:main',
    messages = messages,
    stream = false,
  })

  local response_chunks = {}
  vim.fn.jobstart({
    'curl', '-s', '-X', 'POST', url,
    '-H', 'Content-Type: application/json',
    '-H', 'Authorization: Bearer ' .. config.openclaw.token,
    '-d', payload,
  }, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      for _, line in ipairs(data) do
        if line ~= '' then table.insert(response_chunks, line) end
      end
    end,
    on_exit = function(_, code)
      vim.schedule(function()
        M._remove_thinking()
        if code ~= 0 then
          M.append_chat({ '> ⚠️ Request failed', '' })
          return
        end
        local full = table.concat(response_chunks, '\n')
        local ok, parsed = pcall(vim.fn.json_decode, full)
        if ok and parsed and parsed.choices and parsed.choices[1] then
          local resp_lines = { '' }
          for line in parsed.choices[1].message.content:gmatch('[^\n]*') do
            table.insert(resp_lines, '> ' .. line)
          end
          table.insert(resp_lines, '')
          M.append_chat(resp_lines)
        else
          M.append_chat({ '> ⚠️ Could not parse response', '' })
        end
      end)
    end,
  })
end

function M._remove_thinking()
  if not M.chat_buf or not vim.api.nvim_buf_is_valid(M.chat_buf) then return end
  vim.bo[M.chat_buf].modifiable = true
  local all = vim.api.nvim_buf_get_lines(M.chat_buf, 0, -1, false)
  local filtered = {}
  local removed = false
  for i = #all, 1, -1 do
    if not removed and (all[i] == '_Thinking..._' or all[i] == '') then
      if all[i] == '_Thinking..._' then removed = true end
    else
      table.insert(filtered, 1, all[i])
    end
  end
  vim.api.nvim_buf_set_lines(M.chat_buf, 0, -1, false, filtered)
  vim.bo[M.chat_buf].modifiable = false
end

function M.append_chat(lines)
  if not M.chat_buf or not vim.api.nvim_buf_is_valid(M.chat_buf) then
    M.create_chat_buffer()
  end

  vim.bo[M.chat_buf].modifiable = true
  local existing = vim.api.nvim_buf_get_lines(M.chat_buf, 0, -1, false)
  if #existing == 1 and existing[1] == '' then
    vim.api.nvim_buf_set_lines(M.chat_buf, 0, -1, false, lines)
  else
    local count = vim.api.nvim_buf_line_count(M.chat_buf)
    vim.api.nvim_buf_set_lines(M.chat_buf, count, count, false, lines)
  end
  vim.bo[M.chat_buf].modifiable = false

  if M.chat_win and vim.api.nvim_win_is_valid(M.chat_win) then
    local new_count = vim.api.nvim_buf_line_count(M.chat_buf)
    vim.api.nvim_win_set_cursor(M.chat_win, { new_count, 0 })
  end
end

function M.close_chat()
  if M.input_win and vim.api.nvim_win_is_valid(M.input_win) then
    vim.api.nvim_win_close(M.input_win, true)
    M.input_win = nil
  end
  if M.chat_win and vim.api.nvim_win_is_valid(M.chat_win) then
    vim.api.nvim_win_close(M.chat_win, true)
    M.chat_win = nil
  end
end

function M.clear_chat()
  if M.chat_buf and vim.api.nvim_buf_is_valid(M.chat_buf) then
    vim.bo[M.chat_buf].modifiable = true
    vim.api.nvim_buf_set_lines(M.chat_buf, 0, -1, false, { '' })
    vim.bo[M.chat_buf].modifiable = false
  end
end

return M
