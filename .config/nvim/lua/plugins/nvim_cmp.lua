return {
    { 'hrsh7th/nvim-cmp',
	  dependencies = {
		  "hrsh7th/cmp-buffer",
		  "hrsh7th/cmp-nvim-lsp",
		  "hrsh7th/cmp-path",
		  "hrsh7th/cmp-cmdline",
		  "neovim/nvim-lspconfig"
	  },
	  config = function()
		local cmp = require("cmp")
		cmp.setup({
    		mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    		}),
    		sources = cmp.config.sources({
      			{ name = 'nvim_lsp' },
				{ name = 'path' },
      			{ name = 'buffer' }
    		})
  		})

		cmp.setup.cmdline({ '/', '?' }, {
    		mapping = cmp.mapping.preset.cmdline(),
    		sources = {
      			{ name = 'buffer' }
    		}
  		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  		cmp.setup.cmdline(':', {
    		mapping = cmp.mapping.preset.cmdline(),
    		sources = cmp.config.sources({
      				{ name = 'path' }, 
      				{ name = 'cmdline' }
    		}),
    		matching = { disallow_symbol_nonprefix_matching = false }
  		})

  		-- Set up lspconfig.
  		local capabilities = require('cmp_nvim_lsp').default_capabilities()
  		-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  		require('lspconfig')['gopls'].setup {
    		capabilities = capabilities
  		}
      end
	}
}

