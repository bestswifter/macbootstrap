# Git 的常用封装

## 配置用户信息

1. `gcn bestswifter` 配置用户名，等价于 `git config user.name`
2. `gcng bestswifter` 配置全局用户名，等价于 `git config --global user.name`
3. `gce ktzhang@bestswifter.com` 配置邮箱，等价于 `git config user.email`
4. `gceg ktzhang@bestswifter.com` 配置全局邮箱，等价于 `git config --global user.email`

## git diff

1. 输入 `gd` 即可查看工作区内的变动，等价于命令 `git diff`
2. 输入 `gds` 可以查看暂存区的变动，也就是查看那些被 `git add` 了的文件的变动，等价于命令 `git diff --staged`
3. 输入 `gdc` 可以查看最近一次提交的变动，等价于命令 `git diff HEAD^ HEAD`

## git push

1. 输入 `gpo` 可以快速的将提交推送到远程仓库，等价于命令 `git push origin`，如果不写分支名则默认把当前分支推送到远程仓库对应的分支上
2. 如果远程仓库的名称不是默认的 origin，可以使用 `gp repo_name`，因为 `gp` 等价于 `git push`
