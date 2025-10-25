-- >> 
-- Setting Language Server Protocol(LSP)
-- 
--  Using below plugins, 
--   1. nvim-lspconfig
--   2. mason.nvim
--      2a. mason-lspconfig.nvim
--   3. nvim-cmp
--      3a. cmp-nvim-lsp
--      3b. vim-vsnip
      
local status, mason = pcall(require, "mason")
if (not status) then
    print("Error Mason")
    return
end

require('mason').setup()
require('mason-lspconfig').setup_handlers({ 
    function(server)
        -- masonでインストールしたLSPの名前がserverに代入される
        -- それをlspconfigで管理する
	    local opt = {
		    local capabilities = require('cmp_nvim_lsp').default_capabilities(
			    vim.lsp.protocol.make_client_capabilities()
			    )
            }
	    require('lspconfig')[server].setup(opt)
    end 
})

-- << 


-- >> build in LSP function
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
-- << build in LSP function

-- >> Completion
local cmp = require('cmp')
cmp.setup({
	snipett = {
		expand = function(args)
			vim.fn['vsnip#anonymous'](args.body)
		end,
	},
	sources = {
		{name = 'nvim_lsp'},
	},
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-l>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
	}),
})
-- << Completion
