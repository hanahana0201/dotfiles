" General {{{
syntax enable

" encoding
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8

" indent
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set shiftwidth=2
set pastetoggle=<F2>

" finding string
set incsearch
set ignorecase
set smartcase
set hlsearch

" cursor settings
set number
set backspace=indent,eol,start
set showmatch matchtime=1
source $VIMRUNTIME/macros/matchit.vim

" etc
set wildmenu
set nowritebackup
set nobackup
set virtualedit=block
set ambiwidth=double
set noerrorbells
set shellslash
set laststatus=2
set showcmd
set noswapfile
set title
set number
set noundofile
:set clipboard+=unnamed
:filetype on

" alias jj for <Esc>
inoremap <silent> jj <ESC>
" }}}

" Keymap & leader {{{
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :wq<CR>
nnoremap <Leader>fq :q!<CR>
nmap <Leader><Leader> V
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
map q: :q
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <silent> jj <ESC>
nnoremap <Leader>l :ls<CR>
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>
nnoremap <Leader>b :b
nnoremap <Leader>o :CtrlP<CR>

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
" }}}

" Vim-Plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'tomtom/tcomment_vim'
Plug 'arcticicestudio/nord-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'terryma/vim-expand-region'
Plug 'vim-airline/vim-airline'
Plug 'Shougo/denite.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'aliev/vim-compiler-python'
Plug 'nixprime/cpsm'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"*****************************************************************************
"" Custom bundles
"*****************************************************************************
" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'
" javascript
"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'
" php
"" PHP Bundle
Plug 'arnaud-lb/vim-php-namespace'
" python
"" Python Bundle
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
" ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring'
"*****************************************************************************
"*****************************************************************************
call plug#end()
colorscheme nord

" tcomment
vmap <silent> <Leader>cc gcc

" airline {{{
set laststatus=2
" Show branch name
let g:airline#extensions#branch#enabled = 1
" Show buffer's filename
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{&filetype}'
let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
let g:airline#extensions#ale#error_symbol = '? '
let g:airline#extensions#ale#warning_symbol = '? '
let g:airline#extensions#default#section_truncate_width = {}
" Check whitespace at end of line
let g:airline#extensions#whitespace#enabled = 1
" }}}

let g:python3_host_prog = expand('/Users/macmini_2018/.pyenv/shims/python3')

" easymotion{{{
let g:EasyMotion_do_mapping = 0
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-bd-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  t <Plug>(easymotion-bd-w)
nmap t <Plug>(easymotion-overwin-w)

" vim-test
augroup MyErrorFormat
  autocmd!
  autocmd BufNewFile,BufRead *.py
        \ setlocal errorformat=%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
augroup END
let g:test#strategy = 'dispatch'
let g:test#preserve_screen = 1
let test#python#runner = 'pytest'
"test when saving file
"augroup test
"  autocmd!
"  autocmd BufWrite * if test#exists() |
"        \   TestFile |
"        \ endif
"augroup END
map <Leader>v :TestFile<CR>
map <Leader>a :TestSuite<CR>
" }}}

" denite.vim
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
nnoremap [denite] <Nop>
nmap <C-d> [denite]

if executable('rg')
  call denite#custom#var('file_rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg'])
endif


" ファイル一覧

call denite#custom#var('file_rec', 'command', ['rg', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('file_rec', 'matchers', ['matcher_regexp'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ ['.git/', '__pycache__/', '*.o', '*.make', '*.min.*'])

nmap <silent> [denite]<C-f> :<C-u>Denite -auto_preview -mode=normal file_rec<CR>

" ディレクトリ一覧
noremap [denite]<C-d> :<C-u>Denite directory_rec<CR>
noremap [denite]<C-c> :<C-u>Denite directory_rec -default-action=cd<CR>

" grep
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

nnoremap <silent> [denite]<C-g> :<C-u>Denite grep -auto_preview -mode=normal<CR>
nnoremap <silent> [denite]<C-r> :<C-u>Denite -resume<CR>
nnoremap <silent> [denite]<C-n> :<C-u>Denite -resume -cursor-pos=+1 -immediately<CR>
nnoremap <silent> [denite]<C-p> :<C-u>Denite -resume -cursor-pos=-1 -immediately<CR>


"現在開いているファイルのディレクトリ下のファイル一覧。
nnoremap <silent> [denite]f :<C-u>DeniteBufferDir
      \ -direction=topleft -auto_preview -cursor-wrap=true file file:new<CR>
"バッファ一覧
nnoremap <silent> [denite]b :<C-u>Denite -direction=topleft -cursor-wrap=true buffer<CR>
"レジスタ一覧
noremap <silent> [denite]r :<C-u>Denite -direction=topleft -cursor-wrap=true -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [denite]m :<C-u>Denite -direction=topleft -cursor-wrap=true file_mru<CR>

" jj で denite/insert を抜けるようにする
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>')

" 移動
call denite#custom#map('normal', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('normal', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('normal', '<C-u>', '<denite:move_up_path>', 'noremap')
call denite#custom#map('insert', '<C-u>', '<denite:move_up_path>', 'noremap')


call denite#custom#source('file'    , 'matchers', ['matcher_cpsm'])
" 
call denite#custom#source('buffer'  , 'matchers', ['matcher_cpsm'])
call denite#custom#source('file_mru', 'matchers', ['matcher_cpsm'])
nnoremap <silent> ;r :<C-u>Denite -buffer-name=search -resume -mode=normal<CR>



" defx.nvim{{{
autocmd FileType defx call s:defx_my_settings()
    function! s:defx_my_settings() abort
     " Define mappings
      nnoremap <silent><buffer><expr> <CR>
     \ defx#do_action('open')
      nnoremap <silent><buffer><expr> c
     \ defx#do_action('copy')
      nnoremap <silent><buffer><expr> m
     \ defx#do_action('move')
      nnoremap <silent><buffer><expr> p
     \ defx#do_action('paste')
      nnoremap <silent><buffer><expr> l
     \ defx#do_action('open')
      nnoremap <silent><buffer><expr> E
     \ defx#do_action('open', 'vsplit')
      nnoremap <silent><buffer><expr> P
     \ defx#do_action('open', 'pedit')
      nnoremap <silent><buffer><expr> K
     \ defx#do_action('new_directory')
      nnoremap <silent><buffer><expr> N
     \ defx#do_action('new_file')
      nnoremap <silent><buffer><expr> d
     \ defx#do_action('remove')
      nnoremap <silent><buffer><expr> r
     \ defx#do_action('rename')
      nnoremap <silent><buffer><expr> x
     \ defx#do_action('execute_system')
      nnoremap <silent><buffer><expr> yy
     \ defx#do_action('yank_path')
      nnoremap <silent><buffer><expr> .
     \ defx#do_action('toggle_ignored_files')
      nnoremap <silent><buffer><expr> h
     \ defx#do_action('cd', ['..'])
      nnoremap <silent><buffer><expr> ~
     \ defx#do_action('cd')
      nnoremap <silent><buffer><expr> q
     \ defx#do_action('quit')
      nnoremap <silent><buffer><expr> <Space>
     \ defx#do_action('toggle_select') . 'j'
      nnoremap <silent><buffer><expr> *
     \ defx#do_action('toggle_select_all')
      nnoremap <silent><buffer><expr> j
     \ line('.') == line('$') ? 'gg' : 'j'
      nnoremap <silent><buffer><expr> k
     \ line('.') == 1 ? 'G' : 'k'
      nnoremap <silent><buffer><expr> <C-l>
     \ defx#do_action('redraw')
      nnoremap <silent><buffer><expr> <C-g>
     \ defx#do_action('print')
      nnoremap <silent><buffer><expr> cd
     \ defx#do_action('change_vim_cwd')
    endfunction
" }}}
