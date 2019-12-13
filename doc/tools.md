# 工具使用

目前包含以下工具：

* iterm(cask)：用于替换系统的终端，附带了我自己的配置
* sourcetree(cask)：git 可视化管理工具
* chrome(cask)
* coderunner(cask)：轻量级、快速执行任何脚本的 IDE
* the-unarchiver(cask)：用于解压缩文件
* Charles(curl from qiniu)：用于网络抓包调试
* Dash(curl from qiniu)：用于快速查找文档
* Jetbrains Toolbox(cask)：用于安装 Jetbrains 家的 IDE
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
* gpg：git 提交加密工具
* fzf
* cloc

## iterm2

如果使用本脚本安装，将会自动使用我的配置，在默认配置上主要做了如下几点改动：

1. 配置了快捷键 Command + ←, 可以向左回退一个单词
2. 配置了快捷键 Command + →，可以向右前进一个单词
3. 配置了快捷键 Command + delete，不管光标在哪里都可以删除当前行，相当于 `Ctrl + A` 再加一个 `Ctrl + K`
4. Command + d 垂直切分屏幕，Command + Shift + d 水平切分屏幕，Command + [ 或 ] 切换分屏
5. F1 可以快速召唤一个半透明的 iTerm 窗口，方便做一些简单的操作。

## fzf

fzf 是一个模糊搜搜工具，通过 homebrew 安装后还会自动执行另外一个脚本完成快捷键的绑定，这个功能非常实用，墙裂建议安装，每个步骤都选择确认即可。

在我看来，它的以下几个功能非常有用：

1. 快速搜索文件， 这算是 fzf 杀手锏级别的功能，快捷键 Ctrl-t 可以进入文件名搜索界面，按回车确认。Ctrl-j/k 上下选择文件，这和 vim 的操作基本是一致的
2. 接上条，如果想用 vim 编辑某个文件，但文件名不记得了，可以用 vim $(fzf)，作为一个懒人，我用 vimf 来替代这个命令
3. 如果想杀死某个进程，输入 kill -9, 按下 tab 就可以自动补全了
4. 如果想要 ssh 连接某个远程主机，输入 `ssh **` 再按 tab 键即可自动补全
5. fzf 可以结合 vim 使用，但暂时还没有研究，后续更新上来

## Preview 插件

这里有一系列插件，完整介绍可以参考：[quick-look-plugins](https://github.com/sindresorhus/quick-look-plugins#toc12)

主要包括：

1. qlcolorcode: 代码文件预览时高亮
2. qlstephen: 以纯文本的形式预览无拓展名或者未知拓展名的文件
3. qlmarkdown: 预览渲染后的 markdown 文件
4. quicklook-json: 预览格式化后的 json 文件
5. qlimagesize: 预览图片时显示图片大小
6. webpquicklook: 预览 webp 格式的图片
7. suspicious-package: 预览 Mac OX 安装包类型的文件
8. qlvideo: 预览视频文件
9. provisionql: 预览 iOS 开发时用到的 provisionfile 文件
10. quicklookapk: 预览安卓的 apk 文件
