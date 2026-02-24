-- brain.nvim — lazy-load commands
local function ensure_setup()
  require('brain').setup()
end

vim.api.nvim_create_user_command('BrainStart', function() ensure_setup(); require('brain.challenge').start() end, {})
vim.api.nvim_create_user_command('BrainTest', function() ensure_setup(); require('brain.challenge').test() end, {})
vim.api.nvim_create_user_command('BrainHint', function() ensure_setup(); require('brain.challenge').hint() end, {})
vim.api.nvim_create_user_command('BrainSubmit', function() ensure_setup(); require('brain.challenge').submit() end, {})
vim.api.nvim_create_user_command('BrainSkip', function() ensure_setup(); require('brain.challenge').skip() end, {})
