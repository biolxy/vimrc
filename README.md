# 我的vim配置文件

这是我的vim的配置文件

## 使用

```shell
git clone  https://github.com/biolxy/vimrc.git
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp vimrc/.vimrc ~
```

使用vim编辑`~/.vimrc`  文件，在在vim的非编辑模式下键入`:BundleInstall ` 更新插件，更多用法参见：

- https://github.com/VundleVim/Vundle.vim
上述步骤如果出现`bufType`相关的错误

执行
```
sed -i 's/setl buftype=nofile/setl buftype=/g' ~/.vim/bundle/Vundle.vim/autoload/vundle/scripts.vim
```

安装过插件后
```shell
mkdir -p ~/.vim/colors
cp ~/.vim/bundle/molokai/colors/molokai.vim ~/.vim/colors/
```
在`~/.vimrc`中简单编辑一下，就可以使用`molokai` 配色了

## YouCompleteMe 的配置
- 参考 https://blog.csdn.net/alex_bean/article/details/83821017
- 我的vim 编译命令
```shell
./configure --with-features=huge --enable-pythoninterp=yes --enable-python3interp --enable-cscope --enable-fontset --with-python-config-dir=/root/anaconda3/envs/py27/bin/python-config --with-python3-config-dir=/root/anaconda3/bin/python3.7m-config
```
如果源码编译 vim 后，shell 下执行 vim --version， 显示 +python/dyn +python3/dyn，但是在vim 编辑python文件时候，依然显示 ` Python library could not be loaded`等，那么你需要配置一下你的.vimrc 中 YouCompleteMe的相关地址 `pythondll` `pythonthreedll` 

```shell
" YouCompleteMe
set tags+=/usr/include/c++/4.8/stdcpp.tags
set pythonthreedll=/root/anaconda3/lib/libpython3.7m.so.1
set pythondll=/root/anaconda3/envs/py27/lib/libpython2.7.so.1.0
let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
let g:ycm_server_python_interpreter='/root/anaconda3/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
```


# 我的 bash 和 zsh 配置

```shell

# 安装 zsh 主题
```
cp vimrc/ys2.zsh-theme ~/.oh-my-zsh/themes/
```

# 安装zsh
- https://segmentfault.com/a/1190000013857738
- https://harttle.land/2016/10/25/install-oh-my-zsh-locally.html
- https://github.com/ohmyzsh/ohmyzsh

## 安装 zsh 命令行语法高亮插件 `zsh-syntax-highlighting`
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```



# 我的 Xshell 配色
