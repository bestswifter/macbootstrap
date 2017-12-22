# Git 的常用封装

## 帮助信息

1. 输入 `gh COMMAND` 可以获取对应命令的帮助，比如 `gh commit`，等价于 `git help --man commit`，将在终端中打开这个命令的帮助文档

## 配置用户信息

1. `gcn bestswifter` 配置用户名，等价于 `git config user.name`
2. `gcng bestswifter` 配置全局用户名，等价于 `git config --global user.name`
3. `gce ktzhang@bestswifter.com` 配置邮箱，等价于 `git config user.email`
4. `gceg ktzhang@bestswifter.com` 配置全局邮箱，等价于 `git config --global user.email`

## git log

这个命令非常常用，也非常复杂，常见的有以下几种：

1. 输入 `gg`，它会单行展示提交历史，也支持展示分支的关系，如图所示：
   ![](http://images.bestswifter.com/QQ20171220-114944@2x.png)
2. 输入 `ggs`，它在 gg 的基础上会展示每次提交具体改动的文件，等价于命令 `gg --stat`，如图所示：
   ![](http://images.bestswifter.com/QQ20171220-114134@2x.png)
3. 输入 `ggp`，它在 gg 的基础上会展示文件的具体改动，等价于命令 `gg -p`，如图所示：
   ![](http://images.bestswifter.com/QQ20171220-120353@2x.png)
4. 不管是`gg`，还是衍生出来的 `ggs` 和 `ggp`，后面都可以加上 `-n`，比如 `ggs -2`，或者 `ggp -1`，表示只显示前 n 个提交
5. 如果想看某一个区间内的 log，可以输入 `gg HEAD~3..HEAD`，注意区间是左开右闭，所以这个命令会查看三次提交的记录。注意较早的提交要写在左边。
6. 如果只记得某次提交内容里有一个词，比如 **networksetup**，可以用 `ggp -S networksetup` 来查找所有提交内容中包含 **networksetup** 的提交。
7. 如果想查看某个文件或者文件夹的改动历史，可以输入 `gg file_name`，当然 `ggs` 和 `ggp` 也都是支持的。

## git branch

1. 输入 `gb`，它会展示所有本地分支，等价于命令 `git branch`
2. 输入 `gba`，查看本地和远程分支，等价于命令 `git branch -a`，输入命令 `gbr`，查看远程分支，等价于命令 `git branch --remote`
3. 输入 `gcb new_branch` 可以创建分支 **new_branch** 并切换到这个分支上，它是 `git check -b` 命令的缩写，等价于 `git branch new_branch` 和 `git checkout new_branch` 这两条命令

## git diff

1. 输入 `gd` 即可查看工作区内的变动，等价于命令 `git diff`
2. 输入 `gds` 可以查看暂存区的变动，也就是查看那些被 `git add` 了的文件的变动，等价于命令 `git diff --staged`
3. 输入 `gdc` 可以查看最近一次提交的变动，等价于命令 `git diff HEAD^ HEAD`

## git push

1. 输入 `gpo` 可以快速的将提交推送到远程仓库，等价于命令 `git push origin`，如果不写分支名则默认把当前分支推送到远程仓库对应的分支上
2. 如果远程仓库的名称不是默认的 origin，可以使用 `gp repo_name`，因为 `gp` 等价于 `git push`

## git commit

1. 输入 `gcam` 可以在不 add 的前提下一次性提交所有改动，等价于命令 `git commit -a -m`

## git remote

1. 输入 `grsh` 可以查看所有的远程仓库，输入 `grsh origin` 可以查看 origin 仓库中的分支、track 信息，等价于命令 `git remote show`

## 常见工作流

注意，这里说的工作流不是 git-workflow 的意思，而是一些常见命令的组合。

1. 输入 `gsfrs` 可以先暂存(stash) 当前改动，拉取远程代码，rebase 以后再应用暂存，等价于命令 `git stash;git fetch;git rebase;git stash pop;`。**警告⚠️** 如果 rebase 的过程中遇到冲突，不会自动 pop 暂存，需要手动执行命令
