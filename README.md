## About

Plumb.vim is a pattern based invocation plugin for Vim/Neovim.

## Requirements

* Vim 7.4 or above or NeoVim.

## Quick start

```.viml
"Pass word under cursor to the plumber
nmap <leader>p "zyiW:call plumb#exec('<c-r>z') <CR>
"Pass selected text to the plumber
vmap <leader>p "zy:call plumb#exec(@z) <CR>
```
