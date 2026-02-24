local M = {}

--- Request a hint from OpenClaw gateway or return a static fallback.
--- @param challenge_name string
--- @param code string
--- @param passed number
--- @param total number
--- @param callback fun(response: string?, err: string?)
function M.get_hint(challenge_name, code, passed, total, callback)
  local config = require('brain').config

  if config.hint_provider ~= 'openclaw' or config.openclaw.token == '' then
    callback('Hints require OpenClaw integration. Set hint_provider = "openclaw" and provide a token in setup().', nil)
    return
  end

  local url = string.format('http://127.0.0.1:%d/v1/chat/completions', config.openclaw.port)

  local messages = {
    {
      role = 'system',
      content = 'You are a coding tutor. Give a brief, helpful hint for solving this challenge. Do NOT give the full solution. Be concise (2-4 sentences max).',
    },
    {
      role = 'user',
      content = string.format(
        'Challenge: %s\n\nCurrent code:\n```typescript\n%s\n```\n\nTests passing: %d/%d\n\nGive me a hint.',
        challenge_name, code, passed, total
      ),
    },
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
    on_exit = function(_, exit_code)
      if exit_code ~= 0 then
        callback(nil, 'curl failed with code ' .. exit_code)
        return
      end
      local full = table.concat(response_chunks, '\n')
      local ok, parsed = pcall(vim.fn.json_decode, full)
      if ok and parsed and parsed.choices and parsed.choices[1] then
        callback(parsed.choices[1].message.content, nil)
      else
        callback(nil, 'Failed to parse response')
      end
    end,
  })
end

--- Request a full solution explanation.
function M.get_solution(challenge_name, code, callback)
  local config = require('brain').config

  if config.hint_provider ~= 'openclaw' or config.openclaw.token == '' then
    callback('Solution explanations require OpenClaw integration.', nil)
    return
  end

  local url = string.format('http://127.0.0.1:%d/v1/chat/completions', config.openclaw.port)

  local messages = {
    {
      role = 'system',
      content = 'You are a coding tutor. Explain the solution to this challenge clearly and concisely. Show the complete solution code, then explain the key insights.',
    },
    {
      role = 'user',
      content = string.format(
        'Challenge: %s\n\nStub:\n```typescript\n%s\n```\n\nShow and explain the solution.',
        challenge_name, code
      ),
    },
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
    on_exit = function(_, exit_code)
      if exit_code ~= 0 then
        callback(nil, 'curl failed with code ' .. exit_code)
        return
      end
      local full = table.concat(response_chunks, '\n')
      local ok, parsed = pcall(vim.fn.json_decode, full)
      if ok and parsed and parsed.choices and parsed.choices[1] then
        callback(parsed.choices[1].message.content, nil)
      else
        callback(nil, 'Failed to parse response')
      end
    end,
  })
end

return M
