return {
  {
    "neovim/nvim-lspconfig",
    opts = {},
  },
  -- Ensure installation of the correct LTeX version
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "ltex_plus" },
    },
  },

  -- Main configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- "barreiroleo/ltex-extra.nvim", -- dictionary and project word list integration
      -- "sickill/ltex-utils.nvim", -- optional utilities (hover commands, toggles)
    },
    opts = function(_, opts)
      local ltex_opts = {
        -- filetypes = { "markdown", "tex", "text", "typst", "org", "gitcommit" },
        filetypes = { "xyz" },
        settings = {
          ltex = {
            language = "de-DE",
            additionalLanguages = { "en-US" },
            checkFrequency = "save",
            additionalRules = {
              enablePickyRules = true,
              motherTongue = "en-US",
            },
            dictionary = {
              ["en-US"] = {},
              ["de-DE"] = {},
            },
            -- enabledRules = {
            --   ["de-DE"] = {
            --     -- Cases
            --     "AKKUSATIV_DE",
            --     "DATIV_DE",
            --     "NOMINATIV_DE",
            --     -- Articles and determiners
            --     "ARTIKEL_DE",
            --     -- Verb conjugation
            --     "KONJUGATION_DE",
            --     -- Agreement (subject-verb, adjective endings, etc.)
            --     "AGREEMENT_DE",
            --     -- Picky / stylistic rules
            --     "REPEATED_WORD_DE",
            --     "UPPERCASE_SENTENCE_START",
            --   },
            --   ["en-US"] = {
            --     "AGREEMENT_RULE",
            --     "UPPERCASE_SENTENCE_START",
            --     "WORD_REPEAT_RULE",
            --   },
            -- },
            disabledRules = {
              ["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
              ["de-DE"] = { "MORFOLOGIK_RULE_DE_DE" },
            },
            completionEnabled = true,
          },
        },
      }

      -- Register LTeX+ LSP
      opts.servers = opts.servers or {}
      opts.servers.ltex_plus = ltex_opts

      opts.diagnostics = {
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      }
    end,
  },
}
