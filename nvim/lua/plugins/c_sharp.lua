return {
  -- C# syntax
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c_sharp",
      },
    },
  },

  -- Roslyn LSP
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "cshtml" },
    opts = {
      filewatching = "off",
      broad_search = true,
    },
  },

  -- Make sure OmniSharp isn't started by LazyVim
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = false,
      },
    },
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cs = { "csharpier" },
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },

  -- C# debugger
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")

      if not dap.adapters.netcoredbg then
        dap.adapters.netcoredbg = {
          type = "executable",
          command = vim.fn.exepath("netcoredbg"),
          args = { "--interpreter=vscode" },
        }
      end

      dap.configurations.cs = {
        {
          type = "netcoredbg",
          name = "Launch .NET",
          request = "launch",

          program = function()
            return vim.fn.input("Path to DLL: ", vim.fn.getcwd() .. "/", "file")
          end,

          cwd = "${workspaceFolder}",
        },
      }
    end,
  },

  -- Install C# tools through Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "roslyn-language-server",
        "csharpier",
        "netcoredbg",
      },
    },
  },
}
