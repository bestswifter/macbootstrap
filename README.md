# 警告

本项目目前处于密集开发阶段，所有 function 和 alias 均不稳定，且后期考虑把安装和配置分离，install.sh 脚本不负责配置，只安装依赖，而 zsh 脚本都使用  zsh plugin 的形式集成进来。

**因此，现阶段可以直接把喜欢的功能抄走，但使用 install.sh 脚本安装带来的副作用概不负责**

#  介绍

这是一个快速创建开发环境的脚本，里面集成了一些常用的配置。本脚本主要针对新电脑开发，如果你的电脑没有做过命令行方面的配置或者不怕丢失这些配置也可以使用。虽然我在安装过程中考虑到了旧数据的备份，但并不保证 100% 有效。

#  安装方式

你的电脑不需要任何配置，只需要执行以下代码即可：

```shell
curl https://raw.githubusercontent.com/bestswifter/macbootstrap/master/bootstrap.sh | sh
```

`bootstrap.sh` 文件首先会安装 Xcode-command tool，安装完成后你的电脑将会拥有 git 工具。

#  特色

 这份脚本主要包含以下几个方面的配置：

 1. 常用的 Homebrew 工具
 2. 基于 zsh 的，能够提高工作效率的命令
 3. Vim 配置
 4. Git 配置
 5. 未来会考虑加入特定软件的配置以及 npm、pip 等依赖的配置


 使用文档正在逐步整理中。。。

## Homebrew

目前包含以下工具：

* iterm(cask)
* sourcetree(cask)
* chrome(cask)
* wget
* gnu-sed
* cmake
* autojump
* node&npm
* ctags
* gawk
* coreutils
* exiv2 (show info about image)
* ssh-copy-id (upload public ssh key to server)
* imagemagick、catimg (print image in terminal)
* redis  (通过 `redis-server /usr/local/etc/redis.conf` 启动或者 `brew services start redis` 启动并且设置为开机立即启动)
* gpg

## Zsh
   
所有 Zsh 相关的函数、配置（主要是对一些 Unix 函数的封装）都在 `zsh-config` 目录下。

入口文件是 `common.sh`，其中我个人的配置放在 `personalized.sh` 中，如果使用者不需要，可以删除这个文件。

具体文档请参考这份说明：[Zsh 相关](./doc/zsh.md)

## Git

详细教程请参考这份说明：[Git 使用指南](./doc/git.md)

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
