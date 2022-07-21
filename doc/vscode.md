# VSCode 与快捷键

## 入门必备

必须要记住 `Command + Shift + P`，很多插件的命令都要从这里执行。首先按下这个键，然后输入 **"Shell"**，选择 **Install 'code' command in PATH**，这样我们就可以在命令行中通过 `code file_name` 命令来用 VSCode 打开文件了。

另一个必做的事情是进入插件界面，搜索 **Settings Sync** 插件并安装，它利用 Gist 来管理你的配置，这样你的配置会被永久保存并且跨设备使用，甚至还可以直接分享给朋友。

如果想使用我的 Gist，可以按下 `Command + Shift + P` 并输入 **Advanced Options**，选择第三个选项 **Download Setting from Public GIST**，这样你下载配置时就不再需要 Token 了，当然，也无法把修改后的配置上传，相当于只读模式。

然后再按下 `Command + Shift + P` 并选择 **Download Settings**，输入我的 Gist ID：e4e0667daf2dcd7f870880b7ddae5def 即可。

## 集成终端

VSCode 集成了一个终端，可以直接读取 .zshrc 中的配置（也就是说使用起来和 iTerm 几乎是一模一样的）。

相关快捷键有：

1. `cmd + \`： 水平切割，生成一个新的终端界面
2. `cmd + 数字`：当光标停留在终端时，通过数字来选择要聚焦的窗口
3. `cmd + w`：当光标停留在终端时，关闭当前终端
4. `cmd + t`：当光标停留在终端时，新建一个终端
5. `cmd + l`： 在 VSCode 内嵌的终端和代码编辑器中互相切换，再也不用跳出到 iTerm 了
6. `ctrl + \``：隐藏/展示 终端

## VSCode 快捷键

1. `cmd + E`：隐藏/显示侧边栏（资源管理器）
2. `cmd + shift + E`：在侧边栏和编辑器之间切换焦点
3. `cmd + J`：显示隐藏底部 Panel
4. `cmd + D`：显示/隐藏 输出
5. `Shift + Option + F`：格式化文件（各种类型的文件需要对应插件的支持）
6. `cmd + B`：美化（Beautify）
7. `cmd + shift + X`：打开 Extension 列表
8. `cmd + shift + D`：打开 Debug 列表
9. `cmd + shift + F`：打开 Search 列表
10. `cmd + 数字`：当光标停留在编辑器中时，打开第 n 个 Tab

## 代码相关通用快捷键

1. `ctrl + ]`：跳转到定义
2. `ctrl + O`：光标回到上一次的位置
3. `cmd + p`：快速搜索文件名，搜索范围是项目内的文件 + 最近打开的文件
4. `cmd + H`：显示 Hover，相当于模拟光标停在这个位置，可以查看某些函数的定义

## Vim

### Vim 原生功能拓展

1. `jj/kk/hh/ll`：在插入模式下，快速按下两次 `h` 或 `j` 或 `k` 或 `l` 相当于按下 `Esc` 退出到普通模式
2. `Ctrl + x`：保存并关闭文件
3. Leader 键是 `;`

### EasyMotion

1. `; + s` 搜索字母并跳转

### Surround

1. `ds"`：删除光标两侧的 `"`，比如 **"Hello"** -> **Hello**
2. `cs"'`：把光标两侧的 `"` 改为 `'`，比如 **"Hello"** -> **'Hello'**
3. `cs"t + tag_name`：把光标两侧的 `"` 改为 `<tag_name>`，比如 **"Hello"** -> **<tag_name>Hello<tag_name>**
4. `ysaw(`：在当前的单词两侧加上括号，比如 **Hello** -> **(Hello)**

### Commentary

1. `gc`：注释当前行
2. `gCi)` 注释括号内的所有行

## 插件的用法

### 综合性插件

1. [Dash](https://marketplace.visualstudio.com/items?itemName=deerawan.vscode-dash)

    按下 `ctrl + H` 会自动在 dash 中搜索当前光标下的单词
    按下 `option + H` 会打开 dash 搜索自定义的单词

2. [Beautify](https://github.com/HookyQR/VSCodeBeautify)

    按下 `cmd + B` 会美化当前文件，尤其适用于 JSON/HTML/CSS/JS 这类文件

3. [Project-Manager](https://marketplace.visualstudio.com/items?itemName=alefragnani.project-manager)

### 前端相关

1. AutoRenameTag：当修改一个 Tag 时，自动修改与它对应的另一个 Tag。
