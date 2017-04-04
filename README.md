# What is this

A shell script to help you set up development environment.

# How to install

Just execute:

```shell
curl https://raw.githubusercontent.com/bestswifter/macbootstrap/master/bootstrap.sh | sh
```

# Feature

First of all, it will install xcode command tool for you, which includes **git**.

## Homebrew

Then, you will install **homebrew** and some tools available from it. It includes:

* iterm(cask)
* sourcetree(cask)
* chrome(cask)
* wget
* gnu-sed
* cmake
* autojump
* node&npm
* ctags

## Git



## Vim

Plugins are included in `~/.vimrc`, you can change them according to your favor.

You can change configuration about vim itself in `~/.vim/bundle/vimrc/plugin/vimrc_wssq.vim`

Configuration about vim plugins are specified in `~/.vim/bundle/vimrc/self/PluginSetting.vim`

# What's next

- [x] Split vim plugin configuration out.
- [] Add keymap export/save for iTerm.
- [] Add keymap export/save for Snap.
- [] Add more npm packages
- [] Remove alias to number 1-9 in `~/.oh-my-zsh/lib/directories.zsh`, this is considered to be done in [h function](https://github.com/bestswifter/history)
- [] IMPORTANT: Add demo for this project to show the convenience and advantange of this project
