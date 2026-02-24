local M = {}

function M.calculate_score(all_pass, hints_used)
  if all_pass and hints_used == 0 then
    return 3, '✅'
  elseif all_pass then
    return 2, '🟡'
  else
    return 1, '🔴'
  end
end

function M.update_log(date, challenge_name, score, emoji, hints_used, passed, total)
  local config = require('brain').config
  local log_file = config.log_file

  vim.fn.mkdir(vim.fn.fnamemodify(log_file, ':h'), 'p')

  local lines = {}
  local f = io.open(log_file, 'r')
  if f then
    for line in f:lines() do
      lines[#lines + 1] = line
    end
    f:close()
  else
    lines = {
      '# Cognitive Training Log',
      '',
      '| Date | Challenge | Score | Tests | Hints |',
      '|------|-----------|-------|-------|-------|',
    }
  end

  local entry = string.format('| %s | %s | %s %d/3 | %d/%d | %d |',
    date, challenge_name, emoji, score, passed, total, hints_used)
  lines[#lines + 1] = entry

  f = io.open(log_file, 'w')
  if f then
    f:write(table.concat(lines, '\n') .. '\n')
    f:close()
  end
end

return M
