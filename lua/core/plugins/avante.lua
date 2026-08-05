return {
  "yetone/avante.nvim",
  enable = false,
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = function()
    local providers = {
      my_local_provider = {
        __inherited_from = "openai",
        endpoint = os.getenv("LOCAL_AI_PROVIDER_ENDPOINT") or "",
        api_key_name = os.getenv("LOCAL_AI_API_KEY") or "",
        model = os.getenv("LOCAL_AI_MODEL") or "",
      },
      ollama = {
        endpoint = os.getenv("OLLAMA_ENDPOINT")
          or "http://host.docker.internal:11434",
        model = os.getenv("OLLAMA_MODEL") or "llama3.2:latest",
        is_env_set = function()
          return true
        end,
      },
    }

    local special_ok, special_avante =
      pcall(require, "special.core.extend_plugins.avante")
    vim.print(special_ok)
    if special_ok then
      providers =
        vim.tbl_deep_extend("force", providers, special_avante.providers)
    end

    return {
      -- add any opts here
      -- this file can contain specific instructions for your project
      instructions_file = "avante.md",
      -- for example
      input = { provider = "snacks" },
      provider = "my_local_provider",
      providers = providers,
      behaviour = {
        auto_apply_diff_after_generation = false,
        auto_approve_tool_permissions = false,
        enable_fastapply = false,
      },
      rules = {
        project_dir = ".avante/rules",
      },
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-mini/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "stevearc/dressing.nvim", -- for input provider dressing
    "folke/snacks.nvim", -- for input provider snacks
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
