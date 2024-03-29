let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

" -----------------------------------------------------------------------------
"  < 判断是终端还是 Gvim >
" -----------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

"允许插件
filetype plugin on
"代码补全 
set completeopt=menu
" 显示状态栏 (默认值为 1, 无法显示状态栏)
set laststatus=2
"显示括号配对情况
set showmatch

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
" set background=dark
" colorscheme solarized
colorscheme molokai
" colorscheme Tomorrow-Night-Eighties
" colorscheme phd

" 高亮显示当前行/列
set cursorline
" set cursorcolumn

"语法高亮
syntax enable
syntax on

"set hlsearch
set modeline
"encoding
set fileencodings=gbk
set termencoding=utf-8

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
set smartindent                                       "启用智能对齐方式
" 当文件在外部被修改，自动更新该文件
set autoread
" 常规模式下输入 cM 清除行尾 ^M 符号
nmap cM :%s/\r$//g<CR>:noh<CR>
" 启用每行超过80列的字符提示（字体变蓝并加下划线），不启用就注释掉
" au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
" 高亮括号与运算符等
" https://github.com/vim-scripts/cSyntaxAfter/blob/master/plugin/cSyntaxAfter.vim
au! BufRead,BufNewFile,BufEnter *.{c,cpp,h,java,javascript} call CSyntaxAfter()
function! CSyntaxAfter()
    syntax keyword Boolean true false NULL TRUE FALSE
    syntax keyword Statement namespace stderr stdin stdout new this delete
    syntax match _Block "[{}]"
    syntax match _Bracket "[\[\]]"
    syntax match _Operator "[-+&|<>=!\/~.,;:*%&^?()]"
    syntax region _Comment start="\/\*" end="\*\/"
    syntax match _Comment "\/\/.*$"

    hi _Block guifg=yellow1 guibg=NONE gui=none
    hi link _Bracket Constant
    hi link _Operator Operator
    hi link _Comment Comment
endfunction


" 使用鼠标
set mouse=a

" 表示一个 tab 显示出来是多少个空格，默认 8
set tabstop=4
" 每一级缩进是多少个空格
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 根据文件中其他地方的缩进空格个数来确定一个 tab 是多少个空格
set smarttab
" 使用 autocmd 为不同的文件类型应用不同的 tab 设置
" autocmd BufNewFile,BufRead *.cpp , *.perl ,*.py,  *.python , *.c , *.sh  set expandtab tabstop=4 shiftwidth=4
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
Plugin 'Shougo/neocomplete.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'Valloric/YouCompleteMe'
" 插件列表结束
call vundle#end()
filetype plugin indent on
" <<<<
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set autoindent
set backspace=2
set showcmd
set cmdheight=1
set foldenable
set showcmd
set history=1000
" set ignorecase 
" 忽视大小写
" 光标移动到buffer的顶部和底部时保持3行距离 
set scrolloff=3
" set mapleader vim 注释插件 nerdcommenter
" ,cc 注释   ,cu 或者 ,c<space> 取消注释
let mapleader = ","
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

au BufNewFile,BufRead *.py
    \ set tabstop=4     |
    \ set softtabstop=4     |
    \ set shiftwidth=4     |
    \ set textwidth=79     |
    \ set expandtab     |
    \ set autoindent     |
    \ set fileformat=unix

" YouCompleteMe  
set tags+=/usr/include/c++/4.8/stdcpp.tags
set pythonthreedll=/data/software/ONCO/anaconda3/envs/py35/lib/libpython3.5m.so
set pythondll=/data/software/anaconda2/lib/libpython2.7.so
let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"] 
let g:ycm_server_python_interpreter='/data/software/bin/python3' 
let g:ycm_global_ycm_extra_conf='/data/home/lixiangyong/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" 让Vim的补全菜单行为与一般IDE一致  
set completeopt=longest,menu
" 离开插入模式后自动关闭预览窗口  
autocmd InsertLeave * if pumvisible() == 0|pclose|endif 
let g:ycm_min_num_of_chars_for_completion       =  2         " 触发(符号)补全时需要键入的字符数
let g:ycm_min_num_identifier_candidate_chars    =  0         " 补全候选项的最小字符数
let g:ycm_show_diagnostics_ui                   =  0         " 关闭诊断显示功能(已经使用了ale进行异步语法检查)
let g:ycm_complete_in_comments                  =  1         " 在注释中仍会触发补全
let g:ycm_complete_in_strings                   =  1         " 在字符串中也会触发补全
let g:ycm_cache_omnifunc                        =  0         " 禁止缓存匹配项，每次都重新生成匹配项

" 自动触发语义补全
let g:ycm_semantic_triggers =  { 
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{1}'],
            \ 'cs,lua,javascript': ['re!\w{1}'],
            \ }
" 遇到下列文件时才会开启YCM
let g:ycm_filetype_whitelist = { 
            \ "c":1,
            \ "cpp":1,
            \ "objc":1,
            \ "sh":1,
            \ }

" 跳转到声明或定义处
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<cr>
"缩进指示线"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C C++ 编译
" func! CompileRunGcc()
"     exec "w"
"     if &filetype == 'c'
"         exec "!gcc % -o %< -lm"
"         exec "! ./%<"
"     elseif &filetype == 'cpp'
"         exec "!g++ -std=c++11 % -o %<"
"         exec "! ./%<"
"     elseif &filetype == 'java' 
"         exec "!javac %" 
"         exec "!java %<"
"     elseif &filetype == 'sh'
"         :!./%
"     endif
" endfunc

" func! CompileDebugGcc()
"     exec "w"
"     if &filetype == 'c'
"         exec "!gcc % -o %< -lm"
"         exec "!gdb ./%<"
"     elseif &filetype == 'cpp'
"         exec "!g++ -std=c++11 % -o %<"
"         exec "!gdb ./%<"
"     endif
" endfunc



" map <F5> :call CompileRunGcc()<CR>
" map <F7> :call CompileDebugGcc()<CR>
" " nnoremap <F5>   <Esc>:w<CR>:!g++ -std=c++11 % -o %< -lm  && %< <CR>
" " nnoremap <F7>   <Esc>:w<CR>:!g++ -std=c++11 % <CR>
" " nnoremap <F6>   <Esc>:w<CR>:!g++ -std=c++11 -g % -o /tmp/a.out && gdb /tmp/a.out<CR>
" "C,C++的调试
" map <F6> :call Rungdb()<CR>
" func! Rungdb()
"     exec "w"
"     exec "!g++ % -g -o %<"
"     exec "!gdb ./%<"
" endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"New .c,.h,.sh,.java file and automatically inserted into the file header
autocmd BufNewFile .cpp,*.[ch],*.sh,*.java,*py,*.pl exec ":call SetTitle()"
"""*


func SetTitle()
        if &filetype == 'sh'
            call setline(1,"\#!/bin/bash")
            call append(line("."),"\##################################################")
            call append(line(".")+1,"\# File Name   : ".expand("%"))
            call append(line(".")+2,"\# Author      : biolxy")
            call append(line(".")+3,"\# E-mail      : biolxy@aliyun.com")
            call append(line(".")+4,"\# Created Time: ".strftime("%c"))
            call append(line(".")+5,"\##################################################")
            call append(line(".")+6,"")
        endif
        if &filetype == 'cpp'
            call setline( 1, "\/******************************************************************")
            call append(line("."), "    > File Name     : ".expand("%"))
            call append(line(".")+1, "    > Author      : biolxy")
            call append(line(".")+2, "    > Mail        : biolxy@aliyun.com ")
            call append(line(".")+3, "    > Created Time: ".strftime("%c"))
            call append(line(".")+4, "******************************************************************")
            call append(line(".")+5, "#include<iostream>")
            call append(line(".")+6, "using namespace std;")
            call append(line(".")+7, "")
        endif
        if &filetype == 'c'
            call setline( 1, "\/******************************************************************")
            call append(line("."), "    > File Name     : ".expand("%"))
            call append(line(".")+1, "    > Author      : biolxy")
            call append(line(".")+2, "    > Mail        : biolxy@aliyun.com ")
            call append(line(".")+3, "    > Created Time: ".strftime("%c"))
            call append(line(".")+4, "******************************************************************\/")
            call append(line(".")+5, "#include<stdio.h>")
            call append(line(".")+6, "")
            call append(line(".")+7, "int main()")
            call append(line(".")+8, "{")
            call append(line(".")+9, "    \/* 备注： *\/")
            call append(line(".")+10, "    ")
            call append(line(".")+11, "    return 0;")
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
            call append(line(".")+9,"\Usage       :")
            call append(line(".")+10,"\"\"\"")
            call append(line(".")+11,"")
        endif
        if &filetype == 'perl'
            call setline(1,"\#!/usr/bin/perl")
            call append(line("."),"\##################################################")
            call append(line(".")+1,"\# File Name       :".expand("%"))
            call append(line(".")+2,"\# Author          : biolxy")
            call append(line(".")+3,"\# E-mail          :biolxy@aliyun.com")
            call append(line(".")+4,"\# Created Time    :".strftime("%c"))
            call append(line(".")+5,"\##################################################")
            call append(line(".")+6,"\use strict;")
            call append(line(".")+7,"\use warnings;")
            call append(line(".")+8,"")
        endif
endfunc
autocmd BufNewFile * normal G
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"ues F2 to control nonumber "
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
nnoremap <F3> :set list!<CR>
" 设置 F10 允许粘贴
set pastetoggle=<F10>
"列出当前目录文件  
map <F4> :tabnew .<CR>  
"打开树状文件目录
map <C-F4> \be
" -----------------------------------------------------------------------------
"  < 编译、连接、运行配置 (目前只配置了C、C++、Java语言)>
"  https://github.com/13570248114/vim_for_linux/blob/master/.vimrc
" -----------------------------------------------------------------------------
" F5 一键保存、编译、连接存并运行
nmap <F5> :call Run()<CR>
imap <F5> <ESC>:call Run()<CR>

" Ctrl + F5 一键保存并编译
nmap <c-F5> :call Compile()<CR>
imap <c-F5> <ESC>:call Compile()<CR>

"C,C++的调试
map <F6> :call Rungdb()<CR>
imap <F6> <ESC>:call Rungdb()<CR>

" Ctrl + F6 一键保存并连接
nmap <c-F6> :call Link()<CR>
imap <c-F6> <ESC>:call Link()<CR>
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

let s:LastShellReturn_C = 0
let s:LastShellReturn_L = 0
let s:ShowWarning = 1
let s:Obj_Extension = '.o'
let s:Exe_Extension = '.exe'
let s:Class_Extension = '.class'
let s:Sou_Error = 0

let s:windows_CFlags = 'gcc\ -fexec-charset=gbk\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'
let s:linux_CFlags = 'gcc\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'

let s:windows_CPPFlags = 'g++\ -fexec-charset=gbk\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'
let s:linux_CPPFlags = 'g++\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'

let s:JavaFlags = 'javac\ %'

func! Compile()
    exe ":w"
    exe ":ccl"
    exe ":update"
    let s:Sou_Error = 0
    let s:LastShellReturn_C = 0
    let Sou = expand("%:p")
    let v:statusmsg = ''
    if expand("%:e") == "c" || expand("%:e") == "cpp" || expand("%:e") == "cxx"
        let Obj = expand("%:p:r").s:Obj_Extension
        let Obj_Name = expand("%:p:t:r").s:Obj_Extension
        if !filereadable(Obj) || (filereadable(Obj) && (getftime(Obj) < getftime(Sou)))
            redraw!
            if expand("%:e") == "c"
                if g:iswindows
                    exe ":setlocal makeprg=".s:windows_CFlags
                else
                    exe ":setlocal makeprg=".s:linux_CFlags
                endif
                echohl WarningMsg | echo " compiling..."
                silent make
            elseif expand("%:e") == "cpp" || expand("%:e") == "cxx"
                if g:iswindows
                    exe ":setlocal makeprg=".s:windows_CPPFlags
                else
                    exe ":setlocal makeprg=".s:linux_CPPFlags
                endif
                echohl WarningMsg | echo " compiling..."
                silent make
            endif
            redraw!
            if v:shell_error != 0
                let s:LastShellReturn_C = v:shell_error
            endif
            if g:iswindows
                if s:LastShellReturn_C != 0
                    exe ":bo cope"
                    echohl WarningMsg | echo " compilation failed"
                else
                    if s:ShowWarning
                        exe ":bo cw"
                    endif
                    echohl WarningMsg | echo " compilation successful"
                endif
            else
                if empty(v:statusmsg)
                    echohl WarningMsg | echo " compilation successful"
                else
                    exe ":bo cope"
                endif
            endif
        else
            echohl WarningMsg | echo ""Obj_Name"is up to date"
        endif
    elseif expand("%:e") == "java"
        let class = expand("%:p:r").s:Class_Extension
        let class_Name = expand("%:p:t:r").s:Class_Extension
        if !filereadable(class) || (filereadable(class) && (getftime(class) < getftime(Sou)))
            redraw!
            exe ":setlocal makeprg=".s:JavaFlags
            echohl WarningMsg | echo " compiling..."
            silent make
            redraw!
            if v:shell_error != 0
                let s:LastShellReturn_C = v:shell_error
            endif
            if g:iswindows
                if s:LastShellReturn_C != 0
                    exe ":bo cope"
                    echohl WarningMsg | echo " compilation failed"
                else
                    if s:ShowWarning
                        exe ":bo cw"
                    endif
                    echohl WarningMsg | echo " compilation successful"
                endif
            else
                if empty(v:statusmsg)
                    echohl WarningMsg | echo " compilation successful"
                else
                    exe ":bo cope"
                endif
            endif
        else
            echohl WarningMsg | echo ""class_Name"is up to date"
        endif
    else
        let s:Sou_Error = 1
        echohl WarningMsg | echo " please choose the correct source file"
    endif
    exe ":setlocal makeprg=make"
endfunc

func! Link()
    call Compile()
    if s:Sou_Error || s:LastShellReturn_C != 0
        return
    endif
    if expand("%:e") == "c" || expand("%:e") == "cpp" || expand("%:e") == "cxx"
        let s:LastShellReturn_L = 0
        let Sou = expand("%:p")
        let Obj = expand("%:p:r").s:Obj_Extension
        if g:iswindows
            let Exe = expand("%:p:r").s:Exe_Extension
            let Exe_Name = expand("%:p:t:r").s:Exe_Extension
        else
            let Exe = expand("%:p:r")
            let Exe_Name = expand("%:p:t:r")
        endif
        let v:statusmsg = ''
        if filereadable(Obj) && (getftime(Obj) >= getftime(Sou))
            redraw!
            if !executable(Exe) || (executable(Exe) && getftime(Exe) < getftime(Obj))
                if expand("%:e") == "c"
                    setlocal makeprg=gcc\ -o\ %<\ %<.o
                    echohl WarningMsg | echo " linking..."
                    silent make
                elseif expand("%:e") == "cpp" || expand("%:e") == "cxx"
                    setlocal makeprg=g++\ -o\ %<\ %<.o
                    echohl WarningMsg | echo " linking..."
                    silent make
                endif
                redraw!
                if v:shell_error != 0
                    let s:LastShellReturn_L = v:shell_error
                endif
                if g:iswindows
                    if s:LastShellReturn_L != 0
                        exe ":bo cope"
                        echohl WarningMsg | echo " linking failed"
                    else
                        if s:ShowWarning
                            exe ":bo cw"
                        endif
                        echohl WarningMsg | echo " linking successful"
                    endif
                else
                    if empty(v:statusmsg)
                        echohl WarningMsg | echo " linking successful"
                    else
                        exe ":bo cope"
                    endif
                endif
            else
                echohl WarningMsg | echo ""Exe_Name"is up to date"
            endif
        endif
        setlocal makeprg=make
    elseif expand("%:e") == "java"
        return
    endif
endfunc

func! Run() 
    if expand("%:e") == "py"
        exe ":w"
        exe ":!python %"
        return
    endif

    let s:ShowWarning = 0
    call Link()
    let s:ShowWarning = 1
    if s:Sou_Error || s:LastShellReturn_C != 0 || s:LastShellReturn_L != 0
        return
    endif
    let Sou = expand("%:p")
    if expand("%:e") == "c" || expand("%:e") == "cpp" || expand("%:e") == "cxx"
        let Obj = expand("%:p:r").s:Obj_Extension
        if g:iswindows
            let Exe = expand("%:p:r").s:Exe_Extension
        else
            let Exe = expand("%:p:r")
        endif
        if executable(Exe) && getftime(Exe) >= getftime(Obj) && getftime(Obj) >= getftime(Sou)
            redraw!
            echohl WarningMsg | echo " running..."
            if g:iswindows
                exe ":!%<.exe"
            else
                if g:isGUI
                    exe ":!gnome-terminal -x bash -c './%<; echo; echo 请按 Enter 键继续; read'"
                else
                    exe ":!clear; ./%<"
                endif
            endif
            redraw!
            echohl WarningMsg | echo " running finish"
        endif
    elseif expand("%:e") == "java"
        let class = expand("%:p:r").s:Class_Extension
        if getftime(class) >= getftime(Sou)
            redraw!
            echohl WarningMsg | echo " running..."
            if g:iswindows
                exe ":!java %<"
            else
                if g:isGUI
                    exe ":!gnome-terminal -x bash -c 'java %<; echo; echo 请按 Enter 键继续; read'"
                else
                    exe ":!clear; java %<"
                endif
            endif
            redraw!
            echohl WarningMsg | echo " running finish"
        endif
    endif
endfunc

func! Rungdb()
    if g:islinux
        if expand("%:e") == "c" || expand("%:e") == "cpp" || expand("%:e") == "cxx"
            call Link()
            exec "!gdb ./%<"
        else
            echohl WarningMsg | echo " only .c,.cpp or .cxx file can use gdb"
        endif
    else
        echohl WarningMsg | echo " gdb must be called in Linux"
    endif
endfunc


set encoding=utf-8
set fileencoding=utf-8
