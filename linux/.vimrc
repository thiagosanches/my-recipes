call plug#begin()
Plug 'tomasiser/vim-code-dark'
Plug 'leshill/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-markdown'
Plug 'preservim/nerdtree'
call plug#end()

colorscheme codedark
syntax on " Syntax highlighting
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?
set virtualedit+=block

autocmd VimEnter * NERDTree
