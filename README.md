# fish
fish setup
```bash
brew install fish
```

# nvim
neovim setup
```bash
brew install neovim
```

**Requirements**
Some plugins require external libraries.
You must install them with brew.

- `tree-sitter` (you might have installed this. `homebrew` or `npm`)


**Plugin Install**
1. Start neovim
2. Automatically start installing Packer(PluginManager)
3. Type `:PackerInstall`

**Set Font**  
You must use fonts which include icons previewed in sidebar and statusbar.
1. Get your favorite font via [NerdFont](https://www.nerdfonts.com).
2. Set the font on your terminal (iTerm2 or others).

## Config
### Set config with lua

### Plugins
**Visualize**
- [Packer](https://github.com/wbthomason/packer.nvim) Plugin Manager
- [bufferline](https://github.com/akinsho/bufferline.nvim) Edit Tab
- [lualine](https://github.com/) Status-Bar
- [Markdown](https://github.com/iamcco/markdown-preview.nvim) Markdown Viewer via Web Browse
- [sidebar](https://github.com/sidebar-nvim/sidebar.nvim) SideBar
  
**Others**
- [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens) Enhanced-Search
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter) Show git-diff
  
**LSP & cmp**

## Reference
### Overall
- https://github.com/hisasann/neovim
- https://github.com/craftzdog/dotfiles-public
- [Neovimのすすめ2022年冬](https://blog.mochicat.dev/post/2022/12_13/)
- https://github.com/Nyowa450/Neovim-with-lua
### Feature
- [Neovimで全角スペースをハイライトする](https://zenn.dev/oppara/articles/neovim-highlight-full-width-whitespace)
- [Neovim+LSPをなるべく簡単な設定で構築する](https://zenn.dev/botamotch/articles/21073d78bc68bf)
- [Coc.nvim+init.vimからBuiltin LSP+init.luaに移行しました](https://zenn.dev/fukakusa_kadoma/articles/99e8f3ab855a56)

# Terminal
- Wezterm
- iTerm2

# Terminal
- Wezterm
- iTerm2
