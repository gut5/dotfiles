colorscheme slate

set hidden relativenumber hlsearch smartcase incsearch number noswapfile nobackup termguicolors smartindent foldmethod=indent

nnoremap ; :
nnoremap : ;

" Bootstrap Plug
let autoload_plug_path = stdpath('config') . '/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs 
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path

call plug#begin(stdpath('data') . '/plugged')
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ }

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" for RLS
" nvim +PlugInstall +UpdateRemotePlugins +qa
