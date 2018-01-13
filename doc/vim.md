# Vim 使用简介

如果使用 macbootstrap 的安装脚本，不用另行安装，否则需要运行：

```shell
brew install neovim
git clone git://github.com/bestswifter/vim-config.git ~/.config/nvim
ln -s ~/.vim ~/.config/nvim
```

然后用 nvim 打开文件就可以看到效果了。

![](http://blog.bestswifter.com/WX20180110-204528@2x.png)

## 基础用法

1. Leader 键是 `空格 space`, NerdTree 和 Denite 专用的 Leader 键是 `;`
2. 替换字母时，`s` 键时无效的，需要用 `r` 加上替换后的内容。
3. 在普通模式下，输入 q 可以快速关闭无修改的文件，`Ctrl-s` 可以保存文件，等价于 `:w`

## Window 和 Buffer

首先要明确 Window 和 Buffer 的概念，和编辑器无关的外部窗口，比如 NerdTree
这样的文件列表属于 Window。而打开的多个文件，每个都是一个 Buffer。

切记不要使用鼠标或者触摸板切换 Window，这样非常低效，常见的做法有三种：

1. 按 `<Tab>` 键可以在多个 Window 间切换
2. 如果 Window 过多，可以按下 `-`，将会弹出所有 Window 的缩写，输入对应的字母就可以快速切换了
3. 以 `Ctrl` 为前缀，`hjkl` 为操作键，可以切换 Window，比如 `Ctrl-h` 就表示切换到左边一个 Window

当打开多个 Buffer 时，以下快捷键有助于快速在 Buffer 间切换：

1. `g0` 表示前往第一个 Buffer，`g$` 表示前往最后一个 Buffer。
2. <F9> 表示前一个 Buffer，<F10> 表示后一个 Buffer

## 常见插件的用法

受篇幅所限，这里只介绍一些 Life-Changing 系列的插件，我会按照重要性倒序排列

### easymotion

如果只能安装一个 vim 插件，我会选择它，因为原生的 vim
虽然有很多快速的跳转方式，但依然不够快，而 easymotion 则是一个能让
光标移动速度跟上你手速的神器。

虽然 easymotion 有很多配置，但我一般只有用到两个：

1. `；w`，全局以单词为单位跳转，屏幕内的每个单词都会显示高亮的缩写，只要输入缩写就可以快速跳转了。
2. `sl`，在行内跳转， 速度更快，更准确，但使用场景肯定略小一些

### Denite

如果还有选择第二个插件的机会，那一定是 Denite，它集成了诸多好用的功能，可以理解为一个工具库

首先是项目内的文件搜索，类似于 Xcode 中的 `Command + Shift + o`，根据文件名称模糊搜索，在 Vim 中的快捷键是 `;f`。可以用 file 这个单词来记忆

如果是项目内的字符串搜索，类似于 Xcode 中的 `Command + Shift + f`，全局搜索字符串，在 Vim 中的快捷键是 `;g`。可以用 grep 这个单词来记忆

对于打开过的文件，它们存在于缓存区内，使用快捷键 `;b` 可以在缓存区内搜索。

在搜索框内输入文字时，搜索结果会实时更新，当看到满意的结果时按下 `Esc` 键，可以在输入模式和选择模式中相互切换，打开文件有三种方式：

1. st: 在新的 tab 中打开(ab)
2. sv: 垂直切分当前 tab 并打开 (vertical)
3. sh: 水平切分当前 tab 并打开文件 (horizental)

如果不想搜索了，可以在选择模式中按下 `q` 退出。

### Vim-Operator-Surround

我们知道 Vim 中有文本对象（Text Object）的功能，比如 `ciw` 可以删除光标下的单词并进入编辑模式，再比如 `di"` 可以删除双引号内部的内容。这个插件就是用来拓展 Text Object 功能的。

首先是基础模式，一共有添加(append)、替换(replace)和删除(delete)三种操作：

1. `sa + Text Object + 内容`：假设现在有一个单词 **abc**，光标停留在 **b** 上，怎么样把这个单词引用起来，也就是从 **abc** 变成 **"abc"** 呢。只要输入 `saiw"` 即可。这里的 sa 表示添加，iw 表示文本对象是单词，`"` 则是要拓展的内容。
2. `sd + Text Object`：注意这个命令没有内容，因为它会自动把包裹在文本对象两边的字符删除。以刚刚修改过的 **"abc"** 为例，现在广告停留在字母 b 上，想要删除双引号，可以用 `sda"`。可以对比 `ad"` 这个命令，它会删除单词和单词两边的双引号，而 `sad"` 只会删除周围的双引号，因为 s 的含义是 surround。
3. `sr + Text Object + 替换后内容`：如果想把 **"abc"** 变成 **'abc'**，除了删除双引号再添加单引号外，还可以用 `sriw'`。 其中 sr 表示替换，`iw` 表示单词两边的字符，`'` 表示替换成单引号。同样效果的命令还有 `sra"'`，但 `sri"'` 无法达到预期效果，请读者自行思考。

这三种模式都需要我们手动选择 Text Object，在高级模式下，Text Object 会自动选择。插件会自动找到最近的，左右两个相同的字符，比如 **"Hello, (world), Hello"**，如果光标停留在单词 **world** 中，你的操作将对圆括号生效，否则则会对外层的双引号生效。

还是以 **"Hello, (world), Hello"** 这个模式为例，介绍高级模式下的用法。

1. `saa + 内容`: 假设光标停留在单词 **world** 上，按下 `saa'`，将会得到 **"Hello, ('world'), Hello"**
2. `srr + 内容`: 假设光标停留在单词 **hello** 上，按下 `srr'`，将会得到 **'Hello, (world), Hello'**
3. `sdd`：假设光标停留在单词 **world** 上，按下 `sdd`，将会得到 **"Hello, world, Hello"**
4. 如果想得到 **Hello, (world), Hello**，此时高级模式就无能为力了，只能用 `sda"`

总结一下：

1. 这个插件的核心是处理 Text Object 周围(Surround)的字符，所以命令都已 s 开头
2. 一共有三种处理方式，分别是添加(append)、替换(replace)和删除(delete)，对应命令 `sa`、`sr` 和 `sd`
3. 高级模式会自动选择 surrounding，所以命令更简单，但无法自定义哪一组 surrounding。

### Terminal

可以在 Vim 中直接打开终端，快捷键是 `t<Enter>`，会在底部打开一个 10 行高的终端。这个终端是一个单独的 Window，所以上述切换 Window 的规则同样适用。

此外，所有 iTerm 的配置和 .zshrc 的配置都会生效，功能非常强大，比如我们可以在 Vim 里面编辑脚本，在终端里面运行。

注意，这个终端也是个 Vim 窗口，所以输入状态下是无法切换 Window 的，要先按 <Esc> 退出编辑状态。

### NerdTree

在这份配置中，NerdTree 会在打开文件时自动打开，在关闭最后一个文件时自动关闭，也可以用 `;a` 手动打开

在 NerdTree 中，使用 `hjkl` 操作，`jk` 表示上下移动，`hl` 表示展开或者折叠文件夹。
表示展开或者折叠文件夹。

### TagBar

这个插件依赖于 ctags，在配置脚本中会自动安装，否则需要使用下面的命令来安装：

```shell
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
```

把我 TagBar 配置为启动时自动打开，手动打开的快捷键是 `<leader> + o`

### Commentary

选中一个部分后，按下 `<Leader> v` 即可注释，如果这部分已经注释，则上述做法的效果将是取消注释。

按下 `v` 会自动进入可视模式，再次按 `v` 会智能增加选中范围，但肯定不如手动选择来得精确

## 特定语言的支持

由于本项目使用 [dein](https://github.com/Shougo/dein.vim) 来管理插件，所以插件可以按需加载。比如下面这行配置：

```yaml
- { repo: vim-python/python-syntax, on_ft: python }
```

就表示 `python-syntax` 这个插件只在打开 Python 文件时才加载。

目前本项目提供了对 HTML/CSS/JS/Python/Go 语言的语法支持，我会逐步整理出来。

### Python

Python 的效果如图所示：

![](http://images.bestswifter.com/2018-01-13-5.39.32.png)

配置中主要用到了 [Python-mode] 这个插件，可以在 vim 中输入 `:help pymode` 查看更多选项和用法。对 Python 的拓展主要有以下几点：

1. 提供了基于语法的补全，这是 [deoplete-jedi](https://github.com/zchee/deoplete-jedi) 插件提供的能力
2. 提供了运行 Python 的能力，快捷键是 `rr`。r 的意思是 run，为了避免和替换(replace) 键冲突，所以需要快速按两次。
3. 提供了语法校验的能力，每次保存文件（Ctrl + S) 时会自动触发，当光标停留在有问题的那一行时，底部会有提示。
4. 文本对象(Text Object)的拓展，C 表示类（Class），M 表示方法（包括 Method 和 Function），所以想要删除整个函数时，可以用快捷键 `daM` 来处理


