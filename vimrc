call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible

if has("gui_macvim")
    set background=dark
    colorscheme solarized
endif

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif


set hlsearch		" Highlight search term
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden              " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set backspace=indent,eol,start			" backspace for dummys
set linespace=0					        " No extra spaces between rows
set winminheight=0				        " windows can be 0 line high 


" No bells
set visualbell t_vb=
set number		" Line number

" Tabs will be spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set backupdir=~/tmp
set directory=~/tmp
if has("autocmd")
  autocmd FileType html,css,scss,ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType markdown setlocal wrap linebreak nolist
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

" Toggles & Switches (Leader commands) {{{1
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>

" http://stackoverflow.com/questions/2400264/is-it-possible-to-apply-vim-configurations-without-restarting/2400289#2400289
if has("autocmd")
  augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
  augroup END
endif

nnoremap j gj
nnoremap k gk

" Visually select the text that was last edited/pasted
nmap gV `[v`]
nnoremap cn :cn<CR>
nnoremap cp :cp<CR>
nnoremap <C-h> :bp<CR>
nnoremap <C-l> :bn<CR>
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k


" Use system clipboard
set clipboard=unnamed

set nowrap                     			" wrap long lines

let mapleader = ','

" Set cwd from the path of the file being edited
set autochdir

"Use option key in mac as meta key
if has("gui_macvim")
    set macmeta
endif 

set tm=500

" Vimwiki home
let g:vimwiki_list = [{'path': '~/notes/'}]


"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
set wildmenu

" Leave the statusline visible
set laststatus=2
"Delete without clobbering clipboard
noremap x "_x
"Paste without clobbering clipboard in visual mode
vnoremap p "_dP
