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

### bsfn：方便的查找文件名

如果你想查找文件夹内的某个文件，可以使用 `find` 命令，但默认的 `find` 命令并不支持表达，所以我在 `personalized.sh` 文件中封装了 `bsfn` 函数，它接受一个参数，可以精确匹配，也可以写正则表达式：

![正则表达搜索文件](http://images.bestswifter.com/1491892266.png)

比如这里我们搜索所有**以 BBA 开头，中间字符不限，以 Plugin 结尾**的文件。

### proxy: 方便的切换和展示系统代理

如果想使用 Charles 抓包，则输入 `p on` 即可将系统的 HTTP 和  HTTPS 代理设置为 127.0.0.1:8888

如果想使用 Shadowsocks 科学上网，则输入 `p g` 即可将系统的 socks 代理设置为 localhost:14179，需要自行修改端口号

如果不想使用代理，输入 `p off` 可以禁用所有代理，恢复默认设置。

输入 `p s` 可以查看当前的系统代理。

![p 命令使用简介](https://o8ouygf5v.qnssl.com/1506333678.png)

### bssize：快速查看文件夹和文件大小

bssize 后面的参数可以是文件名，表示查看这个文件的大小。也可以是文件夹名，表示查看文件夹大小和文件夹内各子目录的大小。

`bssize .` 表示查看当前目录大小和子目录大小，`bssize /` 表示查看系统磁盘的使用情况。具体效果如图所示：

![](https://o8ouygf5v.qnssl.com/1506396195.png)

## Git



## Vim

Plugins are included in `~/.vimrc`, you can change them according to your favor.

You can change configuration about vim itself in `~/.vim/bundle/vimrc/plugin/vimrc_wssq.vim`

Configuration about vim plugins are specified in `~/.vim/bundle/vimrc/self/PluginSetting.vim`

### <Leader>u

Leader 键是逗号 `,`，按下 `,u` 触发 Unite outline:

![Unite outline](http://images.bestswifter.com/1492167290.png)

连按两次 `Ctrl-w` 可以左右切换窗口，左侧 outline 中用 j/k 上下移动，o 前往指定位置。

# What's next

- [x] Split vim plugin configuration out.
- [] Add keymap export/save for iTerm.
- [] Add keymap export/save for Snap.
- [] Add more npm packages
- [] Remove alias to number 1-9 in `~/.oh-my-zsh/lib/directories.zsh`, this is considered to be done in [h function](https://github.com/bestswifter/history)
- [] IMPORTANT: Add demo for this project to show the convenience and advantange of this project
