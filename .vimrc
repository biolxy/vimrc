"允许插件
filetype plugin on
"代码补全 
set completeopt=menu
" 显示状态栏 (默认值为 1, 无法显示状态栏)
set laststatus=2
"显示括号配对情况
set showmatch
" 设置在状态行显示的信息
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)

" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif

" 设置当文件被改动时自动载入
set autoread

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" 配色方案
set t_Co=256
"set background=dark
"colorscheme solarized
colorscheme molokai
"colorscheme phd

" 高亮显示当前行/列
"set cursorline
"set cursorcolumn

"语法高亮
syntax enable
syntax on

set hlsearch
set modeline
"encoding
set fileencodings=gbk
set termencoding=utf-8

" 自适应不同语言的智能缩进
filetype indent on
" " 将制表符扩展为空格
"set expandtab
"设置编辑时制表符占用空格数
set tabstop=4
" " 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

set smarttab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>>>
" 插件安装
" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'vim-syntastic/syntastic'
Plugin 'ervandew/supertab'
Plugin 'jiangmiao/auto-pairs'
Plugin 'luochen1990/rainbow'
Plugin 'davidhalter/jedi-vim'
"Plugin 'w0rp/ale'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Lokaltog/vim-powerline'
" 插件列表结束
call vundle#end()
filetype plugin indent on
" <<<<
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




"ues F2 to control nonumber "
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
nnoremap <F3> :set list!<CR>
" 设置 F10 允许粘贴
set pastetoggle=<F10>
"列出当前目录文件  
map <F4> :tabnew .<CR>  
"打开树状文件目录  
map <C-F4> \be
set autoindent
set backspace=2
set showcmd
set cmdheight=1
set foldenable
set showcmd
set history=1000
set ignorecase
" 光标移动到buffer的顶部和底部时保持3行距离 
set scrolloff=3
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C C++ 编译
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc
map <F5> :call CompileRunGcc()<CR>

"C,C++的调试
map <F6> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"New .c,.h,.sh,.java file and automatically inserted into the file header
autocmd BufNewFile .cpp,*.[ch],*.sh,*.java,*py,*.pl exec ":call SetTitle()"
"""*
func SetTitle()
		if &filetype == 'sh'
			call setline(1,"\##################################################")
			call append(line("."),"\# File Name     : ".expand("%"))
			call append(line(".")+1,"\# Author      : biolxy")
			call append(line(".")+2,"\# E-mail      : biolxy@aliyun.com")
			call append(line(".")+3,"\# Created Time: ".strftime("%c"))
			call append(line(".")+4,"\##################################################")
			call append(line(".")+5,"\#!/bin/bash")
			call append(line(".")+6,"")
		endif
		if &filetype == 'cpp'
			call setline( 1, "******************************************************************")
			call append(line("."), "	> File Name     : ".expand("%"))
			call append(line(".")+1, "	> Author      : biolxy")
			call append(line(".")+2, "	> Mail        : biolxy@aliyun.com ")
			call append(line(".")+3, "	> Created Time: ".strftime("%c"))
			call append(line(".")+4, "******************************************************************")
			call append(line(".")+5, "#include<iostream>")
			call append(line(".")+6, "using namespace std;")
			call append(line(".")+7, "")
		endif
		if &filetype == 'c'
			call setline( 1, "\/******************************************************************")
			call append(line("."), "	> File Name     : ".expand("%"))
			call append(line(".")+1, "	> Author      : biolxy")
			call append(line(".")+2, "	> Mail        : biolxy@aliyun.com ")
			call append(line(".")+3, "	> Created Time: ".strftime("%c"))
			call append(line(".")+4, "******************************************************************/")
			call append(line(".")+5, "#include<stdio.h>")
			call append(line(".")+6, "")
			call append(line(".")+7, "int main()")
			call append(line(".")+8, "{")
			call append(line(".")+9, "	\/* 备注： *\/")
			call append(line(".")+10, "	")
			call append(line(".")+11, "	return 0;")
			call append(line(".")+12, "}")
		endif
		if &filetype == 'python'
			call setline(1,"\#!/usr/bin/env python")
			call append(line("."),"\# -*- coding: utf-8 -*-")
			call append(line(".")+1,"\u\"\"\"")
			call append(line(".")+2,"\File Name   : ".expand("%").expand(" \."))
			call append(line(".")+3,"")
			call append(line(".")+4,"\Author      : biolxy")
			call append(line(".")+5,"\E-mail      : biolxy@aliyun.com")
			call append(line(".")+6,"\Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
			call append(line(".")+7,"\version     : 1.0")
			call append(line(".")+8,"\Function    : The author is too lazy to write nothing")
			call append(line(".")+9,"\"\"\"")
			call append(line(".")+10,"")
		endif
		if &filetype == 'perl'
			call setline(1,"\##################################################")
			call append(line("."),"\# File Name     :".expand("%"))
			call append(line(".")+1,"\# Author      : biolxy")
			call append(line(".")+2,"\# E-mail      :biolxy@aliyun.com")
			call append(line(".")+3,"\# Created Time:".strftime("%c"))
			call append(line(".")+4,"\##################################################")
			call append(line(".")+5,"\#!/usr/bin/perl")
			call append(line(".")+6,"\use strict;")
			call append(line(".")+7,"\use warnings;")
			call append(line(".")+8,"")
		endif
endfunc
autocmd BufNewFile * normal G
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
