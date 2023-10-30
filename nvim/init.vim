let mapleader = ","

lua require("plugins")
lua require("lsp")
lua require("treesitter")
lua require("tscope")
lua require("nvimtree")

" Reload my vimrc file whenever I pressed ,sv
nnoremap <leader>sv :source $MYVIMRC<cr>

"load system defaults
if filereadable(expand('$VIMRUNTIME/defaults.vim'))
	unlet! g:skip_defaults_vim
	source $VIMRUNTIME/defaults.vim
endif

"regular settings
"----------------
" ui
set number
set ruler
set wildmenu
set showcmd
set showmatch

" encoding/format
set encoding=utf-8
set fileformats=unix,dos,mac

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" indent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent

" key timeout values
set ttimeoutlen=20
set timeoutlen=1000

" allow syntax and filetype plugins
syntax enable
filetype plugin indent on
runtime macros/matchit.vim

" autocmds
"---------
augroup general
    autocmd!
    "keep equal proportions when windows resized
    autocmd VimResized * wincmd =
    "save cursor position in a file
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"")
                \ <= line("$") | exe "normal! g'\"" | endif
augroup END

augroup languages
    autocmd!
    autocmd BufNewFile,BufRead *.bash set syntax=sh
    autocmd FileType python xnoremap <leader>r <esc>:'<,'>:w !python3<CR>
    autocmd FileType go set noexpandtab
    autocmd FileType html :syntax sync fromstart
    autocmd FileType html,javascript,css,json,yaml,sh
                \ setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif
set background=light


" quickfix prev, next
map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

nmap <leader>t <Plug>PlenaryTestFile

map <leader>c "+y<CR>
" initialize the colorscheme for the first run
call ChangeBackground()
nnoremap <leader>fm <cmd>Telescope funkmotion<cr>

nnoremap <leader>rt <cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>
nnoremap <leader>rn <cmd>lua require("neotest").run.run()<cr>
nnoremap <leader>ro <cmd>lua require("neotest").output.open({ enter = true })<cr>
nnoremap <leader>rp <cmd>lua require("neotest").output_panel.toggle({ last_run = true, enter = true })<cr>

nnoremap <leader>nf <cmd>NvimTreeFindFile<cr>

