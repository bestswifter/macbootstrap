# 工具使用

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
* fzf

## iterm2

如果使用本脚本安装，将会自动使用我的配置，在默认配置上主要做了如下几点改动：

1. 配置了快捷键 Command + ←, 可以向左回退一个单词
2. 配置了快捷键 Command + →，可以向右前进一个单词
3. 配置了快捷键 Command + delete，不管光标在哪里都可以删除当前行，相当于 `Ctrl + A` 再加一个 `Ctrl + K`

## fzf

fzf 是一个模糊搜搜工具，通过 homebrew 安装后还会自动执行另外一个脚本完成快捷键的绑定，这个功能非常实用，墙裂建议安装，每个步骤都选择确认即可。

在我看来，它的以下几个功能非常有用：

1. 快速搜索文件， 这算是 fzf 杀手锏级别的功能，快捷键 Ctrl-T 可以进入文件名搜索界面，按回车确认。Ctrl-j/k 上下选择文件，这和 vim 的操作基本是一致的
2. 接上条，如果想用 vim 编辑某个文件，但文件名不记得了，可以用 vim $(fzf)，作为一个懒人，我用 vimf 来替代这个命令
3. 如果想杀死某个进程，输入 kill -9, 按下 tab 就可以自动补全了
4. fzf 可以结合 vim 使用，但暂时还没有研究，后续更新上来
