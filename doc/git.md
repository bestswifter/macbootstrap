# Git 的常用封装

## 帮助信息

1. 输入 `gh COMMAND` 可以获取对应命令的帮助，比如 `gh commit`，等价于 `git help --man commit`，将在终端中打开这个命令的帮助文档

## 配置用户信息

1. `gcn bestswifter` 配置用户名，等价于 `git config user.name`
2. `gcng bestswifter` 配置全局用户名，等价于 `git config --global user.name`
3. `gce ktzhang@bestswifter.com` 配置邮箱，等价于 `git config user.email`
4. `gceg ktzhang@bestswifter.com` 配置全局邮箱，等价于 `git config --global user.email`

## 配置 GPG key

1. 如果使用我的安装脚本可以跳过这一步，否则执行 `brew install gpg` 来安装依赖
2. 输入 `gpg --full-generate-key` 并按照配置安装，注意第三步选择时长时，如果是个人使用可以填 0，表示永不过期，避免以后的麻烦。最后填写密码时可以不填
3. 安装完成后输入 `gpg --list-keys` 查看刚刚生成的秘钥，在 pub 下面有一长串数字和字母，这个是 ID
4. 输入 `git config --global user.signingkey ID` 来配置使用哪个 key。
5. 单次提交时使用 `git commit -s` 参数来开启 GPG key，或者使用 `git config --global commit.gpgsign true` 设置为全局默认使用
6. 输入 `gvc <commit_hash>` 来检查某次提交的 GPG 签名情况，如果没有输出，说明没有签名。它是`git verify-commit` 命令的缩写

## git log

这个命令非常常用，也非常复杂，常见的有以下几种：

1. 输入 `gg`，它会单行展示提交历史，也支持展示分支的关系，如图所示。它的完整命令是 `git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue) <%an>%Creset' --abbrev-commit`
   ![](http://images.bestswifter.com/QQ20171220-114944@2x.png)
2. 输入 `ggs`，它在 gg 的基础上会展示每次提交具体改动的文件，等价于命令 `gg --stat`，如图所示：
   ![](http://images.bestswifter.com/QQ20171220-114134@2x.png)
3. 输入 `ggp`，它在 gg 的基础上会展示文件的具体改动，等价于命令 `gg -p`，如图所示：
   ![](http://images.bestswifter.com/QQ20171220-120353@2x.png)
4. 不管是`gg`，还是衍生出来的 `ggs` 和 `ggp`，后面都可以加上 `-n`，比如 `ggs -2`，或者 `ggp -1`，表示只显示前 n 个提交
5. 如果想看某一个区间内的 log，可以输入 `gg HEAD~3..HEAD`，注意区间是左开右闭，所以这个命令会查看三次提交的记录。注意较早的提交要写在左边。
6. 如果只记得某次提交内容(content)里有一个词，比如 **networksetup**，可以用 `ggp -S networksetup` 来查找所有提交内容中包含 **networksetup** 的提交。
7. 如果只记得某次提交记录(message)里有一个词，比如 **highlight**，可以用 `ggp --grep highlight` 来查找所有提交记录中包含 **highlight** 的提交
8. 如果想查看某个文件或者文件夹的改动历史，可以输入 `gg file_name`，当然 `ggs` 和 `ggp` 也都是支持的。

## git branch

1. 输入 `gb`，它会展示所有本地分支，等价于命令 `git branch`, 输入命令 `gbv` 可以额外显示每个分支的最后一次提交和这个分支跟踪的远程分支，等价于命令 `git branch -vv`
2. 输入 `gba`，查看本地和远程分支，等价于命令 `git branch -a`，输入命令 `gbr`，查看远程分支，等价于命令 `git branch --remote`
3. 输入 `gcb new_branch` 可以创建分支 **new_branch** 并切换到这个分支上，它是 `git check -b` 命令的缩写，等价于 `git branch new_branch` 和 `git checkout new_branch` 这两条命令
4. 输入 `gbd branch_name` 删除某个分支，等价于命令 `git branch -d`
5. 并非所有分支都可以通过 `gbd` 命令删除，可以通过 `git branch --merged` 来查看已经合入到某个指针(默认是 HEAD)的分支，换句话说是可以通过这个指针回溯到的分支。这个命令也简写为 `gbm`
6. `gbm` 列出的分支都是**可以抵达**的，因此可用 `gbd` 删除，而 `gbnm` 列出的则是不可达的分支，因此不能用 `gbd` 删除，它是 `git branch --no-merged` 命令的简写
7. 如果真的要强行删除，可以用 `gbD` 命令，它是 `git branch -D` 的简写

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

## 其他

这里整理了一些暂时无法分类的命令：

1. `grt` 可以跳转到本地 git 目录的根路径，等价于 `cd $(git rev-parse --show-toplevel || echo ".")`
