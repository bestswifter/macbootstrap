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
4. 输入 `gpg --armor --export pub GPG ID` 把公钥复制出来，拷贝到 [GitHub GPG Keys](https://github.com/settings/keys) 上
5. 输入 `git config --global user.signingkey ID` 来配置使用哪个 key。
6. 单次提交时使用 `git commit -s` 参数来开启 GPG key，或者使用 `git config --global commit.gpgsign true` 设置为全局默认使用
7. 输入 `gvc <commit_hash>` 来检查某次提交的 GPG 签名情况，如果没有输出，说明没有签名。它是`git verify-commit` 命令的缩写

## git log

这个命令非常常用，也非常复杂，常见的有以下几种：

1. 输入 `gg`，它会单行展示提交历史，也支持展示分支的关系，如图所示。它的完整命令是 `git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue) <%an>%Creset' --abbrev-commit`
   ![](http://images.bestswifter.com/QQ20171220-114944@2x.png)
2. 输入 `ggs`，它在 gg 的基础上会展示每次提交具体改动的文件，等价于命令 `gg --stat`，如图所示：
   ![](http://images.bestswifter.com/QQ20171220-114134@2x.png)
3. 输入 `ggp`，它在 gg 的基础上会展示文件的具体改动，等价于命令 `gg -p`，如图所示：
   ![](http://images.bestswifter.com/QQ20171220-120353@2x.png)
4. 输入 `gga`，可以展示所有的分支，一般建议用它代替 `gg`，它等价于命令 `gg --all`
5. 不管是`gg`，还是衍生出来的 `ggs` 和 `ggp`，后面都可以加上 `-n`，比如 `ggs -2`，或者 `ggp -1`，表示只显示前 n 个提交
6. 如果想看某一个区间内的 log，可以输入 `gg HEAD~3..HEAD`，注意区间是左开右闭，所以这个命令会查看三次提交的记录。注意较早的提交要写在左边。
7. 如果只记得某次提交内容(content)里有一个词，比如 **networksetup**，可以用 `ggp -G networksetup` 来查找所有提交内容中包含 **networksetup** 的提交。-G 选项和 -S 选项主要有两个区别，
前者可以接收正则，而后者只会查找那些导致 string 出现次数发现变动的提交，比如把 `name:0` 换成 `name:1`，用 -S 就无法搜索到 name, 因为它的出现次数并没有改变，但是用 -G 可以。
8. 如果只记得某次提交记录(message)里有一个词，比如 **highlight**，可以用 `ggp --grep highlight` 来查找所有提交记录中包含 **highlight** 的提交
9. 如果想查看某个文件中某一段代码的提交记录，可以用 `ggp -L start,end:file_name` 命令，详情请参考 [Git grep](https://github.com/bestswifter/macbootstrap/blob/master/doc/git.md#git-grep) 这一节的用法。
10. 如果想查看某个文件或者文件夹的改动历史，可以输入 `gg file_name`，当然 `ggs` 和 `ggp` 也都是支持的。

## git branch

1. 输入 `gb`，它会展示所有本地分支，等价于命令 `git branch`, 输入命令 `gbv` 可以额外显示每个分支的最后一次提交和这个分支跟踪的远程分支，等价于命令 `git branch -vv`
2. 输入 `gb branch_name` 表示创建一个分支，指向当前提交，`gb branch_name commit` 表示新建一个分支并指向某个 commit，注意这两个命令都不会切换分支。
3. 输入 `gba`，查看本地和远程分支，等价于命令 `git branch -a`，输入命令 `gbr`，查看远程分支，等价于命令 `git branch --remote`
4. 输入 `gcb new_branch` 可以创建分支 **new_branch** 并切换到这个分支上，它是 `git check -b` 命令的缩写，等价于 `git branch new_branch` 和 `git checkout new_branch` 这两条命令
5. 输入 `gbd branch_name` 删除某个分支，等价于命令 `git branch -d`
6. 并非所有分支都可以通过 `gbd` 命令删除，可以通过 `git branch --merged` 来查看已经合入到某个指针(默认是 HEAD)的分支，换句话说是可以通过这个指针回溯到的分支。这个命令也简写为 `gbm`
7. `gbm` 列出的分支都是**可以抵达**的，因此可用 `gbd` 删除，而 `gbnm` 列出的则是不可达的分支，因此不能用 `gbd` 删除，它是 `git branch --no-merged` 命令的简写
8. 如果真的要强行删除，可以用 `gbD` 命令，它是 `git branch -D` 的简写

有时候我们要从远程仓库检出一个新的分支，比如叫 feature 吧，有几种思路：

```shell
git branch -t feature origin/feature
git checkout -b feature origin/feature
git checkout --track origin/feature
```

第一种写法不太合适，因为它只会创建分支并且跟踪远程分支，并不会切换。我想一般创建分支的时候都是需要切换的，否则你创建它干嘛呢，可以等到要切换的时候再创建呐。

第二种写法稍微高级些，它和第一种写法一致并且可以切换分支，之前的 tips 中介绍过 `gcb` 后面加单个参数的含义和用法，这里第二个参数表示跟着远程分支。

第三中方法最简单，因为它参数少，而且功能和第二种写法一样，我给他起的别名叫 `gct`，对应 `git checkout --track`

如果想为当前分支设置跟踪的远程分支，输入 `gtrack` 即可，不需要携带参数，它会自动让当前分支跟踪远程的同名分支

## git diff

1. 输入 `gd` 即可查看工作区内的变动，等价于命令 `git diff`
2. 输入 `gds` 可以查看暂存区的变动，也就是查看那些被 `git add` 了的文件的变动，等价于命令 `git diff --staged`
3. 输入 `gdc` 可以查看最近一次提交的变动，等价于命令 `git diff HEAD^ HEAD`
4. 输入 `gdcr` 可以倒过来查看某次提交的变动，它的第一个参数是提交的 SHA-1 值，如果不写则是 HEAD，所以 `gdcr` 和 `gdc` 是恰好相反的 diff。这样的好处是如果
想撤销某次提交，只要用 `gdcr sha-1` 就可以获得那次提交的逆提交，如果想要精确到只恢复某个文件，第二个参数可以是文件名。比如 `gdcr sha-1 file_name | git apply`
5. 输入 `gdt` 即可用外部 diff 工具查看 diff，它是 `git difftool --no-prompt --extcmd "icdiff --line-numbers --no-bold" "$@" | less` 命令的缩写，这个命令依赖 `icdiff` 这个工具，可以用 homebrew 安装。
6. 输入 `gdts` 和 `gdtc` 可以对应的用外部 diff 查看已暂存和上次提交的变动，这些和 `gds` 与 `gdc` 命令基本上是一样的，区别在于使用外部 diff 工具，会更美观一些（当然速度也会更慢），效果如图所示
    ![](http://images.bestswifter.com/MacHi-2018-01-02-19-48-29.png)

## git push

1. 输入 `gpo` 可以快速的将提交推送到远程仓库，等价于命令 `git push origin`，如果不写分支名则默认把当前分支推送到远程仓库对应的分支上
2. 如果远程仓库的名称不是默认的 origin，可以使用 `gp repo_name`，因为 `gp` 等价于 `git push`

## git commit

1. 输入 `gcam` 可以在不 add 的前提下一次性提交所有改动，等价于命令 `git commit -a -m`

输入命令 `git add -p` 就可以交互式的暂存文件，我给这个命令起了别名：`gap`。这个命令后面如果不加参数，会试着暂存所有文件，也可以加上文件名，只 add 某个文件。

![](https://diycode.b0.upaiyun.com/photo/2017/ebd89558e4d3a39558eb3b13a39579b4.png)

注意左下角的蓝色文字，这里提供了很多动作命令，解释如下：

1. y: 暂存这个区块
2. n: 不暂存这个区块
3. a: 暂存整个文件
4. d: 不暂存整个文件
5. g: 跳到某个区块，注意不是所有情况下都有这个选项
6. j: 跳到下一个还未决定的区块
7. k: 跳到上一个还未决定的区块
8. s: 把这个区块切分为更小的几个区块
9. e: 编辑区块
10. /: 正则搜索某个区块

前面几个操作都很好理解，重点介绍一下 8 和 9 这两个操作。不是所有的区块都能被切分，根据我的观察如果有几行有改动，然后相邻且没有缩进的另外几行也有改动，这种情况下才能切分。

有时候一个常见的需求是只提交某几行，在我的印象中 SourceTree 需要手动选择连续的行，而 Tower 干脆就不支持，这时候需要用到命令 `e`，我们编辑改动的部分，把不想暂存的部分删掉就可以了。

## git remote

1. 输入 `grsh` 可以查看所有的远程仓库，输入 `grsh origin` 可以查看 origin 仓库中的分支、track 信息，等价于命令 `git remote show`
2. 输入 `grv` 可以查看远程仓库的地址，等价于命令 `git remote -v`

## git stash

1. 输入命令 `gst` 可以储藏所有未提交的改动，包括已暂存的改动和未跟踪的文件，它是命令 `git stash -u` 的缩写
2. 输入命令 `gsp` 可以恢复最近的一次暂存，它会完整恢复状态，也就是说如果储藏时这个文件已暂存，恢复后也是暂存的，它是 `git stash pop --index` 命令的缩写

## git grep

这个命令和 grep 的区别在于运行更快，而且可以指定搜索范围（比如是否搜索未跟踪文件，搜索某个特定的 tag等），如果当前目录是 git 目录，可以用 `ggrep` 来替代 `grep`

`ggrep` 是 `git grep --break --heading -n` 命令的缩写，第一个参数表示不同文件的搜索结果间用空格分割，便于阅读。第二个参数非常有用，它不再在每一行输出前面加上文件名，而是在所有属于同一个文件的匹配之前加上一次文件名，
这样输出结果的可读性更高，`-n` 表示输出行号。

以查找 `gignore` 这个命令的历史为例，先输入 `ggrep gignore`，得到如图所示的结果，这告诉我们它定义在 `zsh-config/git.sh` 这个文件的第 25 行：

![](https://diycode.b0.upaiyun.com/photo/2017/dd45040c35ab5011400c7172fbf1ff9b.png)

然后输入 `ggp -L 25,25:./zsh-config/git.sh`，参数 `—L` 表示行内查找，即查找这个文件的第 25-25 行的提交记录，得到的结果如图所示：

![](https://diycode.b0.upaiyun.com/photo/2017/a872cea9a13ce464e848cec8c0db3196.png)

提交的 SHA-1 值、日期、提交者等信息就完全显示出来了

## git tag

1. 输入命令 `gt` 可以打标签，等价于命令 `git tag`
2. 输入命令 `gtd` 可以删除**本地标签**，等价于命令 `git tag -d`

## 常见工作流

注意，这里说的工作流不是 git-workflow 的意思，而是一些常见命令的组合。

1. 输入 `gsfrs` 可以先暂存(stash) 当前改动，拉取远程代码，rebase 以后再应用暂存，等价于命令 `git stash;git fetch;git rebase;git stash pop;`。**警告⚠️** 如果 rebase 的过程中遇到冲突，不会自动 pop 暂存，需要手动执行命令

## 其他

这里整理了一些暂时无法分类的命令：

1. `grt` 可以跳转到本地 git 目录的根路径，等价于 `cd $(git rev-parse --show-toplevel || echo ".")`
2. `grm` 表示默认的 `git reset`，因为 `gr` 被更常用的 rebase 命令占用了
3. `gref` 是命令 `git reflog` 的缩写，用来查看 HEAD 分支的变动历史
