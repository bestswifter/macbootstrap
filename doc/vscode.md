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

## 我的快捷键

1. `cmd + 数字`：当光标停留在编辑器中时，打开第 n 个 Tab
2. `cmd + p`：快速搜索文件名，搜索范围是项目内的文件 + 最近打开的文件

## 插件的用法

### 前端相关

1. AutoRenameTag：当修改一个 Tag 时，自动修改与它对应的另一个 Tag。
