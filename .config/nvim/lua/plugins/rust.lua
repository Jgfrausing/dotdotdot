return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Setup rust-analyzer with specific project flags
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                extraEnv = {
                  RUSTFLAGS = "--cfg tokio_unstable",
                },
              },
            },
          },
        },
      },
    },
  },
}
