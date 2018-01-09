# 介绍

这是一个针对新 Mac 开发的，快速配置开发环境的脚本，里面集成了一些常用的配置。所有的配置和功能都有文档说明， 它既是使用手册，也是教学指南。

读者可以先阅读 [这些问题](./doc/features.md)，如果这些问题你并没有简单的方式去实现，那么不妨考虑下 macbootstrap

除非你做过大量配置，而且没有备份，否则也可以推荐使用这个脚本。虽然不能完全保证 100% 的安全，但重要的文件基本上都做了备份，比如原先的 `~/.zshrc` 文件会被备份为 `~/.zshrc_backup`

我深知，环境配置是一件非常主管的事，不同的人审美和需求不一样，所以如果不愿意使用我的这套配置，也可以看看文档，了解一些好玩的用法，看看它是怎么实现的，然后把部分函数抄走并提高自己的工作效率。

**再次警告⚠️， 因为项目还处于开发中，暂时不太稳定，请谨慎在生产环境中使用此配置，对与因此造成的配置丢失和错乱，作者不负任何责任**

# 安装方式

你的电脑不需要任何配置，只需要执行以下代码即可：

```shell
curl https://raw.githubusercontent.com/bestswifter/macbootstrap/master/bootstrap.sh | sh
```

`bootstrap.sh` 文件首先会安装 Xcode-command tool，安装完成后你的电脑将会拥有 git 工具。

# 特色

 这份脚本主要包含以下几个方面的配置：

 1. 常用的 Homebrew 工具
 2. 基于 zsh 的，能够提高工作效率的命令，包括 git 的快捷命令
 3. Vim 配置
 4. 未来会考虑加入特定软件的配置以及 npm、pip 等依赖的配置

**使用文档正在逐步整理中。。。**

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
 [] IMPORTANT: Add demo for this project to show the convenience and advantange of this project
