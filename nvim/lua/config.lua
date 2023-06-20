local options = {
	encoding = "utf-8",
	fileencoding = "utf-8",
	title = true, 
    cmdheight = 2, -- コマンドラインスペースの高さを２行にする
	number = true, -- 行番号を常に表示する
	numberwidth = 4, -- 行番号の幅を４桁にする
    showtabline = 2, -- タブのラベル名を常に表示. bufferlineとぶつかる
	signcolumn = "yes", -- git差分用に行番号の左を空けておく
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
    cursorline = true,
    hlsearch = true,
    smartcase = true, 

}
for k, v in pairs(options) do
    vim.opt[k] = v
end

-- 全角スペース「　」のハイライト https://zenn.dev/oppara/articles/neovim-highlight-full-width-whitespace
vim.api.nvim_command("highlight default ExtraWhitespace ctermbg=202 ctermfg=202 guibg=salmon")
vim.api.nvim_create_augroup('extra-whitespace', {})
vim.api.nvim_create_autocmd({'VimEnter', 'WinEnter'}, {
    group = 'extra-whitespace',
    pattern = {'*'},
    command = [[call matchadd('ExtraWhitespace', '[\u200B\u3000]')]]
})
vim.api.nvim_create_autocmd({'ColorScheme'}, {
    group = 'extra-whitespace',
    pattern = {'*'},
    command = [[highlight default ExtraWhitespace ctermbg=202 ctermfg=202 guibg=salmon]]
})

--> keymap
local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap
-- normal(n)-mode
keymap("n", "Y", "y$", opts) -- 行末までヤンク
keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts) --検索結果のハイライトを消す
-- insert(i)-mode
keymap("i", "jk", "<Esc>", opts)
-- <<  keyamp
