@title: Introducing stamd
@date: 2021-08-18
@language: en
@categories:     linux, c,        personal projects,

# Introducing stamd

Stamd or static markdown is, as the name suggests, a static markdown page
generator, written in C, that I'm developing for use in this blog.

As I write more articles the program will get streamlined and I you will be
informed of any big changes down the road.


## About

Motivated by [stagit](https://git.codemadness.org/stagit/), I've decided to take on this challenge
primarily because document parsing always fascinated me as well as to have a
complete control over to looks of articles the program produces.

I chose markdown as it's really simple and similar to HTML. I'm using it to
take personal notes in vim using vimwiki, which I am going to explain
in another article, so apart from already being familiar with it, I have some
snippets of content prepared and ready to share.


## Challenges

### List Items

The biggest challenge was parsing nested list items.<br>

- A standard list item is detonated with:
  + `-`
  + `*`
  + `+`
- There is unlimited number of nesting that can take place
  - Nesting No. 1
    - Nesting No. 2
      - Nesting No. 3
        - Nesting No. 4
  - After every nesting it is possible to return to any previous one
  1. Ordered lists can be present on the same level
  2. Like
  3. this
    1. Or they can be nested
    2. With other ordered,
    - Or Unordered variants
    * While using the different detonator on the same level
    + Must lead to new list being created

After a lot of thinking I've figured that in order to keep track of the nesting
level at any time, be able to return to the previous and create a new one, as
well as terminate all of the nesting at once on encountering a blank line, my
best bet is to use a stack to keep track of `<ol>`, `<ul>` and `<li>`, as well
as recursive function that calls itself for every new nesting level.

With this approach all of the heavy lifting is done by the recursion, which is
deepened by a bigger indent and returned by encountering a smaller one.

With a usage of global variables I am able to save the last recursion state
post return, and allow the lower level to continue like nothing has happened at
all.

Similar approach is taken to deal with nested `blockquotes` but with a different nesting detection and without a need to worry about the detonator


### Inline blocks

There are quite a few options when it comes to text and inline block:

- ~~Strikethrough~~, detonated by `~~text~~`
- **This is bold text**, detonated by `**text**`
- *This is italic text*, detonated by `*text*`
- __This is bold text__, detonated by `__text__`
- _This is italic text_, detonated by `_text_`
- [This is a link](https://dimitrijedobrota.com/), detonated by `[Text](Link)`

This is, again, solved by a simple recursion that takes the pointer to the start and the end of the text, and parses that section.

If the detonator is reached, it checks if its closed properly, in which case
recursive call is made to parse only the text between the opening and closing
tags, after which the parsing resumes normally from after the closing tags.



## Usage

The source code can be obtained using with:

    $ git clone git://git.dimitrijedobrota.com/stamd.git

After that we need to use `make` to install it:

```
$ cd ./stamd
$ make
$ sudo make install
```

This will install `stamd` and `stamd-index` to be used anywhere in the system.<br>
If we run the commands now we will get a hint about their usage:

```
$ stamd
  stamd [-o outdir] articledir
  
$ stamd-index
  stamd-index articledir articledir ...
```

`stamd` requires that the article directory is provided. It looks for
`article.md` and `config.txt` inside the article directory in order to create
the output HTML file.

Providing output directory is optional with `-o outdir`
and it instructs `stamd` to place the HTML file in specified directory. If the
directory is not provided output will be placed in article directory.

***

`stamd-index` takes in arbitrary number of article directories and writes, to
the standard output, the list of all the articles provided to be used as index
HTML file.

***

You will also receive `create_articles.sh` script which I use to bulk create all of the articles and sort them by date.

If you want to use it for yourself, you will need to edit `blogdir` and `sitedir` to match your setup, and after that you can simple run:

    $ ./create_articles.sh

***

Config file, as of now accepts Title, Date and Language option. Every option should start in a new line and general format is:

        Option: value
        
I am looking for a way to get rid of the config file in the future, so that all
of the necessary data can be extracted from the markdown file itself
        
