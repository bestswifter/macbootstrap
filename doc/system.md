# 这部分内容主要介绍对默认 OS X 系统所做的修改

有些配置无法立即生效，因此建议安装完以后注销再登录一次，即可看到效果

## 交换 F1-F12 与特殊按键

默认情况下，键盘上的 F1-F12 是特殊键，偏向娱乐，比如 F1、F2 调整亮度，F11、F12
调整声音等。但程序员没必要总是折腾这些。

其实 F1-F12 可以用作快捷键，但需要配合键盘左下角的 Fn
键一起按下。此脚本的作用是让 F1 键成为真正的 F1，如果调节亮度才需要 Fn + F1:

```shell
defaults write -globalDomain com.apple.keyboard.fnState -int 1
```

## 开启完全键盘控制

在 Mac OS 弹出的对话框中，经常需要切换选项：

![](http://blog.bestswifter.com/1515801904.png)

如图所示，默认选中的是左侧的选项，我们不用移动鼠标点击右边的选项，只要按下 <Tab>
键即可切换到右侧选项，再按下空格键就可以选中了。

以上特性需要完全开启键盘控制，由下面这行代码实现：

```shell
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
```

## 自动展示/隐藏 dock

在 Alfred 等软件中可以配置各个软件的全局打开快捷键，所以没必要一直显示着 Dock
去占用空间，可以设置为自动隐藏：

```shell
defaults write com.apple.dock autohide -bool true
```

## 显示电池电量百分比

使用这行命令可以显示电量百分比：

```shell
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
```

## 加速窗口大小调整动画

通过减少延迟时间，可以加速窗口大小调整时的动画：

```shell
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
```

## Finder 中总是显示文件名的后缀

再也不会因为后缀名被隐藏而造成烦恼了

```shell
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
```

## 禁用镜像文件验证

打开大的 DMG 文件时，验证过程也是蛮繁琐的，可以关闭：

```shell
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
```

## 启用触摸板轻触点击

再也不用咔擦咔擦狂戳触摸板了，轻轻触摸就起到了点击的作用，非常优雅：

```shell
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
```

## 显示~/Library/ 目录

这个目录默认是隐藏的，我们可以在不显示所有隐藏文件的前提下单独显示它：

```shell
chflags nohidden ~/Library
```
