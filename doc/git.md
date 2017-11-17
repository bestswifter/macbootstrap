# Git 的常用封装

## git diff

输入 `gd` 即可查看工作区内的变动，等价于命令 `git diff`
输入 `gds` 可以查看暂存区的变动，也就是查看那些被 `git add` 了的文件的变动，等价于命令 `git diff --staged`
输入 `gdc` 可以查看最近一次提交的变动，等价于命令 `git diff HEAD^ HEAD`
