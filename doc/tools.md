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

## iterm2

如果使用本脚本安装，将会自动使用我的配置，在默认配置上主要做了如下几点改动：

1. 配置了快捷键 Command + ←, 可以向左回退一个单词
2. 配置了快捷键 Command + →，可以向右前进一个单词
3. 配置了快捷键 Command + delete，不管光标在哪里都可以删除当前行，相当于 `Ctrl + A` 再加一个 `Ctrl + K`
