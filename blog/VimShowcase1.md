@date: 2021-08-20
@title: Vim Showcase #1 - Text Object
@language: en
@categories: linux, vim

# Vim Showcase #1 - Text Object
 
 Welcome to the new series called **"Vim Showcase"**
 
 In this series, as the title suggests, I am going to showcase vim and all of
 its wonderful features as well as plugins>
 
 Even though I am starting this series off by showcasing plugins, I will try to
 cover the vanilla vim as much as possible.
 
 I restrain myself from using too much plugins as I find vim really usable out
 of the box (with some tweaking of course), but sometimes it takes just a
 handful of small, lightweight plugins to enhance the vim experience and boost
 the writing speed by simplifying repetitive and tedious tasks.
 
 
## Introduction
 
 With vim being the editor with a primary focus on editing text, it's fair to
 say that it is filled to the brim with features that support that.

 Today I am going to present to you a few plugins that complement existing
 features as well as bust your productivity while writing.
 
 For the rest of the article I will assume that you know how to install vim plugins.
 
 If you are new to the world of vim plugins make sure to check out my previous
 article on how to install plugins with plugin manager. It can be found [HERE](https://dimitrijedobrota.com/articles/VimPugins.html)
 
 
## Textobj User by kana

This plugin is the base that all of the other plugins that I am about to showcase today are based on.

This plugin is, in essence, a framework that allows it's users to easily define
new text objects by helping you avoid common pitfalls as well as hiding all of
the tedious implementation details, allowing you to focus on the task at hand.

You can install it by putting the following line in your `vimrc`:

    Plugin 'kana/vim-textobj-user'
    
Instruction on how to use this plugin can be found on [Github](https://github.com/kana/vim-textobj-user),   

Before do so, it's a good idea to get a feel for what kind of functionality it
is used for  by reading ahead or full checking out the full list of other
plugins that depend on this one [here](https://github.com/kana/vim-textobj-user/wiki).
    
    
# Textobj Brace and Textobj Quotes

If you want to quickly change all of the parameters of a function, array
initialization or anything else that revolves around quotes or braces, vim has
you covered.

Text object 'Inside' or `i` is very powerful utility. It works with:

- Brackets: `(`, `[` and `{`
- Quotes: `'`, `"` and `&grave;`
- Tag: `t`

It allow you to use any motion and the contents of the brackets or quotes. You can delete, change, yank and more.

After a while, it gets tedious to always have to specify the exactly what you want to change. That's where these two plugins step in, and go one step further. The plugins provide the following set of binding:

- Brace:
    - `ij`: operate on the content between the closest pair of braces
    - `aj`: operate on the content between the closest pair of braces, including the braces
- Quotes:
    - `iq`: operate on the content between the closest pair of quotes
    - `aq`: operate on the content between the closest pair of quotes, including the quotes

Where these two plugins shine, apart from being able to target the surrounding itself, is that you don't even need to be inside the area to do the change.

It's easier to understand by looking at examples (the cursor is shown with `|`):

1. Before: `foo '1, |2, 3' bar`; after pressing `diq`: `foo '|' bar`
2. Before: `foo| '1, 2, 3' bar`; after pressing `diq`: `foo '|' bar`
3. Before: `foo '1, 2, 3' |bar`; after pressing `daq`: `foo | bar`

These plugins can be installed with:

    Plugin 'Julian/vim-textobj-brace'
    Plugin 'beloglazov/vim-textobj-quotes'
    
    
# Textobj Variable Segment

Renaming is an unavoidable part of any project, whether it be a CSS attribute
or a variable name, you often have to deal with `snake case` and `title case`
text, which can be a pain to do in vim. This plugin is here to solve that
problem.

It provides two bindings `iv` and `av` and their usage is illustrated in the example:

- Before: `foo_ba|r_baz`; after pressing `civ`: `foo_|_baz`
- Before: `QU|UX_SPAM`; after pressing `civ`: `|_SPAM`
- Before: `eggsAn|dCheese`; after pressing `civ`: `eggs|Cheese`
- Before: `_privat|e_thing`; after pressing `civ`: `_|_thing`

- Before: `foo_ba|r_baz`; after pressing `dav`: `foo_baz`
- Before: `QU|UX_SPAM`; after pressing `dav`: `SPAM`
- Before: `eggsAn|dCheese`; after pressing `dav`: `eggsCheese`
- Before: `_privat|e_thing`; after pressing `dav`: `_thing`


This plugin is installed with:

        Plugin 'Julian/vim-textobj-variable-segment'
        
        
# Textobj Parameter

When dealing with functions, changing names and types of the parameters is inevitable. To make that process more easy consider using this plugin.

Following the logic of the previous ones, this one allows you to change each of the parameter one by one. Look at the example:

`i,` to inner parameter object

```
function(param_a, param_b, param_c)
         |<--->|  |<--->|  |<--->|
```

`a,` to a parameter object including whitespaces and comma

```
function(param_a, param_b, param_c)
         |<----->|
function(param_a, param_b, param_c)
                |<----->|
function(param_a, param_b, param_c)
                         |<----->|
```

In addition, 'i2,' is similar to `a,` except trailing whitespace characters (especially for first parameter)

```
function(param_a, param_b, param_c)
         |<---->|
```

This plugin can be installed with:

        Plugin 'sgur/vim-textobj-parameter'
        
        
## Conclusion

Plugins showcased today are the great introductory plugins, as their are both
lightweight and provide only a handful of biding to remember while still
packing a good punch.

As you can see, all of these plugins share the same philosophy. They provide a
simple textobject to be used with any existing motion such as `d`, `c` or `y`.

After you feel comfortable with using these plugins I encourage you to check
out [this](https://github.com/kana/vim-textobj-user/wiki) link for even more plugins that provide similar functionality

If you feel particularly brave, you can try writing your own using Textobject
User API detailed
[here](https://github.com/kana/vim-textobj-user/blob/master/doc/textobj-user.txt)
