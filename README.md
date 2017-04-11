# What is this

A shell script to help you set up development environment.

# How to install

Just execute:

```shell
curl https://raw.githubusercontent.com/bestswifter/macbootstrap/master/bootstrap.sh | sh
```

# Feature

First of all, it will install xcode command tool for you, which includes **git**.

## Homebrew

Then, you will install **homebrew** and some tools available from it. It includes:

* iterm(cask)
* sourcetree(cask)
* chrome(cask)
* wget
* gnu-sed
* cmake
* autojump
* node&npm
* ctags

## Zsh

所有 Zsh 相关的函数、配置（主要是对一些 Unix 函数的封装）都在 `zsh-config` 目录下。

### 方便的查找文件名

如果你想查找文件夹内的某个文件，可以使用 `find` 命令，但默认的 `find` 命令并不支持表达，所以我在 `personalized.sh` 文件中封装了 `bsfn` 函数，它接受一个参数，可以精确匹配，也可以写正则表达式：

![正则表达搜索文件](http://images.bestswifter.com/1491892266.png )


## Git



## Vim

Plugins are included in `~/.vimrc`, you can change them according to your favor.

You can change configuration about vim itself in `~/.vim/bundle/vimrc/plugin/vimrc_wssq.vim`

Configuration about vim plugins are specified in `~/.vim/bundle/vimrc/self/PluginSetting.vim`

# What's next

- [x] Split vim plugin configuration out.
- [] Add keymap export/save for iTerm.
- [] Add keymap export/save for Snap.
- [] Add more npm packages
- [] Remove alias to number 1-9 in `~/.oh-my-zsh/lib/directories.zsh`, this is considered to be done in [h function](https://github.com/bestswifter/history)
- [] IMPORTANT: Add demo for this project to show the convenience and advantange of this project
