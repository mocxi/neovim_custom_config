local fim_provider = {
  name = 'Ollama',
  end_point = 'http://192.168.1.21:11434/v1/completions',
  timeout = 10000,
  model = 'qwen2.5-coder:1.5b',
  api_key_value = 'OLLAMA',
  api_key = vim.fn.has('win32') == 1 and 'APPDATA' or 'HOME',
  -- optional = {
  --   max_tokens = 64,
  --   options = { num_predict = 64 },
  -- },
}

require('minuet').setup({
  virtualtext = {
    auto_trigger_ft = {},
    keymap = {
      accept = '<A-A>',
      accept_line = '<A-a>',
      prev = '<A-[>',
      next = '<A-]>',
      dismiss = '<A-e>',
    },
  },
  throttle = 2000,
  debounce = 400,
  -- provider = 'openai_fim_compatible',
  -- Prevent nvim-cmp from auto-fetching suggestions
  cmp = {
    enable_auto_complete = false,
  },

  -- Prevent blink.cmp from auto-fetching suggestions
  blink = {
    enable_auto_complete = false,
  },
})

-- Snapshot the plugin's full default provider table (includes get_text_fn etc.)
local provider_defaults = vim.deepcopy(
  require('minuet').config.provider_options.openai_fim_compatible
)

local provider_disabled = vim.tbl_deep_extend('force', provider_defaults, {
  api_key = vim.fn.has('win32') == 1 and 'APPDATA' or 'HOME',
  end_point = 'http://127.0.0.1:1/v1/completions', -- nothing listens here
  timeout = 1000,
})

local function apply_provider(enabled)
  local config = require('minuet').config
  config.provider_options = config.provider_options or {}
  if enabled then
    config.virtualtext.auto_trigger_ft = { '*' }
    config.provider = 'openai_fim_compatible'
    config.provider_options.openai_fim_compatible =
      vim.tbl_deep_extend('force', provider_defaults, fim_provider)
  else
    config.virtualtext.auto_trigger_ft = {}
    config.provider_options.openai_fim_compatible = vim.deepcopy(provider_disabled)
  end
end

local minuet_active = false
apply_provider(minuet_active)

local function toggle_minuet()
  minuet_active = not minuet_active

  pcall(function() require('minuet.virtualtext').action.dismiss() end)
  apply_provider(minuet_active)

  pcall(function() vim.cmd("Minuet cmp toggle") end)
  pcall(function() vim.cmd("Minuet blink toggle") end)
  pcall(function() vim.cmd("Minuet virtualtext toggle") end)

  print(minuet_active and "Minuet AI: Enabled" or "Minuet AI: Disabled")
end

-- turn off default

vim.keymap.set({ 'n', 'i' }, '<F4>', toggle_minuet, { desc = 'Toggle Minuet AI Engines' })


