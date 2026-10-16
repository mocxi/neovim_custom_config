require("codecompanion").setup({
  adapters = {
    openai = function()
      return require("codecompanion.adapters").extend("openai", {
        env = {
          api_key = os.getenv("OPENAI_API_KEY"),
        },
        schema = {
          model = {
            default = "gpt-4o", -- or gpt-4o-mini, o1-preview, etc.
          },
        },
      })
    end,
    gemini = function()
      return require("codecompanion.adapters").extend("gemini", {
        env = { api_key = "cmd:echo $GEMINI_API_KEY" },
        schema = { model = { default = "gemini-2.5-flash" } }, -- Example model
      })
    end,
    ollama1_5b = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "ollama1_5b", 
        env = {
          -- Set your custom server IP address and port here
          url = "http://localhost:11434", 
        },
        url = "http://localhost:11434", 
        schema = {
          model = {
            default = "qwen2.5-coder:1.5b", -- Match the exact string from 'ollama list'
          },
          num_ctx = {
            default = 8192, -- Expand context window for reading large code blocks
          },
        },
      })
    end,
    http = {
      -- Defining the custom adapter by returning a raw Lua table
      remote_ollama = function()
        return {
          name = "remote_ollama",
          url = "http://localhost:11434", -- Replace with your remote IP
          env = {
            url = "http://localhost:11434", 
          },
          headers = {
            ["Content-Type"] = "application/json",
          },
          roles = {
            llm = "assistant",
            user = "user",
            system = "system",
          },
          parameters = {
            sync = false,
          },
          schema = {
            model = {
              default = "qwen2.5-coder:1.5b", -- Replace with your remote model tag
            },
          },
          handlers = {
            form_parameters = function(self, params)
              return {
                model = params.model,
                messages = params.messages,
                stream = params.stream,
              }
            end,
          },
        }
      end,
      remote_ollama2 = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
          env = {
            url = "http://localhost:11434", -- Using your working minuet server IP
            api_key = os.getenv("OLLAMA"),
          },
          schema = {
            model = {
              default = "qwen2.5-coder:7b", -- Matching your working FIM model
            },
          },
        })
      end,
    },

  },
  strategies = {
    chat = { adapter = "remote_ollama2" },
    inline = { adapter = "remote_ollama2" },
    agent = { adapter = "remote_ollama2" },
  },
})



local codecompanion_enabled = true

vim.keymap.set('n', '<F5>', function()
    codecompanion_enabled = not codecompanion_enabled
    
    if codecompanion_enabled then
        -- Re-enable CodeCompanion systems
        pcall(function() require("codecompanion").setup() end)
        print("CodeCompanion: Enabled")
    else
        -- Force shut down CodeCompanion's background event handlers and clean up memory
        pcall(function()
            local cc = require("codecompanion")
            -- Clear out active chat buffers and background auto-context builders
            vim.cmd('silent! bdelete! codecompanion')
        end)
        print("CodeCompanion: Disabled (Muted)")
    end
end, { desc = 'Toggle CodeCompanion Plugin State' })
