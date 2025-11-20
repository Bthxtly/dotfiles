vim.cmd([[cabbr cc CodeCompanion]])
vim.cmd([[cabbr ccc CodeCompanionChat]])

return {
  {
    "olimorris/codecompanion.nvim",
    lazy = true,
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionCmd", "CodeCompanionActions" },
    opts = {
      strategies = {
        chat = {
          adapter = {
            name = "ollama",
            model = "qwen2.5-coder:14b",
          },
        },
        inline = {
          adapter = {
            name = "ollama",
            model = "qwen2.5-coder:14b",
          },
        },
        cmd = {
          adapter = {
            name = "ollama",
            model = "qwen2.5-coder:14b",
          },
        },
      },

      adapters = {
        http = {
          gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              env = {
                api_key = "GEMINI_API_KEY",
              },
            })
          end,
        },
      },
    },
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
  },

  {
    "milanglacier/minuet-ai.nvim",
    lazy = true,
    config = function()
      require("minuet").setup({

        provider = "gemini",

        -- provider = "openai_fim_compatible",
        -- -- recommend for local model for resource saving
        -- n_completions = 1,
        -- context_window = 512,

        provider_options = {

          gemini = {
            model = "gemini-2.0-flash",
            stream = true,
            api_key = "GEMINI_API_KEY",
            -- prevent request timeout from outputing too many tokens
            optional = {
              generationConfig = {
                maxOutputTokens = 256,
                -- disable thinking for faster completion retrieval.
                thinkingConfig = {
                  thinkingBudget = 0,
                },
              },
              safetySettings = {
                {
                  -- HARM_CATEGORY_HATE_SPEECH,
                  -- HARM_CATEGORY_HARASSMENT
                  -- HARM_CATEGORY_SEXUALLY_EXPLICIT
                  category = "HARM_CATEGORY_DANGEROUS_CONTENT",
                  -- BLOCK_NONE
                  threshold = "BLOCK_ONLY_HIGH",
                },
              },
            },
          },

          -- ollama
          openai_fim_compatible = {
            -- For Windows users, TERM may not be present in environment variables.
            -- Consider using APPDATA instead.
            api_key = "TERM",
            name = "Ollama",
            end_point = "http://localhost:11434/v1/completions",
            model = "qwen2.5-coder:14b",
            optional = {
              max_tokens = 56,
              top_p = 0.9,
            },
          },
        },
      })
    end,
  },

  {
    "David-Kunz/gen.nvim",
    enabled = false,
    lazy = true,
    cmd = { "Gen" },
    opts = {
      model = "qwen2.5-coder:14b", -- The default model to use.
      quit_map = "q", -- set keymap to close the response window
      retry_map = "<c-r>", -- set keymap to re-send the current prompt
      accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
      host = "localhost", -- The host running the Ollama service.
      port = "11434", -- The port on which the Ollama service is listening.
      display_mode = "split", -- The display mode. Can be "float" or "split" or "horizontal-split".
      show_prompt = true, -- Shows the prompt submitted to Ollama.
      show_model = false, -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = true, -- Never closes the window automatically.
      file = true, -- Write the payload to a temporary file to keep the command short.
      hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
      init = function()
        pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
      end,
      -- Function to initialize Ollama
      command = function(options)
        local body = { model = options.model, stream = true }
        return "curl --silent --no-buffer -X POST http://"
          .. options.host
          .. ":"
          .. options.port
          .. "/api/chat -d $body"
      end,
      -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
      -- This can also be a command string.
      -- The executed command must return a JSON object with { response, context }
      -- (context property is optional).
      -- list_models = '<omitted lua function>', -- Retrieves a list of model names
      debug = false, -- Prints errors and the command which is run.
    },
  },
}
