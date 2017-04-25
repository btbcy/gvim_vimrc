"let Vundle manage Plugin
set rtp+=$VIM\bundle\Vundle.vim\
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
" Plugin 'w0rp/ale'
" Plugin 'ervandew/supertab'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/neocomplete.vim'
Plugin 'majutsushi/tagbar'
" Plugin 'SirVer/ultisnips'
Plugin 'godlygeek/tabular'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'orenhe/pylint.vim'
" Plugin 'kevinw/pyflakes-vim'
 
call vundle#end()
filetype plugin indent on

set backspace=indent,eol,start
set nu
syntax enable
syntax on
set cursorline
" makefile must comment 
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set ignorecase
set showcmd
set novisualbell
set fileencoding=utf-8
set fileencodings=utf-8
set lines=30 columns=110

let mapleader=","

inoremap jj		<ESC>
inoremap ff		<END>
map		 ff		<END>
inoremap fj     <Right>
inoremap jf     <Left>
inoremap <C-h>  <Left>
inoremap <C-l>  <Right>
inoremap {		{<CR><CR>}<ESC>kI
inoremap (        ()<LEFT>
inoremap [        []<LEFT>
inoremap "        ""<LEFT>
inoremap '        ''<LEFT>

map		 <leader>q	:q<CR>
map      <CR>   i<CR><ESC>

" 全選+複製
map		<C-A>		ggVGY
map!	<C-A><ESC>	ggVGY

" <F10> (<F12>) 跳轉tab
map  <F10>	:tabp<CR>
imap <F10>	<Esc>:tabp<CR>
map  <F12>	:tabn<CR>
imap <F12>	<Esc>:tabn<CR>

" ,s 保存
func! SaveFile()
	exec "w"
endfunc
map <leader>s :call SaveFile()<CR>
imap <leader>s <ESC>:call SaveFile()<CR>
vmap <leader>s <ESC>:call SaveFile()<CR>

" appearance
set t_Co=256
"colorscheme molokai_darkBackground
colorscheme molokai_M2
set guifont=Consolas:h12.5
" set guioptions-=m " remove menu bar
set guioptions-=T " remove toolbar
set guioptions-=r " remove right-hand scroll bar
set guioptions-=L " remove left hand scroll bar

" vim-ariline
set laststatus=2

" Nerdtree
nmap <leader>nt :NERDTree<CR>
let NERDTreeWinsize=20
let NERDWinPos='Left'

" tagbar
nmap <F5>       :!ctags -R
nmap <leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin='D:\Program Files (x86)\Vim\vim80\ctags58\ctags.exe'
let g:tagbar_autofocus=1
let g:tagbar_width=30

" tabular 
nmap <leader>ta :Tab/
nmap <leader>te :Tab/=<CR>

" easymotion
let g:Easymotion_leader_key=','

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<tab>"
let g:UltiSnipsSnippetDirectories=["snippetsfj", "bundle/ultisnips/UltiSnips"]

" ALE
" let g:ale_sign_column_always=1
" let g:ale_set_hightlights=0
" let g:ale_sign_error='X'
" let g:ale_sign_warning='>'
" let g:ale_statusline_format=['X %d', '> %d', 'v ok']
" location list

" Syntastic
let g:syntastic_error_symbol='X'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_hightlighting=1
let g:syntastic_cpp_include_dirs=['C:\Program Files (x86)\CodeBlocks\MinGW\lib\gcc\mingw32\4.7.1\include\c++']
let g:syntastic_cpp_remove_include_errors=1
let g:syntastic_cpp_check_header=1
let g:syntastic_cpp_compiler_options='-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons=1
let g:syntastic_python_checkers=['pylint']
let g:syntastic_python_pylint_args='--disable=c0111,r0903,c0301'

" Pylint
let g:pylint_onwrite = 0
autocmd FileType python compiler pylint

" Pyflakes
filetype on
filetype plugin on
highlight SpellBad term=reverse ctermbg=1

" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() . "<Space>" : "\<Space>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" close windows by <F8>
nmap <F8> :lclose<CR>

