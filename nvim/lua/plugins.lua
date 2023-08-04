local fn = vim.fn

-- Automatically install packer if packer does not exist
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Install packer")
    print(PACKER_BOOTSTRAP)
end

vim.cmd([[packadd packer.nvim]])
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("Something wrong with packer")
	return
end


return require('packer').startup(function()
    -- packer
    use 'wbthomason/packer.nvim'

	-- >> syntax
	use 'KensukeKurita/wannier90vim'
	use 'KensukeKurita/respack-syntax'
	use 'leseixas/quantum_espresso-vim'
	-- << syntax
	
	-- >> colorscheme
	use 'tomasr/molokai'
	use 'kuroitu/pyceberg'
	use 'EdenEast/nightfox.nvim'
    use 'ishan9299/nvim-solarized-lua'
	use 'cocopon/iceberg.vim'
	-- << colorscheme

	-- >> status line
	use 'kyazdani42/nvim-web-devicons'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons'}
	}
	-- << status line
    
    -- Markdown Viewer
    use({"iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end})

	-- sidebar
	use 'sidebar-nvim/sidebar.nvim'
    
    -- commnet
    use 'tomtom/tcomment_vim'

	-- search 
	use 'kevinhwang91/nvim-hlslens'

    -- FuzzyFinder
    use 'nvim-telescope/telescope.nvim'	
    use 'nvim-telescope/telescope-file-browser.nvim'	

	-- Terminal
	use {'akinsho/toggleterm.nvim', tag='v2.*'}
	
    -- bufferline
    use 'akinsho/nvim-bufferline.lua'

    -- treesitter
	use { 'nvim-treesitter/nvim-treesitter', 
           run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

	-- >> git
	use 'airblade/vim-gitgutter'
	-- << git

	-- >> LSP
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/cmp-buffer'
    use 'onsails/lspkind-nvim'
	-- <<
    
    use {'jose-elias-alvarez/null-ls.nvim', requires='nvim-lua/plenary.nvim'}
end)
