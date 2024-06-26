@date: 2021-08-25
@title: Vim Showcase #2 - Text Motion
@language: en
@categories: linux, vim

 # Vim Showcase #2 - Text Motion
 
 Welcome to the second installment of the **"Vim Showcase"** series.
 
 Today, I've prepared some interesting vim default capabilities as well as plugins to
 enhance those capabilities to he maximum for even better experience. We will
 take a look at sorting, interacting with system clipboard and finally
 interacting with vim registers.
 
 ## Vim sort motion
 
 Vim allows its user to leverage the power of the shell utilities by typing
 `:!util-name`. This allows for a numerous possibilities for text editing as
 you can write special shell scripts to be used when needed.
 
 Sorting in a file is extremely useful when you need to order some collection
 of data after it has been gathered by some some script or simply to sorting a
 header file includes or function declarations for better readability.
 
 A easy way to sort some lines of text is to enter line-visual mode
 with `Shift+v`, select the lines you want to sort, then typing `:!sort`.
 
This plugin builds on top of this setup, by providing a sort motion for easy
access, without a need for visual mode, and more. It can be installed with:

        Plugin 'christoomey/vim-sort-motion'
        
The primary interface to this plugin is via the `gs` mapping, which stands for `go sort`, for sorting based
on a text object or motion. For example to sort 10 lines down, type: `gs10j`.

Where this plugin surpasses the shell variant is that it also provides a
capability of sorting comma separated lists of items. For example by typing
`gsi(` you can sort `(b, c, a)` to become `(a, b, c)`.

One other neat feature of this plugin is that, because it uses sort shell
function under the hood, it's possible to pass user specified flags for
different sort behavior. For example by adding the following line to `vimrc` sort will
become case insensitive and it will also remove duplicates:

        let g:sort_motion_flags = 'ui'
        
**Note**: This feature only works for linewise sorting

By passing an `n` flag it's possible to sort numbers by their value regardless of the length.

## System copy

Another great plugin by christoomey which defines `cp` to be copy motion and
`cv` as paste motion, allows you to easily copy and paste to and from system
clipboard without much hassle. Install it by adding:

    Plugin 'christoomey/vim-system-copy'
    
You will also need to have `xsel` installed from your terminal, as the plugin
needs a way to interact with the system clipboard, with `apt-get install xsel`
if you use Debian based distro, or `pacman -S xsel` if you use Arch based
distro. It's possible to change the program used, in case you prefer the other
one, with:

        let g:system_copy#copy_command='xclip -sel clipboard'
        let g:system_copy#paste_command='xclip -sel clipboard -o'

Also make sure to add the following line in order to get rid of the message
every time you use the plugin:

        let g:system_copy_silent = 1
        
Some examples:

- `cpiw` => copy word into system clipboard
- `cpi'` => copy inside single quotes to system clipboard
- `cvi'` => paste inside single quotes from system clipboard
- `cP`   => is mapped to copy the current line directly
- `cV`   => is mapped to paste the content of system clipboard to the next line


## Replace with Register

In the last section you saw how to interact with system clipboard. Now I am
going to talk about vim's built in registers.

Out of the box, vim provides place to store yanked text called register. To yank
the text use `y`, and to later put it use `p`. Vim provides multiple registers
whose content can be inspected with `:register`. To specify the register to be
used, prefix any yank or put command with `"name`, where name is a character
representing a specific register.

This plugin provides a motion to replace content of a text object with selected
register. The default biding is `gr`, which stands for `go replace`.

Some examples:

- `"2gri(` => replace the contents of the brackets with the content of register 2
- `griw` => replace the current word with the content of default register

This can also work with visual selections.

## Conclusion

Today, we had a look at some simple but powerful plugins. Because these plugins
are just new text motions they can be utilized with any text object showcased in the
previous article, so their use is truly limitless.
