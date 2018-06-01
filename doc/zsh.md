所有 Zsh 相关的函数、配置（主要是对一些 Unix 函数的封装）都在 `zsh-config` 目录下

### bssclient: 命令行的 ss 客户端

配置文件位于 `~/.macbootstrap/config/shadowsocks.conf`，格式如下：

```conf
{
    "server":"server_ip",
    "server_port":443,
    "local_port":local_port,
    "password":"PSW",
    "timeout":600,
    "method":"aes-256-cfb"
}
```

用户需要自行修改服务器 IP、密码、本地和远程端口以及加密方式即可。然后运行 `bssclient` 即可后台运行。从此摆脱各种花哨的 GUI 工具。

### bsfn：方便的查找文件名

如果你想查找文件夹内的某个文件，可以使用 `find` 命令，但默认的 `find` 命令并不支持表达，所以我在 `personalized.sh` 文件中封装了 `bsfn` 函数，它接受一个参数，可以精确匹配，也可以写正则表达式：

![正则表达搜索文件](http://images.bestswifter.com/1491892266.png)

比如这里我们搜索所有**以 BBA 开头，中间字符不限，以 Plugin 结尾**的文件。

### proxy: 方便的切换和展示系统代理

如果想使用 Charles 抓包，则输入 `p on` 即可将系统的 HTTP 和  HTTPS 代理设置为 127.0.0.1:8888

如果想使用 Shadowsocks 科学上网，则输入 `p g` 即可将系统的 socks 代理设置为 localhost:14179，需要自行修改端口号

如果不想使用代理，输入 `p off` 可以禁用所有代理，恢复默认设置。

输入 `p s` 可以查看当前的系统代理。

![p 命令使用简介](https://o8ouygf5v.qnssl.com/1506333678.png)

### bssize：快速查看文件夹和文件大小

bssize 后面的参数可以是文件名，表示查看这个文件的大小。也可以是文件夹名，表示查看文件夹大小和文件夹内各子目录的大小。

`bssize .` 表示查看当前目录大小和子目录大小，`bssize /` 表示查看系统磁盘的使用情况。具体效果如图所示：

![](https://o8ouygf5v.qnssl.com/1506396195.png)

### realpath：显示绝对路径

安装脚本中已经通过 homebrew 安装了 `coreutils`，其中自带了 GNU 的 `realpath` 或者 `readlink -f` 命令：

```shell
realpath clean.sh
readlink -f clean.sh
# 输出结果都是 /Users/zxy/.macbootstrap/clean.sh
```

### resolution: 显示图片的分辨率

```shell
resolution path_to_image.png
# 输出结果是：4096 x 2048
```

### ssh: 依赖预先的配置

以登录搬瓦工为例，每次都需要输入端口号、IP 地址和 root 密码是一件效率极低的事，首先需要把我们的公钥复制到远程服务器上：

```shell
brew install ssh-copy-id # 如果用了我的这份配置，这个工具是已经安装过的
ssh-copy-id -i ~/.ssh/id_rsa.pub root@100.100.100.100 -p 12345
```

端口和 IP 地址需要自己填写，这里将是你最后一次接触到 Root 密码的地方，今后再用 ssh 登录时就不需要密码。然而每次还要记忆端和 IP 地址依然是一件麻烦的事情，得益于 `~/.ssh/config` 文件中的配置：

```
Host bwh
    HostName 172.96.215.73
    User root
    Port 27850
    IdentityFile ~/.ssh/id_rsa
```

只要简单的输入 `ssh bwh` 就可以登录了，再也不用担心多个 VPS 记不住了，而且这个配置文件仅仅记录了秘钥的位置，并不会泄露出来、

### show/hideFiles：显示(隐藏)文件

使用 `showFiles` 命令展示系统隐藏文件，`hideFiles` 命令恢复隐藏

### encoded64 和 urltoool

这几个小命令可以快速实现一些编码和解码工作：

```shell
encode64 你好
# 5L2g5aW9

decode64 5L2g5aW9
# 你好%

urlencode https://baidu.com
# https%3A%2F%2Fbaidu.com

urldecode https%3A%2F%2Fbaidu.com
# https://baidu.com
```

### ow 命令行中打开 Xcode 工程

如果当期目录下存在 xcodeproj 文件或者 xcworkspace 文件，可以用 ow 命令快速打开，如果要打开的工程在别的目录，则使用  `ow path_to_project` 的命令打开

如果 wcworkspace 和 Xcodeproj 文件同时存在，优先打开前者。

### x 快速解压

使用命令 `x` 可以快速解压任何压缩文件

### cal 终端日历

如果你的日历里没有，仅仅想查看日期，`cal` 这个命令就足够用了，它可以显示当前的日期、月份和星期。`cal -3` 可以显示当前月和前后一个月的日期，`cal -y` 可以显示当年的日期。

![](http://images.bestswifter.com/WX20171117-210346@2x.png)

### app2ipa 将 .app 转换为 .ipa

如果想把 xcodebuild 编译出来的 .app 文件转换成 .ipa，可以用这个命令：

```shell
app2ipa xxx.app
# /private/tmp/ipa/output.ipa
```

配合 `ideviceinstaller` 可以快速安装到手机上：

```shell
# brew install ideviceinstaller
app2ipa xxx.app | xargs ideviceinstaller -i 
```

###  bsof 检查端口占用

可以通过系统的 `lsof -i:port` 来检查哪个程序占用了 `port` 端口，但有时候我们不想记参数，或者想查找某个程序占用了哪些端口，此时可以使用 `bsof`。

比如查看 `redis` 进程占用了哪些端口，可以输入 `bsof redis`，查看哪些进程占用了 80 端口可以输入 `bsof :80`，如下图所示：

![](http://images.bestswifter.com/WX20171201-210038.png)


### 全局别名

1. 如果只想看某个输出的前 3 行，可以用 `cat xxx H 3`，这是因为 **H** 被全局重命名为 `| head -n`
2. 如果是看输出的后 3 行，可以用 `cat xxx T 3`，其中 **T** 被全局重命名为 `| tail -n`
3. 如果是看输出的指定行数，比如第 1、3、7 行，可以用 `cat xxx R 1 3 7`, 其中 **R** 被全局重命名为 `| row`
4. 如果要看某个输出的某几列，比如倒数第一列，可以用 `cat xxx C -1`，其中 **C** 被全局重命名为 `| column`
5. 如果要在 less 中查看某个超长的输出，可以用 `cat xxx L`，其中 **L** 被全局重命名为 `| L`
6. 如果要忽略某条命令的报错，可以用 `command NE`，其中 **NE** 被全局重命名为 `2> /dev/null`
7. 如果要某个命令完全不输出内容，可以用 `command NUL`，其中 **NUL**被全局重命名为 `> /dev/null 2>&1`

### ppjson 在终端中格式化 json

用法：

```shell
echo '{"hello": "world"}' | ppjson
```

### bubu 更新 Homebrew 安装的所有软件并删除旧的版本

这个命令封装了一些列琐碎的操作，可以放到 crontab 里面定时执行

### bsfilename

这个命令可以从完整的文件路径中获取不带后缀的文件名，比如

```shell
bsfilename ~/Desktop/test.py
# 输出结果: test
```

### bszip

这个命令可以快速压缩文件，用法 `bszip path_to_file`，它会读取要压缩的文件(夹)名，然后在当前目录生成同名的 zip 文件

### qn: 七牛图床上传工具

这个工具会自动把剪贴板里面的图片拷贝出来，存储为临时文件，上传后会自动删除。

使用这个工具前需要先配置七牛的 AK、SK，以及文件上传到哪个 Bucket 中，还有最终图床地址的前缀。

```shell
qnconf sk ak pictures http://images.bestswifter.com
```

以后每次截图完，只要输入命令 `qn`，图片就会自动上传并且把 Markdown 格式的地址拷贝到剪贴板中。

### xcodepath

如果你当前运行了 Xcode 进程，输入此命令可以快速查看 Xcode 可执行文件的路径

### bswhich

如果拿到别人的配置脚本，想自行定制。显然只知道定义是不够的，还得知道这个 alias 或者函数是在哪个文件里被定义的，这样才好去修改，此时建议使用我配置的 `bswhich` 命令：

```shell
bswhich ip
bswhich gg
```
