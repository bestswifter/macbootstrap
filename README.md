# 介绍

这是一个针对新 Mac 开发的，快速配置开发环境的脚本，里面集成了一些常用的配置。所有的配置和功能都有文档说明， 它既是使用手册，也是教学指南。

读者可以先阅读 [这些问题](./doc/features.md)，如果这些问题你并没有简单的方式去实现，那么不妨考虑下 macbootstrap

除非你做过大量配置，而且没有备份，否则也可以推荐使用这个脚本。虽然不能完全保证 100% 的安全，但重要的文件基本上都做了备份，比如原先的 `~/.zshrc` 文件会被备份为 `~/.zshrc_backup`

我深知，环境配置是一件非常主观的事，不同的人审美和需求不一样，所以如果不愿意使用我的这套配置，也可以看看文档，了解一些好玩的用法，看看它是怎么实现的，然后把部分函数抄走并提高自己的工作效率。

**再次警告⚠️， 本项目是为新电脑设计，虽然做了一些保护，请依然谨慎在生产环境中使用此配置，对于因此造成的配置丢失和错乱，作者不负任何责任**

# 安装方式

只需要执行以下代码即可：

```shell
curl https://raw.githubusercontent.com/Deerdev/macbootstrap/deer_main/bootstrap.sh | sh
```

这个命令会安装 `HomeBrew`，如果是全新的电脑还会安装 Xcode 命令行工具（包括 gcc 等），这是必须的，绝大多数命令行程序都依赖这个。如果安装失败，可以手动执行 `xcode-select --install` 命令。如果还是无法安装，需要去[苹果官网](https://developer.apple.com/download/more/)手动下载安装

当然，大概率是不会出现任何问题的。

# 特色

 这份脚本主要包含以下几个方面的配置：

 1. 对系统选项的一些基本修改
 2. 常用的 Homebrew 工具
 3. 基于 zsh 的，能够提高工作效率的命令，包括 git 的快捷命令
 4. Vim 配置
 5. 未来会考虑加入特定软件的配置以及 npm、pip 等依赖的配置

**使用文档正在逐步整理中。。。**

## 系统配置

为了增强 Mac OS X 的使用体验，我对系统原生的配置做了一些基本的、必备的修改。

详细的原因、改动方式和效果请参考 [系统配置优化](./doc/system.md) 这一节。

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

## 讨论交流

为了避免无意义的加群，请发送邮件到 [bestswifter@gmail.com](mailto:bestswifter@gmail.com)，介绍你对本书的看法和期待，字数不限，我会回复微信号并拉你进群。

## 内推招聘

头条北京、上海、深圳等地急缺各种开发、运营、产品岗位，点击 此链接 或扫描下发二维码投递简历即可享受内推福利。

**头条 iOS 基础技术团队急缺 iOS 工程师**，内推通过请吃饭，手把手讲解本书所有内容。。。

![](https://blobscdn.gitbook.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LBLo0eP1FW2IkggnToa%2F-LEK9Gkq5xOdMCyyn8Sj%2F-LEKAPDx-knzrsZ__ixw%2Fimage.png?alt=media&token=5db13570-7999-49f4-b841-04b1ff9b23b9)

# What's next

- [] Add more npm packages
- [] IMPORTANT: Add demo for this project to show the convenience and advantange of this project
