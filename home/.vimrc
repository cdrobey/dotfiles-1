" Vim Plug start
call plug#begin('~/.vim/plugged')

" GitHub plugins
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'godlygeek/tabular'
Plug 'hwartig/vim-seeing-is-believing'
Plug 'lifepillar/vim-mucomplete'
Plug 'morhetz/gruvbox'
Plug 'rodjek/vim-puppet'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-syntastic/syntastic'


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

call plug#end()

:so ~/.vimrc.settings
