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
 2. 基于 zsh 的，能够提高工作效率的命令，包括 git 的快捷命令
 3. Vim 配置
 4. 未来会考虑加入特定软件的配置以及 npm、pip 等依赖的配置

** 使用文档正在逐步整理中。。。**

## Homebrew

如果出现请 **The formula built, but is not symlinked into /usr/local** 的报错，这可能会导致 link 失败，请执行

```shell
sudo chown -R `whoami` /usr/local
```

具体包含的工具，以及用法请参考: [HomeBrew 工具](./doc/tools.md)

## Zsh
   
所有 Zsh 相关的函数、配置（主要是对一些 Unix 函数的封装）都在 `zsh-config` 目录下。

入口文件是 `common.sh`，其中我个人的配置放在 `personalized.sh` 中，如果使用者不需要，可以删除这个文件。

具体文档请参考这份说明：[Zsh 相关](./doc/zsh.md)

## Git

详细教程请参考这份说明：[Git 使用指南](./doc/git.md)

## Vim

详细用法与教程请参考这份说明: [Vim 使用指南](./doc/vim.md)

# What's next

- [x] Split vim plugin configuration out.
- [x] Add keymap export/save for iTerm.
- [x] Add keymap export/save for Snap.
- [] Add more npm packages
- [] Remove alias to number 1-9 in `~/.oh-my-zsh/lib/directories.zsh`, this is considered to be done in [h function](https://github.com/bestswifter/history)
- [] IMPORTANT: Add demo for this project to show the convenience and advantange of this project
