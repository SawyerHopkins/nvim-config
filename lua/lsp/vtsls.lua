local lspUtils = require('utils.lsp')

vim.lsp.config('vtsls', {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = '@vue/typescript-plugin',
            location = vim.env.VUE_LS_PATH,
            languages = { 'vue' },
            configNamespace = 'typescript',
          }
        },
      },
    },
    typescript = {
      referencesCodeLens = {
        enabled = true,
        showOnAllFunctions = true
      },

      implementationsCodeLens = {
        enabled = true,
        showOnInterfaceMethods = true,
        showOnAllClassMethods = true
      },

      preferGoToSourceDefinition = true,

      updateImportsOnFileMove = { enabled = 'always' },

      suggest = {
        enabled = true,
        completeFunctionCalls = true,
      },

      inlayHints = {
        enumMemberValues = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        parameterNames = { enabled = 'literals' },
        parameterTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        variableTypes = { enabled = false },
      },

      tsserver = {
        experimental = {
          enableProjectDiagnostics = false,
        },
      },

      preferences = {
        importModuleSpecifier = 'shortest',
        importModuleSpecifierEnding = 'minimal',
        jsxAttributeCompletionStyle = 'auto',
        quoteStyle = 'single',
        useAliasesForRenames = false,
        autoImportFileExcludePatterns = {
          'node_modules/*',
        },
      },

      format = {
        semicolons = 'remove'
      }
    },
    javascript = {
      updateImportsOnFileMove = { enabled = 'always' },
      suggest = {
        completeFunctionCalls = true,
      },
      inlayHints = {
        enumMemberValues = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        parameterNames = { enabled = 'literals' },
        parameterTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        variableTypes = { enabled = false },
      },
      preferences = {
        importModuleSpecifier = 'shortest',
        importModuleSpecifierEnding = 'minimal',
        jsxAttributeCompletionStyle = 'auto',
        quoteStyle = 'single',
      },
    },
  },
  filetypes = {
    'typescript',
    'javascript',
    'javascriptreact',
    'typescriptreact',
    'vue'
  },
  on_attach = function(client, bufnr)
    vim.keymap.set("n", "<leader>lo", lspUtils.source_action("source.organizeImports"), { desc = "Organize imports", buffer = bufnr })
    vim.keymap.set("n", "<leader>lO", lspUtils.source_action("source.sortImports"), { desc = "Sort imports", buffer = bufnr })
    vim.keymap.set("n", "<leader>li", lspUtils.source_action("source.addMissingImports.ts"), { desc = "Add Missing Imports", buffer = bufnr })
    vim.keymap.set("n", "<leader>lu", lspUtils.source_action("source.removeUnusedImports"), { desc = "Remove Missing imports", buffer = bufnr })
    vim.keymap.set("n", "<leader>lU", lspUtils.source_action("source.removeUnused.ts"), { desc = "Remove unused declarations", buffer = bufnr })
    vim.keymap.set("n", "<leader>lF", lspUtils.source_action("source.fixAll.ts"), { desc = "Fix all", buffer = bufnr })

    vim.lsp.codelens.enable(true, { bufnr = bufnr })

    local existing_capabilities = client.server_capabilities
    if vim.bo.filetype == 'vue' then
      existing_capabilities.semanticTokensProvider.full = false
    else
      existing_capabilities.semanticTokensProvider.full = true
    end
  end
})

vim.lsp.enable('vtsls')
