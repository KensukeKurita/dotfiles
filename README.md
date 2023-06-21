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

- `tree-sitter` (you might have installed this.)


**Plugin Install**
1. Start neovim
2. Automatically start installing Packer(PluginManager)
2. Type `:PackerInstall`

**Set Font**  
You must use fonts which include icons previewed in sidebar and statusbar.
1. Get your favorite font via [NerdFont](https://www.nerdfonts.com).
2. Set the font on your terminal (iTerm2 or others).

## Config
### Set config with lua

### Plugins
- [Packer](https://github.com/wbthomason/packer.nvim) Plugin Manager
- [bufferline](https://github.com/akinsho/bufferline.nvim) Edit Tab

## Reference
### Overall
- https://github.com/hisasann/neovim
- https://github.com/craftzdog/dotfiles-public
### Feature
- [Neovimで全角スペースをハイライトする](https://zenn.dev/oppara/articles/neovim-highlight-full-width-whitespace)
- [Neovim+LSPをなるべく簡単な設定で構築する](https://zenn.dev/botamotch/articles/21073d78bc68bf)
