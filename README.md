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

# 我的 bash 和 zsh 配置

```shell

# zsh 主题

cp vimrc/ys2.zsh-theme ~/.oh-my-zsh/themes/

```

# 我的 Xshell 配色
