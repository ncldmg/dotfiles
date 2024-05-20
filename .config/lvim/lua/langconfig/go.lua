local gopls = {
  -- capabilities = cap,
  filetypes = {"go", "gomod"},
  message_level = vim.lsp.protocol.MessageType.Error,
  cmd = {
    "gopls", -- share the gopls instance if there is one already
    "-remote.debug=:0"
  },

  flags = {allow_incremental_sync = true, debounce_text_changes = 500},
  settings = {
    gopls = {
      -- more settings: https://github.com/golang/tools/blob/master/gopls/doc/settings.md
      -- flags = {allow_incremental_sync = true, debounce_text_changes = 500},
      -- not supported
      analyses = {unusedparams = true, unreachable = true},
      codelenses = {
        generate = true, -- show the `go generate` lens.
        gc_details = true, --  // Show a code lens toggling the display of gc's choices.
        test = true,
        tidy = true
      },
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      matcher = "Fuzzy",
      -- experimentalDiagnosticsDelay = "500ms",
      diagnosticsDelay = "500ms",
      experimentaWatchedFileDelay = "100ms",
      symbolMatcher = "fuzzy",
      ['local'] = "",
      gofumpt = true, -- true, -- turn on for new repos, gofmpt is good but also create code turmoils
      buildFlags = {"-tags", "linux"}
    }
  }
}

lvim.lang.go.lsp.setup(gopls)
