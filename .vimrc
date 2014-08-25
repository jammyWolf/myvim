" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Jul 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif
""""""""""""""""""""""chenjunmin settings""""""""""""""""""""""""""
"-------------------------------------------basics------------------------->>
set nocompatible
set fileencodings=ucs-bom,utf-8,cp936 "自动识别的文件编码
"behave mswin
"colorscheme desert
let mapleader = ","
set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些 
set nu
inoremap jk <ESC>
autocmd FileType python setlocal et sta sw=4 sts=4
set dy=lastline 
"ctags setting
set tags=tags;
set t_Co=256
"set autochdir
set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
set noexpandtab 
set autoindent 
filetype off
syntax on
filetype plugin on
"mouse pasting
if has('mouse')
	set mouse=a
endif
set clipboard+=unnamed
set clipboard+=unnamedplus
set nobackup
set noswapfile
"-------------------------------------------nerdtree-------------------------->>
"在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
"NERDTree Settings{

autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif
autocmd VimEnter * NERDTree
nnoremap <silent> <C-n> :NERDTreeToggle<cr>
let NERDTreeChDirMode=1
let NERDTreeQuitOnOpen=0
let NERDTreeMinimalUI=1
let NERDChristmasTree=1
let NERDTreeIgnore=['.*\.pyc$']
let NERDTreeIgnore+=['.*\~$']
let NERDTreeIgnore+=['.*\.*swp.*$']
let NERDTreeDirArrows=0
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=0
let NERDTreeCaseSensitiveSort=0
let NERDTreeHighlightCursorline=1
"}silent
"
"---------------------- colortheme ------------------------------------->>
syntax enable
let g:solarized_menu=0
colorscheme zenburn
set background=dark
"call tooglebg#map("<F5>")
let g:solarized_termcolors=256
execute pathogen#infect()
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

"---------------------- python_fold ------------------------------------->>
"set foldmethod=all
set nofoldenable
set clipboard+=unnamed
set ignorecase

"-------------------------------------------taglist-------------------------->>
""快捷键"
noremap <F11> :TlistToggle<CR> 
"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File = 1 
let Tlist_Show_Menu=0
let Tlist_Auto_Open=0
"如果taglist窗口是最后一个窗口，则退出vim"
let Tlist_Exit_OnlyWindow = 1 
"在右侧窗口中显示taglist窗口"
let Tlist_File_Fold_Auto_Close=0
let list_Auto_Open=0
"设置按照名称排序，这样或许找函数名会容易些"
"vim启动时自动打开taglist窗口" 
"打开taglist时焦点自动转到taglist窗口"
let Tlist_GainFocus_On_ToggleOpen=0
"让taglist始终解释文件中的tag，不管taglist窗口有没有打开"
"Tlist_Process_File_Always=1

"ctags --languages=pytho --langmap=c:+.ec:+.py -R
"taglist setting<F8>
"-------------------------------------------encoding-------------------------->>
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,chinese,latin-1
"-------------------------------------------TaskList-------------------------->>
"map <leader>td <Plug>TaskList
"-------------------------------------------History-------------------------->>
"map <leader>g :GundoToggle<CR>
"-------------------------------------------PEP8-------------------------->>
"let g:pep8_map='<leader>8'
"-------------------------------------------git-------------------------->>
"%{fugitive#statusline()}
"if exists('g:loaded_fugitive')
"	set statusline=%<\ %f\ %{fugitive#statusline()}
"endif
""""""""""""""""""""""django nose""""""""""""""""""""""""""
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>
"""""""""""""""""""""py.test""""""""""""""""""""""""""
"Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>
"""""""""""""""""""""virtualenv""""""""""""""""""""""""""
""Add the virtualenv's site-packages to vim path
"py << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    sys.path.insert(0, project_base_dir)
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    execfile(activate_this, dict(__file__=activate_this))
"EOF
""""""""""""""""""""ack searching""""""""""""""""""""""""""
"nmap <leader>a <Esc>:Ack!
""""""""""""""""""""""chenjunmin_sx settings""""""""""""""""""""""""""
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
"set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
autocmd FileType text setlocal textwidth=78
