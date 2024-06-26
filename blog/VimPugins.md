@title: Vim Plugins - Installation guide
@language: en
@date: 2021-08-19
@categories: linux, vim

# Vim Plugins - Installation guide

In preparation for 'Vim Showcase' series, were I'll be showcasing plugins and other vim tricks, I've decided to dedicate this short
article to the process of setting up vim for installing plugins, as a reference to those of you who haven't done it already.

Vim is a great tool with a lot of amazing features that come out of the box.
Sometimes, though, a little push is needed to take the experience to a whole new level.

This article expects the readers to be familiar with running basic commands in
the terminal as well as basic vim knowledge including running vim commands.


## Introduction

- _What are vim plugins_?<br>
  Vim plugins are, in essence, scripts that are used to add new features to the
  editor or extend the already existing ones
- _What are plugins used for_?<br>
  Plugins are used to bring anything from color schemes to providing full fledged IDE-like features to vim editor.
- _How are vim plugins written?_<br>
  Vim plugins are written using Vim Script
- _What is Vim Script_?<br>
  Vim Script is a language used by vim for startup files, syntax files, plugins and any other configuration of the editor<br> 
  For more info you can reference [vim help](https://vim.help/41-write-a-vim-script)
- _How to get vim plugins_?<br>
  Staring from Vim 8 plugins are supported and should be placed in `~/.vim/pack/vendor/`.<br>
  There is also a possibility of using a plugin manager to streamline the process of installing, using, updating and removing plugins

  
In this article I am going to explain how to use [Vundle](https://github.com/VundleVim/Vundle.vim), short for vim bundle, as the plugin manager

As taken from their help page:
  
Vundle allows you to...

  - keep track of and configure your scripts right in the `.vimrc`
  - install configured scripts (a.k.a. bundle)
  - update configured scripts
  - search by name all available Vim scripts
  - clean unused scripts up
  - run the above actions in a single keypress with interactive mode

Vundle automatically...

  - manages the runtime path of your installed scripts
  - regenerates help tags after installing and updating


## Installing Vundle

In order to install Vundle `git` must be present on the system, which you can check by running:

    git
    bash: git: command not found

If you get `command not found` you will need to install it using your distribution package manager.

***

With that out of the way, we are ready to install Vundle. All you have to do is run:

     git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
     
     
After the Vundle has installed, there is a little configuration that needs to
be done, in order for vim to recognize Vundle and start loading the plugins

## Configuring Vundle

Open your `vimrc` file, which will most likely be `~/.vimrc`, and paste the following boilerplate code at the beginning:

```
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'   " leave as first item

" All of your Plugins must be added here

call vundle#end()            " required
filetype plugin indent on    " required"
```

This code ensures that Vundle is started with vim, and to keep track of the installed plugins.

**Note**: As the comment in the boilerplate suggests, all of the Plugins must be added
after `call vundle#begin()` and before `call vundle#end()` in order for them to
be recognized by Vundle, and not cause error when starting vim.


With this out of the way, we are ready to install some plugins


## Installing Plugins


To install a plugin from github, do the following:

1. Find the plugin you want to install and note the URL.<br> Example: `https://github.com/kana/vim-textobj-user`
2. Take the `author/name` portion of the URL.<br> In this case: `kana/vim-textobj-user`
3. Put `Plugin 'author/name'` in the designated area in `vimrc` file.<br> Example: `Plugin 'kana/vim-textobj-user'`

**Note**: To see all of the URLs supported, reference `:h vundle-plugins-uris`

After, we have put in the list of plugins we want, vim needs to be
reloaded.<br> We can do it by simply exiting and entering vim again or by running
`:source %` directly in vim.

Finally to instruct Vundle to download the necessary plugins run
`:PluginInstall`.<br> You will see a new window pop up on the side, with the
list of all the plugins, and each line will be highlighted one by one as the
plugin is being installed.

**Note**: This window can be closed like any other, using `:q` or `Ctrl + zz`.

After vim is restarted the plugin will be loaded and ready to use.

For any plugin specific configuration reference the specific usage guide.


## Vundle Commands

For reference purposes, I will list all of the commands that are available after configuring Vundle.

- `:PluginInstall`: Will install all plugins configured in your `.vimrc`. Newly installed plugins will be automatically enabled.
- `:PluginUpdatate`: Install or update the configured plugins.
- `:PluginSearch`: Search [Vim Scripts](http://vim-scripts.org/vim/scripts.html) for matching plugins.
- `:PluginClean`: Requests confirmation for the removal of all plugins no longer configured - in your `.vimrc` but present in your bundle installation directory.
- `:PluginList`: Displays a list of installed bundles.

**Note**: For more information about any of these commands, reference `:h command`


## Conclusion

With this one time setup out of the way, you are ready to explore the wonderful world of vim plugins.

Stay tuned for 'Vim Showcase' series to learn more about vim, and to discover some great vim plugins to boost your productivity.
